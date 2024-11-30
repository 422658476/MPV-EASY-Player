--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
local opts = require 'mp.options'

--默认设置
local settings = {
	language = "en-us" ,
	
--修改鼠标左键和中键的命令
--mouse_left= pause | ignore;  mouse_left默认pause    【MBTN_LEFT cycle pause】【MBTN_LEFT ignore】
--mouse_mid = ignore | quit;  mouse_mid默认ignore     【MBTN_MID ignore】【MBTN_MID quit-watch-later】
	mouse_left = "pause",
	mouse_mid = "ignore",
	
--默认en-us时show-text显示的文字---------------

	default_volume_value = "",
	default_cycle_sub_value = "",
	default_cycle_audio_value = "",
	
	default_contrast_value = "",
	default_brightness_value = "",
	default_gamma_value = "",
	default_saturation_value = "",
	
--默认en-us时show-text显示的文字---------------



}

--读取.conf设置文件中的设置
opts.read_options(settings, "default-input")

--add_key_binding绑定的键和功能能够被input.conf中相同键添加的命令覆盖

--修改鼠标左键和中键的命令------
if settings.mouse_left =="pause" then
	mp.add_key_binding("MBTN_LEFT", "mouse_left_1",  function() mp.command("cycle pause") end)

else
	mp.add_key_binding("MBTN_LEFT", "mouse_left_2",  function() mp.command("ignore") end)

end

if settings.mouse_mid =="ignore" then
	mp.add_key_binding("MBTN_MID", "mouse_mid_1",  function() mp.command("ignore") end)

else
	mp.add_key_binding("MBTN_MID", "mouse_mid_2",  function() mp.command("quit-watch-later") end)

end
--修改鼠标左键和中键的命令------


--默认zh-cn时改变show-text显示的文字---------------
if settings.language =="zh-cn" then

	settings.default_volume_value = "show-text \"音量:${volume}%\""
	settings.default_cycle_sub_value = "show-text \"字幕切换为:${sub}\""
	settings.default_cycle_audio_value = "show-text \"音轨切换为:${audio}\""

	settings.default_contrast_value = "show-text \"对比度:${contrast}\""
	settings.default_brightness_value = "show-text \"亮度:${brightness}\""
	settings.default_gamma_value = "show-text \"伽马:${gamma}\""
	settings.default_saturation_value = "show-text \"饱和度:${saturation}\""

else


end

--add_key_binding绑定的键和功能能够被input.conf中相同键添加的命令覆盖

--鼠标和键盘音量+
mp.add_key_binding("WHEEL_UP", "default_volume_up_a",  function() mp.command("add volume 2;"..settings.default_volume_value) end)
mp.add_key_binding("0", "default_volume_up_b",  function() mp.command("add volume 2;"..settings.default_volume_value) end, "repeatable")

--鼠标和键盘音量-
mp.add_key_binding("WHEEL_DOWN", "default_volume_down_a",  function() mp.command("add volume -2;"..settings.default_volume_value) end)
mp.add_key_binding("9", "default_volume_down_b",  function() mp.command("add volume -2;"..settings.default_volume_value) end, "repeatable")

--字幕和音轨切换
mp.add_key_binding("ctrl+f", "default_cycle_sub",  function() mp.command("cycle sub;"..settings.default_cycle_sub_value) end)
mp.add_key_binding("ctrl+g", "default_cycle_audio",  function() mp.command("cycle audio;"..settings.default_cycle_audio_value) end)

--方向键跳转进度
mp.add_key_binding("RIGHT", "default_seek_up",  function() mp.command("seek  10") end, "repeatable")
mp.add_key_binding("LEFT", "default_seek_down",  function() mp.command("seek  -10") end, "repeatable")
mp.add_key_binding("UP", "default_seek_up_up",  function() mp.command("seek  60") end, "repeatable")
mp.add_key_binding("DOWN", "default_seek_down_down",  function() mp.command("seek  -60") end, "repeatable")

--对比度
mp.add_key_binding("2", "default_contrast_up",  function() mp.command("add contrast 1;"..settings.default_contrast_value) end, "repeatable")
mp.add_key_binding("1", "default_contrast_down",  function() mp.command("add contrast -1;"..settings.default_contrast_value) end, "repeatable")

--亮度
mp.add_key_binding("4", "default_brightness_up",  function() mp.command("add brightness 1;"..settings.default_brightness_value) end, "repeatable")
mp.add_key_binding("3", "default_brightness_down",  function() mp.command("add brightness -1;"..settings.default_brightness_value) end, "repeatable")

--伽马
mp.add_key_binding("6", "default_gamma_up",  function() mp.command("add gamma 1;"..settings.default_gamma_value) end, "repeatable")
mp.add_key_binding("5", "default_gamma_down",  function() mp.command("add gamma -1;"..settings.default_gamma_value) end, "repeatable")

--饱和度
mp.add_key_binding("8", "default_saturation_up",  function() mp.command("add saturation 1;"..settings.default_saturation_value) end, "repeatable")
mp.add_key_binding("7", "default_saturation_down",  function() mp.command("add saturation -1;"..settings.default_saturation_value) end, "repeatable")





