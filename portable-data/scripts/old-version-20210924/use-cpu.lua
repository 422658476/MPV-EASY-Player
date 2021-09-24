--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com


--local msg = require("mp.msg")

--如果视频的宽度大于3000或者视频的高度大于2000，那么自动切换回使用cpu解码

function w_change(name, value)
	--注意width的值可能等于nil，如果没有做这个判断，那么lua会报错和脚本无法使用， 可以使用require("mp.msg")查看错误
	if value ~= nil then
		if value >= 3000 then
			local hwdec_value = mp.get_property("hwdec")
			if hwdec_value == "no" then
			--正在使用cpu，无需任何操作
			else
				mp.set_property("hwdec", "no")
				mp.command("show-text \"width>3000 using cpu\"")
			end
		end
	end

end

function h_change(name, value)
	--注意width的值可能等于nil，如果没有做这个判断，那么lua会报错和脚本无法使用， 可以使用require("mp.msg")查看错误
	if value ~= nil then
		if value >= 2000 then
			local hwdec_value = mp.get_property("hwdec")
			if hwdec_value == "no" then
			--正在使用cpu，无需任何操作
			else
				mp.set_property("hwdec", "no")
				mp.command("show-text \"height>2000 using cpu\"")
			end
		end
	end
	
end


mp.observe_property( "width", "number", w_change)
mp.observe_property( "height", "number", h_change)
