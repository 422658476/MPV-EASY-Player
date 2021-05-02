--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
--注意：文件每次都会覆盖后重新生成
--编写时需要注意js和lua之间的语法区别
--此脚本用于让mpv生成当前的配置，然后给mpv-easy player.exe下次运行时调用和修改原始配置
local utils = require 'mp.utils'
--获取mpv.conf中已经写死的input-conf的值：路径+文件名
local input_conf_dirfile = mp.get_property("input-conf")
--utils.split_path(path)会把路径+文件名拆分并返回2个值，分别是路径和文件名，路径末尾带有\
--返回值中只要用第1个     x = f1()   --x="a","b"被忽略    x,y = f1() --x="a",y="b"
local other_conf_dir = utils.split_path(input_conf_dirfile)
local other_conf_dirfile = other_conf_dir .. "other.conf"
local conf_string = "[ini-rjno1]\r\nvolume-auto-safe="


function save_all_to_conf()

volume_value = mp.get_property("volume")
--floor() 方法执行的是向下取整计算，它返回的是小于或等于函数参数 比如20.0000-> 20
--file://.//data//mpv-easy-data//other.conf也可
volume_value_fix = math.floor(volume_value)
--mp.command("show-text xx"..volume_value_fix.."==")
--w	打开只写文件，若文件存在则文件长度清为0，即该文件内容会消失。若文件不存在则建立该文件。
file = io.open(other_conf_dirfile, "w")
-- 在文件最后一行添加
file:write(conf_string..volume_value_fix)
file:close()

end

function other_conf(event) 
save_all_to_conf()
--此处可以写其他不同的代码
end


function change(name, param)
save_all_to_conf()
--此处可以写其他不同的代码
end

--参数改变时保存值，多进程调整参数后播放另一个时有用
mp.observe_property( "volume", "number", change)

--播放结束时保存值，多进程时a窗口调整参数后关闭在关闭b窗口时有用
mp.register_event("end-file", other_conf)

