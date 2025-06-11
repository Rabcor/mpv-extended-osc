-- Sourced from: https://github.com/mpv-player/mpv/issues/4738#issuecomment-321298846

function chapter_seek(direction)
    local chapters = mp.get_property_number("chapters")
    local chapter  = mp.get_property_number("chapter")
    if chapter == nil then chapter = 0 end
    if chapters == nil then chapters = 0 end
    if chapter+direction < 0 then
        mp.command("playlist_prev")
    elseif chapter+direction >= chapters then
        mp.command("playlist_next")
    else
        mp.commandv("osd-msg", "add", "chapter", direction)
    end
end

-- Call from input.conf with script-message-to betterchapters chapter_next
mp.register_script_message("chapter_next", function() chapter_seek(1) end)
mp.register_script_message("chapter_prev", function() chapter_seek(-1) end)
