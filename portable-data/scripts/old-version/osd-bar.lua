--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
--只有这么传输命令，在一直显示osd-bar时才能不对其他lua脚本文字的显示和其他操作时osd文字的显示产生干扰和闪烁
local osd_duration_value = mp.get_property_osd("osd-duration")
local osd_duration_value_second = osd_duration_value / 1000
local osd_bar_value = mp.get_property_osd("osd-bar")
local osd_level_value = mp.get_property_osd("osd-level")


if osd_bar_value ~= "no" and osd_level_value >= "1" then
--这一行是为了运行后就立刻显示osd-bar，而不是等待osd_duration_value_second秒后才开始一直显示
		mp.command("osd-bar show-progress")
	osd_bar_show_forever = mp.add_periodic_timer( osd_duration_value_second, function()
		mp.command("osd-bar show-progress")
		osd_bar_show_forever:resume()
	end)

end
