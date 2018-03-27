local settings = {

  -- #### FUNCTIONALITY SETTINGS

  --replaces matches on filenames based on extension, put as empty string to not replace anything
  --replace rules are executed in provided order
  --replace rule key is the pattern and value is the replace value
  --uses :gsub('pattern', 'replace'), read more http://lua-users.org/wiki/StringLibraryTutorial
  --'all' will match any extension or protocol if it has one
  --uses json and parses it into a lua table to be able to support .conf file
  
  filename_replace = "",

--[=====[ START OF SAMPLE REPLACE, to use remove start and end line
  --Sample replace: replaces underscore to space on all files
  --for mp4 and webm; remove extension, remove brackets and surrounding whitespace, change dot between alphanumeric to space
  filename_replace = [[
    [
      {
        "ext": { "all": true},
        "rules": [
          { "_" : " " }
        ]
      },{
        "ext": { "mp4": true, "mkv": true },
        "rules": [
          { "^(.+)%..+$": "%1" },
          { "%s*[%[%(].-[%]%)]%s*": "" },
          { "(%w)%.(%w)": "%1 %2" }
        ]
      },{
        "protocol": { "http": true, "https": true },
        "rules": [
          { "^%a+://w*%.?": "" }
        ]
      }
    ]
  ]],
--END OF SAMPLE REPLACE ]=====]

  --json array of filetypes to search from directory
  loadfiles_filetypes = [[
    [
      "mkv", "avi", "mp4", "ogv", "webm", "rmvb", "flv", "wmv",
      "mpeg", "mpg", "m4v", "3gp","mp3", "wav", "ogv", "flac",
      "m4a", "wma", "jpg", "gif", "png", "jpeg", "webp"
    ]
  ]],

  --loadfiles at startup if there is 0 or 1 items in playlist, if 0 uses worḱing dir for files
  loadfiles_on_start = false,

  --sort playlist on mpv start
  sortplaylist_on_start = false,

  --sort playlist when files are added to playlist
  sortplaylist_on_file_add = false,

  --use alphanumerical sort
  alphanumsort = true,

  --linux=true, windows=false
  linux_over_windows = false,

  --path where you want to save playlists. Do not use shortcuts like ~ or $HOME
  playlist_savepath = "/home/anon/Documents/",


  --show playlist or filename every time a new file is loaded 
  --2 shows playlist, 1 shows current file(filename strip applied) as osd text, 0 shows nothing
  --instead of using this you can also call script-message playlistmanager show playlist/filename
  --ex. KEY playlist-next ; script-message playlistmanager show playlist
  show_playlist_on_fileload = 0,

  --sync cursor when file is loaded from outside reasons(file-ending, playlist-next shortcut etc.)
  --has the sideeffect of moving cursor if file happens to change when navigating
  --good side is cursor always following current file when going back and forth files with playlist-next/prev
  sync_cursor_on_load = true,

  --keybindings force override only while playlist is visible
  --allowing you to use common overlapping keybinds
  dynamic_binds = true,

  --playlist open key will toggle visibility instead of refresh, best used with long timeout
  open_toggles = true,

  --allow the playlist cursor to loop from end to start and vice versa
  loop_cursor = true,


  --####  VISUAL SETTINGS

  --prefer to display titles over filenames, sorting will still use filename to stay pure
  prefer_titles = false,

  --osd timeout on inactivity, with high value on this open_toggles is good to be true
  playlist_display_timeout = 5,

  --amount of entries to show before slicing. Optimal value depends on font/video size etc.
  showamount = 16,

  --font size scales by window, if false requires larger font and padding sizes
  scale_playlist_by_window=true,
  --playlist ass style overrides inside curly brackets, \keyvalue is one field, extra \ for escape in lua
  --example {\\fnUbuntu\\fs10\\b0\\bord1} equals: font=Ubuntu, size=10, bold=no, border=1
  --read http://docs.aegisub.org/3.2/ASS_Tags/ for reference of tags
  --undeclared tags will use default osd settings
  --these styles will be used for the whole playlist. More specific styling will need to be hacked in
  style_ass_tags = "{\\an7}",
  --paddings from top left corner
  text_padding_x = 10,
  text_padding_y = 10,

  --set title of window with stripped name
  set_title_stripped = false,
  title_prefix = "MPV-EASY Player",
  title_suffix = " - mpv",

  --slice long filenames, and how many chars to show
  slice_longfilenames = false,
  slice_longfilenames_amount = 70,

  --Playlist header for info you want
  --%mediatitle or %filename = title or name of playing file
  --%pos = position of playing file
  --%cursor = position of navigation
  --%plen = playlist length
  --%N = newline
  --playlist_header_0 = "键盘操作方式: [上][下]:选择或选中某项后调整选中项顺序  [p]:重新排序",
  --playlist_header_1  = "[k]:保存高级播放列表  [右]:选中/不选中  [左]:移除当前项目  [回车]:播放当前项目",
  playlist_header = "正在播放: %filename%N%N高级播放列表 - %cursor/%plen",

  --playlist display signs, prefix is before filename, and suffix after
  --currently playing file 
  playing_str_prefix = "▷ - ",
  playing_str_suffix = "",

  --cursor is ontop of playing file
  playing_and_cursor_str_prefix = "▶ - ",
  playing_and_cursor_str_suffix = "",

  --cursor file prefix and suffix
  cursor_str_prefix = "● - ",
  cursor_str_suffix ="",

  --non cursor file prefix and suffix
  non_cursor_str_prefix = "○ - ",
  non_cursor_str_suffix = "",

  --when you select a file
  cursor_str_selected_prefix = "● = ",
  cursor_str_selected_suffix = "",

  --when currently playing file is selected
  playing_str_selected_prefix = "▶ = ",
  playing_str_selected_suffix = "",

  --top and bottom if playlist entries are sliced off from display
  playlist_sliced_prefix = "...",
  playlist_sliced_suffix = "...",

  --show file playlistnumber before filename ex 01 - ▷ - file.mkv
  show_prefix_filenumber = true,
  --show playlistnumber before other prefixes
  show_prefix_filenumber_first = false,
  --prefix and suffix will be before and after the raw playlistnumber
  prefix_filenumber_prefix = '',
  prefix_filenumber_suffix = ' - '

}
local opts = require("mp.options")
opts.read_options(settings, "playlistmanager")

local utils = require("mp.utils")
local msg = require("mp.msg")
local assdraw = require("mp.assdraw")

--parse filename json
if(settings.filename_replace~="") then
  settings.filename_replace = utils.parse_json(settings.filename_replace)
else
  settings.filename_replace = false
end

--parse loadfiles json
settings.loadfiles_filetypes = utils.parse_json(settings.loadfiles_filetypes)

--global variables
local playlist_visible = false
local strippedname = nil
local path = nil
local directory = nil
local filename = nil
local pos = 0
local plen = 0
local cursor = 0
--table for saved media titles for later if we prefer them
local url_table = {}
--state for if we sort on playlist size change
local sort_watching = false

function on_loaded()
  filename = mp.get_property("filename")
  path = mp.get_property('path')
  --if not a url then join path with working directory
  if not path:match("^%a%a+:%/%/") then
    path = utils.join_path(mp.get_property('working-directory'), path)
    directory = utils.split_path(path)
  else
    directory = nil
  end
  
  refresh_globals()
  if settings.sync_cursor_on_load then
    cursor=pos
    --refresh playlist if cursor moved
    if playlist_visible then draw_playlist() end
  end

  strippedname = stripfilename(mp.get_property('media-title'))
  if settings.show_playlist_on_fileload == 2 then
    showplaylist()
  elseif settings.show_playlist_on_fileload == 1 then
    mp.commandv('show-text', strippedname)
  end
  if settings.set_title_stripped then
    mp.set_property("title", settings.title_prefix..strippedname..settings.title_suffix)
  end

  local didload = false
  --if we promised to load files on launch do it
  if promised_load then
    promised_load = false
    --make sure that only one file was loaded(playlists open initially as one file)
    if plen == 1 then
      didload = true --save reference for sorting
      msg.info("Loading files from playing files directory")
      playlist()
    end
  end

  --if we promised to sort files on launch do it
  if promised_sort then
    promised_sort = false
    msg.info("Your playlist is sorted before starting playback")
    if didload then sortplaylist() else sortplaylist(true) end
  end

  --if we promised to listen and sort on playlist size increase do it
  if promised_sort_watch then
    promised_sort_watch = false
    sort_watching = true
    msg.info("Added files will be automatically sorted")
    mp.observe_property('playlist-count', "number", autosort)
  end
end

function on_closed()
  strippedname = nil
  path = nil
  directory = nil
  filename = nil
end

function refresh_globals()
  pos = mp.get_property_number('playlist-pos', 0)
  plen = mp.get_property_number('playlist-count', 0)
end

function escapepath(dir, escapechar)
  return string.gsub(dir, escapechar, '\\'..escapechar)
end

--create file search query with path to search files, extensions in a table, unix as true(windows false)
function create_searchquery(path, extensions, unix)
  local query = ' '
  for i in pairs(extensions) do
    if unix then
      query = query.."*."..extensions[i]..' '
    else
      query = query..'"'..utils.join_path(path, '*.'..extensions[i])..'" '
    end
  end
  if unix then
    return 'cd "'..escapepath(path, '"')..'";ls -1p'..query..'2>/dev/null'
  else
    return 'dir /b'..query:gsub("/", "\\")
  end
end

--strip a filename based on its extension or protocol according to rules in settings
function stripfilename(pathfile, media_title)
  local ext = pathfile:match("^.+%.(.+)$")
  local protocol = pathfile:match("^(%a%a+)://")
  if not ext then ext = "" end
  local tmp = pathfile
  if settings.filename_replace and not media_title then
    for k,v in ipairs(settings.filename_replace) do
      if ( v['ext'] and (v['ext'][ext] or (ext and not protocol and v['ext']['all'])) )
      or ( v['protocol'] and (v['protocol'][protocol] or (protocol and not ext and v['protocol']['all'])) ) then
        for ruleindex, indexrules in ipairs(v['rules']) do
          for rule, override in pairs(indexrules) do
            tmp = tmp:gsub(rule, override)
          end
        end
      end
    end
  end
  if settings.slice_longfilenames and tmp:len()>settings.slice_longfilenames_amount+5 then
    tmp = tmp:sub(1, settings.slice_longfilenames_amount).." ..."
  end
  return tmp
end

--gets a nicename of playlist entry at 0-based position i
function get_name_from_index(i, notitle)
  refresh_globals()
  if plen <= i then msg.error("no index in playlist", i, "length", plen); return nil end
  local _, name = nil
  local title = mp.get_property('playlist/'..i..'/title')
  local name = mp.get_property('playlist/'..i..'/filename')

  --check if file has a media title stored or as property
  if not title and settings.prefer_titles then
    local mtitle = mp.get_property('media-title')
    if i == pos and mp.get_property('filename') ~= mtitle then
      if not url_table[name] then
        url_table[name] = mtitle
      end
      title = mtitle
    elseif url_table[name] then
      title = url_table[name]
    end
  end

  --if we have media title use a more conservative strip
  if title and not notitle and settings.prefer_titles then return stripfilename(title, true) end

  --remove paths if they exist, keeping protocols for stripping
  if string.sub(name, 1, 1) == '/' or name:match("^%a:[/\\]") then
    _, name = utils.split_path(name)
  end
  return stripfilename(name)
end

--gets prefixes and suffixes for playlist 0-based index
function get_fixes_by_index(i)
  local prefix = ""
  local suffix = ""
  if i == pos then
    if i == cursor then
      if tag then
        prefix = settings.playing_str_selected_prefix
        suffix = settings.playing_str_selected_suffix
      else
        prefix = settings.playing_and_cursor_str_prefix
        suffix = settings.playing_and_cursor_str_suffix
      end
    else
      prefix = settings.playing_str_prefix
      suffix = settings.playing_str_suffix
    end
  elseif i == cursor then
    if tag then
      prefix = settings.cursor_str_selected_prefix
      suffix = settings.cursor_str_selected_suffix
    else
      prefix = settings.cursor_str_prefix
      suffix = settings.cursor_str_suffix
    end
  else
    prefix = settings.non_cursor_str_prefix
    suffix = settings.non_cursor_str_suffix
  end

  local prefix_num = ""
  if settings.show_prefix_filenumber then
    local base = tostring(plen):len()
    prefix_num = string.format("%s%0"..base.."d%s", settings.prefix_filenumber_prefix, i+1, settings.prefix_filenumber_suffix)
  end
  local fullprefix = settings.show_prefix_filenumber_first and prefix_num..prefix or prefix..prefix_num

  return fullprefix, suffix
end

function parse_string_props(string)
  return string:gsub("%%N", "\\N")
               :gsub("%%pos", mp.get_property_number("playlist-pos",0)+1)
               :gsub("%%plen", mp.get_property("playlist-count"))
               :gsub("%%cursor", cursor+1)
               :gsub("%%mediatitle", stripfilename(mp.get_property("media-title"), true))
               :gsub("%%filename", stripfilename(mp.get_property("filename")))
end

function draw_playlist()
  refresh_globals()
  local ass = assdraw.ass_new()
  ass:new_event()
  ass:pos(settings.text_padding_x, settings.text_padding_y)
  ass:append(settings.style_ass_tags)

  if settings.playlist_header ~= "" then
    --ass:append(parse_string_props(settings.playlist_header_0).."\\N")
	--ass:append(parse_string_props(settings.playlist_header_1).."\\N")
    ass:append(parse_string_props(settings.playlist_header).."\\N")
  end
  local start = cursor - math.floor(settings.showamount/2)
  local showall = false
  local showrest = false
  if start<0 then start=0 end
  if plen <= settings.showamount then
    start=0
    showall=true
  end
  if start > math.max(plen-settings.showamount-1, 0) then 
    start=plen-settings.showamount
    showrest=true
  end
  if start > 0 and not showall then ass:append(settings.playlist_sliced_prefix.."\\N") end
  for index=start,start+settings.showamount-1,1 do
    if index == plen then break end

    local prefix, suffix = get_fixes_by_index(index)
    ass:append(prefix..get_name_from_index(index)..suffix.."\\N")
    if index == start+settings.showamount-1 and not showall and not showrest then
      ass:append(settings.playlist_sliced_suffix)
    end
  end
  local w, h = mp.get_osd_size()
  if settings.scale_playlist_by_window then w,h = 0, 0 end
  mp.set_osd_ass(w, h, ass.text)
end

function toggle_playlist()
  if settings.open_toggles then
    if playlist_visible then
      keybindstimer:kill()
      remove_keybinds()
      return
    end
  end
  showplaylist()
end

function showplaylist()
  refresh_globals()
  if plen == 0 then return end
  playlist_visible = true
  add_keybinds()

  draw_playlist()

  keybindstimer:kill()
  keybindstimer:resume()
end

tag=nil
function tagcurrent()
  refresh_globals()
  if plen == 0 then return end
  if not tag then
    tag=cursor
  else
    tag=nil
  end
  showplaylist()
end

function removefile()
  refresh_globals()
  if plen == 0 then return end
  tag = nil
  if cursor==pos then mp.command("script-message unseenplaylist mark true \"playlistmanager avoid conflict when removing file\"") end
  mp.commandv("playlist-remove", cursor)
  if cursor==plen-1 then cursor = cursor - 1 end
  showplaylist()
end

function moveup()
  refresh_globals()
  if plen == 0 then return end
  if cursor~=0 then
    if tag then mp.commandv("playlist-move", cursor,cursor-1) end
    cursor = cursor-1
  elseif settings.loop_cursor then
    if tag then mp.commandv("playlist-move", cursor,plen) end
    cursor = plen-1
  end
  showplaylist()
end

function movedown()
  refresh_globals()
  if plen == 0 then return end
  if cursor ~= plen-1 then
    if tag then mp.commandv("playlist-move", cursor,cursor+2) end
    cursor = cursor + 1
  elseif settings.loop_cursor then
    if tag then mp.commandv("playlist-move", cursor,0) end
    cursor = 0
  end
  showplaylist()
end

function jumptofile()
  refresh_globals()
  if plen == 0 then return end
  tag = nil
  if cursor ~= pos then
    mp.set_property("playlist-pos", cursor)
  else
    if cursor~=plen-1 then
      cursor = cursor + 1
    end
    mp.commandv("playlist-next", "weak")
  end
  if not settings.show_playlist_on_fileload == 2 then
    remove_keybinds()
  end
end

--Creates a playlist of all files in directory, will keep the order and position
--For exaple, Folder has 12 files, you open the 5th file and run this, the remaining 7 are added behind the 5th file and prior 4 files before it
function playlist(force_dir)
  refresh_globals()
  if not directory and plen > 0 then return end
  local hasfile = true
  if plen == 0 then
    hasfile = false
    dir = mp.get_property('working-directory')
  else
    dir = directory
  end
  if force_dir then dir = force_dir end

  local query = create_searchquery(dir, settings.loadfiles_filetypes, settings.linux_over_windows)
  local popen, err = io.popen(query)
  if popen then
    local cur = false
    local c, c2 = 0,0
    local filename = mp.get_property("filename")
    for file in popen:lines() do
      if file:sub(-1) ~= "/" then
        local appendstr = "append"
        if not hasfile then
          cur = true
          appendstr = "append-play"
          hasfile = true
        end
        if cur == true then
          mp.commandv("loadfile", utils.join_path(dir, file), appendstr)
          msg.info("Appended to playlist: " .. file)
          c2 = c2 + 1
        elseif file ~= filename then
            mp.commandv("loadfile", utils.join_path(dir, file), appendstr)
            msg.info("Prepended to playlist: " .. file)
            mp.commandv("playlist-move", mp.get_property_number("playlist-count", 1)-1,  c)
            c = c + 1
        else
          cur = true
        end
      end
    end
    popen:close()    
    if c2 > 0 or c>0 then
      mp.osd_message("Added "..c + c2.." files to playlist")
    else
      mp.osd_message("No additional files found")
    end
    cursor = mp.get_property_number('playlist-pos', 1)
  else
    msg.error("Could not scan for files: "..(err or ""))
  end
  if sort_watching then
    msg.info("Ignoring directory structure and using playlist sort")
    sortplaylist()
  end
  refresh_globals()
  if playlist_visible then showplaylist() end
end

--saves the current playlist into a m3u file
function save_playlist()
  local length = mp.get_property_number('playlist-count', 0)
  if length == 0 then return end
  local savepath = utils.join_path(settings.playlist_savepath, os.time().."-size_"..length.."-playlist.m3u")
  local file, err = io.open(savepath, "w")
  if not file then
    msg.error("Error in creating playlist file, check permissions and paths: "..(err or ""))
  else
    local i=0
    while i < length do
      local pwd = mp.get_property("working-directory")
      local filename = mp.get_property('playlist/'..i..'/filename')
      local fullpath = filename
      if not filename:match("^%a%a+:%/%/") then
        fullpath = utils.join_path(pwd, filename)
      end
      file:write(fullpath, "\n")
      i=i+1
    end
    msg.info("Playlist written to: "..savepath)
    file:close()
  end
end

function alphanumsort(a, b)
  local function padnum(d)
    local dec, n = string.match(d, "(%.?)0*(.+)")
    return #dec > 0 and ("%.12f"):format(d) or ("%s%03d%s"):format(dec, #n, n)
  end
  return tostring(a):lower():gsub("%.?%d+",padnum)..("%3d"):format(#b)
       < tostring(b):lower():gsub("%.?%d+",padnum)..("%3d"):format(#a)
end

function dosort(a,b)
  if settings.alphanumsort then
    return alphanumsort(a,b)
  else
    return a < b
  end
end

function sortplaylist(startover)
  local length = mp.get_property_number('playlist-count', 0)
  if length < 2 then return end
  --use insertion sort on playlist to make it easy to order files with playlist-move
  for outer=1, length-1, 1 do
    local outerfile = get_name_from_index(outer, true)
    local inner = outer - 1
    while inner >= 0 and dosort(outerfile, get_name_from_index(inner, true)) do
      inner = inner - 1
    end
    inner = inner + 1
    if outer ~= inner then
      mp.commandv('playlist-move', outer, inner)
    end
  end
  cursor = mp.get_property_number('playlist-pos', 0)
  if startover then
    mp.set_property('playlist-pos', 0)
  end
  if playlist_visible then showplaylist() end
end

function autosort(name, param)
  if param == 0 then return end
  if plen < param then
    msg.info("Playlistmanager autosorting playlist")
    refresh_globals()
    sortplaylist()
  end
end

function shuffleplaylist()
  refresh_globals()
  if plen < 2 then return end
  mp.command("playlist-shuffle")
  math.randomseed(os.time())
  mp.commandv("playlist-move", pos, math.random(0, plen-1))
  mp.set_property('playlist-pos', 0)
  refresh_globals()
  if playlist_visible then showplaylist() end
end

function add_keybinds()
  mp.add_forced_key_binding('UP', 'moveup', moveup, "repeatable")
  mp.add_forced_key_binding('DOWN', 'movedown', movedown, "repeatable")
  mp.add_forced_key_binding('RIGHT', 'tagcurrent', tagcurrent)
  mp.add_forced_key_binding('ENTER', 'jumptofile', jumptofile)
  mp.add_forced_key_binding('LEFT', 'removefile', removefile, "repeatable")
end

function remove_keybinds()
  mp.set_osd_ass(0, 0, "")
  playlist_visible = false
  if settings.dynamic_binds then
    mp.remove_key_binding('moveup')
    mp.remove_key_binding('movedown')
    mp.remove_key_binding('tagcurrent')
    mp.remove_key_binding('jumptofile')
    mp.remove_key_binding('removefile')
  end
end

keybindstimer = mp.add_periodic_timer(settings.playlist_display_timeout, remove_keybinds)
keybindstimer:kill()

if not settings.dynamic_binds then
  add_keybinds()
end

promised_load = false
if settings.loadfiles_on_start then
  local c = mp.get_property_number('playlist-count', 0)
  if c == 1 then
    promised_load = true
  elseif c == 0 then
    playlist()
  end
end

promised_sort_watch = false
if settings.sortplaylist_on_file_add then
  promised_sort_watch = true
end

promised_sort = false
if settings.sortplaylist_on_start then
  promised_sort = true
end

--script message handler
function handlemessage(msg, value, value2)
  if msg == "show" and value == "playlist" then
    if value2 ~= "toggle" then
      showplaylist()
      return
    else
      toggle_playlist()
      return
    end
  end
  if msg == "show" and value == "filename" and strippedname and value2 then
    mp.commandv('show-text', strippedname, tonumber(value2)*1000 ) ; return
  end
  if msg == "show" and value == "filename" and strippedname then
    mp.commandv('show-text', strippedname ) ; return
  end
  if msg == "sort" then sortplaylist(value) ; return end
  if msg == "shuffle" then shuffleplaylist() ; return end
  if msg == "loadfiles" then playlist(value) ; return end
  if msg == "save" then save_playlist() ; return end
end

mp.register_script_message("playlistmanager", handlemessage)

mp.add_key_binding("p", "sortplaylist", sortplaylist)
-- mp.add_key_binding("CTRL+P", "shuffleplaylist", shuffleplaylist)
-- mp.add_key_binding("P", "loadfiles", playlist)
mp.add_key_binding("k", "saveplaylist", save_playlist)
mp.add_key_binding("ctrl+alt+u", "showplaylist", toggle_playlist)

mp.register_event("file-loaded", on_loaded)
mp.register_event("end-file", on_closed)