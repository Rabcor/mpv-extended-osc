-- Best used in combination with the following settings:
--		save-watch-history=yes -- This script does not work without this setting!
--		save-position-on-quit=yes -- Having this on makes the opened file start where you stopped. This is already default.
-- 		autocreate-playlist=filter -- Create a playlist from the files around the file that's opened automatically.
-- 		directory-mode=ignore -- Prevent auto-created playlist from opening files in subdirectories.
-- 		directory-filter-types=video -- Make sure the auto-created playlist only adds videos to the list.

options = {
	-- Automatically play the last played file when mpv is opened without a file argument.
	play_last_file = false,	
	
	-- If play_last_file is false or no valid file was found, open the watch history list.
	auto_open_history = true,	
	
	-- Prevent files in these directories from being opened automatically, bar (|) separated full or partial paths.
	excluded_paths = "",
	
	-- Prevent files in excluded_paths directories from being added to the watch-history at all.
	gatekeep_history = true,
}

local utils = require "mp.utils"
mp.options = require "mp.options"
mp.options.read_options(options)

local last_valid_file = nil

-- Parse excluded paths
local excluded_paths = {}
for str in string.gmatch(options.excluded_paths, "([^|]+)") do
    excluded_paths[#excluded_paths + 1] = str
end

local function excluded(file)
	for _, path in pairs(excluded_paths) do
		if string.match(file, "^" .. tostring(path)) then
			return true
		end
	end
	return false
end

local function get_last_file()
    local history_file_path = mp.command_native(
        {"expand-path", mp.get_property("watch-history-path")})
    local history_file, error_message = io.open(history_file_path)
    if not history_file then
    	mp.msg.info("Watch-history file not found.")
        return
    end

	local all_entries = {}
    local line_num = 1
    for line in history_file:lines() do
        local entry = utils.parse_json(line)
        if entry and entry.path then
            if not excluded(entry.path) then
            	all_entries[#all_entries + 1] = entry
            end
        else
            mp.msg.warn(history_file_path .. ": Parse error at line " .. line_num)
        end
        line_num = line_num + 1
    end
    mp.msg.info("Penis")
    history_file:close()
    for i = #all_entries, 1, -1 do
    	exists = io.open(all_entries[i].path)
    	if exists then
    		exists.close()
        	return all_entries[i].path
        end
    end
    return nil
end

local function gatekeep()
	if options.gatekeep_history then
		local file = mp.get_property_native("path")
		if excluded(file) then
			mp.set_property_bool("save-watch-history", false)
		-- Ungatekeep for allowed files, if mpv.conf is configured to save history.
		elseif mp.get_property_native("config") and not mp.get_property_native("save-watch-history") then
			local config = io.open(mp.find_config_file("mpv.conf"))
			if config then
				for line in config:lines() do
					if line:find("save-watch-history=yes", 1, true) then
						mp.set_property_bool("save-watch-history", true)
						break
					end
				end
				config.close()
			end
		end
	end
end

-- If the player is opened without a file
if (mp.get_property_number('playlist-count', 0) == 0) then
	if options.play_last_file then
		last_valid_file = get_last_file()
		if last_valid_file then
			mp.commandv("loadfile", last_valid_file)
		elseif options.auto_open_history then
			mp.command("script-message-to select select-watch-history")
		end
	elseif options.auto_open_history then
		mp.command("script-message-to select select-watch-history")
	end
end

mp.register_event("start-file", gatekeep)
