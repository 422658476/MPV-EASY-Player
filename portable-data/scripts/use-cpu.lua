--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
--local msg = require("mp.msg")

--如果视频的宽度大于3000或者视频的高度大于2000，那么自动切换回使用cpu解码
function use_cpu_or_gpu(w_num,h_num)
	local hwdec_value = mp.get_property("hwdec")
	local hwdec_format = mp.get_property("video-format")
	local which_bigger = ""
	if w_num > 0 then
		which_bigger = "width=" .. w_num
	else
		which_bigger = "heigth=" .. h_num
	end

	if hwdec_format == "hevc" then
	--视频使用的是h.265视频格式
		--h.265如果导致cpu 100% gpu不会100%，那么自动切换到使用gpu
		if hwdec_value == "no" then
		--正在使用cpu
			mp.set_property("hwdec", "auto-safe")
			mp.command("show-text \"" .. which_bigger .. " video:${video-format} switch to GPU\"")
		else
			mp.command("show-text \"" .. which_bigger .. " video:${video-format} using GPU\"")
		end
	else
	--视频使用的是非h.265视频格式,比如h.264
		--非h.265视频格式,比如h.264，如果导致cpu不会100% gpu 100%，那么自动切换到使用cpu解码
		if hwdec_value == "no" then
		--正在使用cpu
			mp.command("show-text \"" .. which_bigger .. " video:${video-format} using CPU\"")
		else
			mp.set_property("hwdec", "no")
			mp.command("show-text \"" .. which_bigger .. " video:${video-format} switch to CPU\"")
		end
	end
end

function w_change(name, value)
	--注意width的值可能等于nil，如果没有做这个判断，那么lua会报错和脚本无法使用， 可以使用require("mp.msg")查看错误
	if value ~= nil then
		if value >= 3000 then
		 	use_cpu_or_gpu(value,0)
		end
	end
end

function h_change(name, value)
	--注意width的值可能等于nil，如果没有做这个判断，那么lua会报错和脚本无法使用， 可以使用require("mp.msg")查看错误
	if value ~= nil then
		if value >= 2000 then
			 use_cpu_or_gpu(0,value)
		end
	end
end


mp.observe_property( "width", "number", w_change)
--mp.observe_property( "height", "number", h_change)
