--此lua脚本由软件No1编写并提供支持
--This lua script is written by www.rjno1.com
local utils = require 'mp.utils'
local input_conf_dirfile = mp.get_property("input-conf")
--utils.split_path(path)会把路径+文件名拆分并返回2个值，分别是路径和文件名，路径末尾带有\
--返回值中只要用第1个     x = f1()   --x="a","b"被忽略    x,y = f1() --x="a",y="b"
local cover_art_dir = utils.split_path(input_conf_dirfile)
local cover_art_dirfile = cover_art_dir .. "default-cover-art"

-- 1. 定义允许的后缀集合（使用 true 作为值，方便 O(1) 复杂度查找）,注意一定要小写
local allowed_extensions = {
    mp3 = true,
    m4a = true,
    aac = true,
    wma = true,
    ogg = true,
    flac = true,
    ape = true,
    alac = true,
    wav = true,
    alac = true,
    aiff = true,
    ac3 = true
}

-- 2. 判断函数
local function is_valid_audio(filename)
	-- 提取最后一个 "." 后面的所有字符
	filename = tostring(filename)
    local ext = string.match(filename, "%.([^%.]+)$")
    
    if not ext then
        return false
    end
    
    -- 转为小写，防止因大小写不一致（如 .MP3）导致匹配失败
    ext = string.lower(ext)
    
    -- 检查是否在允许的集合中
    return allowed_extensions[ext] == true
end

-- 3. 测试用例
--print(is_valid_audio("music.mp3"))     --> true
	--mp.set_property("cover-art-files" , cover_art_dirfile)


function on_start_file(event)

	--文件名每次加载都要获取一次
	local file_name = mp.get_property_native("filename")
	--print("-----file_name-----=" .. tostring(file_name))

	if is_valid_audio(file_name) == true  then
	
		mp.set_property("cover-art-files" , cover_art_dirfile)
		--print("-----mp.set_property-----=" .. tostring(mp.set_property("cover-art-files" , cover_art_dirfile)))
		
	end
	
end



--start-file时,注意file-loaded时设置cover-art-files无效，因为太晚了
mp.register_event("start-file", on_start_file)
