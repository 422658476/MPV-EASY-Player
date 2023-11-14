--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
--local opts = require 'mp.options'
--local assdraw = require 'mp.assdraw'
--local msg = require 'mp.msg'
--local utils = require 'mp.utils'
--vo=gpu的时候gpu-api=opengl才会生效，vo=direct3d不支持过滤器，切换到opengl画面不会改变
local gpu_api_value_string = "opengl"

--function file_loaded(event)
		mp.set_property("vo", "gpu")
		mp.set_property("gpu-api", gpu_api_value_string)

--end

--加载文件时
--mp.register_event("file-loaded", file_loaded)

function changed(name, string_value)

		if string_value == gpu_api_value_string then
			mp.command("show-text \"【success】gpu-api = "..string_value.." \"")
		else
			mp.command("show-text \"【error】gpu-api = "..string_value.." \"")
		end

end

--参数改变时
mp.observe_property( "gpu-api", "string", changed)
