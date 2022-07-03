--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
local opts = require 'mp.options'
--local assdraw = require 'mp.assdraw'
--local msg = require 'mp.msg'
--local utils = require 'mp.utils'

local settings = {
	noplayback = "yes" ,
}

--此function针对自动加载为播放列表，file-loaded是autoload使用start-file之后的行为
--针对直接播放m3u文件的行为不由此lua脚本处理
function file_loaded(event)
	local plen = mp.get_property_number("playlist-count", 0)
	if plen >= 2 then
		mp.set_property("resume-playback", "no")
		--mp.command("show-text 1" .. plen)
	else
		--mp.command("show-text 2" .. plen)
	end
end

--此function针对拖放、手动添加为播放列表及播放列表的删减行为
function resume_playback_change(name, param)
	if param >= 2 then
		mp.set_property("resume-playback", "no")
		--mp.command("show-text 3" .. param)
	else
		--mp.command("show-text 4" .. param)
	end
end

opts.read_options(settings, "playlistnoplayback")

local save_position_on_quit_value = mp.get_property("save-position-on-quit")

if settings.noplayback =="yes" and save_position_on_quit_value == "yes" then

		mp.register_event("file-loaded", file_loaded)
		mp.observe_property( "playlist-count", "number", resume_playback_change)

else

end

