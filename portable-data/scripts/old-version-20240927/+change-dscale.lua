--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
--local opts = require 'mp.options'
--local assdraw = require 'mp.assdraw'
--local msg = require 'mp.msg'
--local utils = require 'mp.utils'
--改变mpv缩小图像时使用的过滤器
local dscale_value_string = "lanczos"

function file_loaded(event)
		mp.set_property("dscale", dscale_value_string)
end

--加载文件时
mp.register_event("file-loaded", file_loaded)

function changed(name, string_value)

		if string_value == dscale_value_string then
			mp.command("show-text \"【success】dsacle = ${dscale} \"")
		else
			mp.command("show-text \"【error】dsacle = ${dscale} \"")
		end

end

--参数改变时
mp.observe_property( "dscale", "string", changed)
