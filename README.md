# MPV-EASY Player
![](./img/mpv-logo-128.png)

### [MPV-EASY Player](http://www.rjno1.com/mpv-easy-player.html) : 一个易于使用,基于[MPV](https://github.com/mpv-player/mpv/)的播放器

---
### [MPV-EASY Player](http://www.rjno1.com/mpv-easy-player.html)  : An easy to use, [MPV](https://github.com/mpv-player/mpv/) based player

All the content on this page is described in Chinese. 

If you don't know the Chinese language, it doesn't matter. You can download it from the [release](https://github.com/422658476/MPV-EASY-Player/releases) page and try to use it. MPV-EASY Player has both Chinese and English interfaces.

If you are interested in this player and you are very curious about how it works after using it, then try to read this page using [Google Translate](https://translate.google.com/).

---

![](./img/mpv-easy-player-1.png)

基本上MPV-EASY Player就是在对MPV的manual.pdf（说明文档）充分阅读和理解的情况下，对MPV、mpv配置、lua脚本(包含github他人分享的)、js脚本进行的拼装和组合。

MPV-EASY Player虽然需要安装，但它实际上是一个不折不扣的绿色软件（portable app），所谓的“安装”其实只是解压缩而已，所以重装系统后无需重新安装仍旧可以立刻运行使用，最多只需要重新关联文件格式而已。

当然，作为小半个前端，还做了很多、一些或者少量其他的事情，甚至很多都是投机取巧的实现，毕竟只靠mpv和脚本，有些功能并不能很好的整合在一起（内心：主要还是“代码能力严重欠缺”）。

不过随着不断的开发，MPV-EASY Player现在已经拥有了属于自己的完整的GUI前端，已经变成了一个完整的播放器，所以你会发现MPV-EASY Player现在默认的外观样式已经变成下方图片中那样了。

![](./img/mpv-easy-player-borderless-gui.png)

![](./img/mpv-easy-player-playing.jpg)

虽然MPV-EASY Player已经带有了更加美观的gui，但是这并不代表它抛弃了之前的mpv原生gui。

实际上，在使用MPV-EASY Player时，你可以在3种不同的运行模式和2种不同的gui界面之间随意的切换使用，随时体验最新版mpv(只需要把下载的最新版mpv存放到【MPV-EASY Player所在文件夹\mpv】路径下即可)，mpv支持的lua脚本、js脚本也是可以直接放在MPV-EASY Player中使用，也就是尽可能保持mpv的特性，做到最高的兼容度。

---

### 整个视频播放器包含了很多开源代码，同时也包含了更多的闭源代码，并且受限于精力和能力，这并不是一个能够跨平台使用的播放器，只能在windows下蹦跶，甚至好像很多行为可能都是违反各种协议的。

---

不过既然除了3个exe文件，MPV-EASY Player具有的其他文件已经放到了github这里，那么这些文件对于你使用原版mpv肯定是非常有用的，少许修改放入mpv中就能让mpv获得一些或者很多的提升，不管你是在windows、mac、linux下使用mpv，这些都是支持或者大部分都支持的。

不要问我为什么在在windows、mac、linux都行：那是因为这三个操作系统我都有，什么前端的mpv我都用过，毕竟每个操作系统图形化界面下操作老熟悉了（精通点鼠标）。

如果你没有接触过其中一些操作系统，那么放过自己吧，好奇心会浪费你很多时间和精力，甚至会很累（建议第三个，什么分支、依赖、各种包管理、编译、输入法、显卡驱动、前端、各种不同图形环境带来的兼容性问题最给劲了）

或许你会问为什么不使用各种基于mpv的图形化前端，那是因为当你从说明文档中充分了解完这个播放器之后，你会发现只有原生的mpv才能让这个播放器变的最为强大、有趣和无限可能，因为你需要添加各种参数还有脚本，当然使用原生mpv还有其他额外好处，比如能够紧跟最新版本和体验最新的新特性，当然，bug的修复也是最快的。

大部分前端或多或少在参数还有脚本这些方面会有欠缺，最常见的就是看不见osc了（毕竟用不着了），你不知道lua脚本是否支持，参数在哪个文件中添加，应该放在哪，最后发现还是原版的比较省力些。2018-7-28：我好像已经开始抽自己嘴巴了 :(

又是当然：世事无绝对，以上这些随着时间、事情的发展、人思想的转变、技术的进步都有可能落伍、错误，所以以上这些你甚至可以忽略不用看。

### 那我为什么要写以上这些？还放在最前面？

为了尽量浪费你宝贵的时间啊。

### 如何获得MPV的manual.pdf（说明文档）

https://mpv.io/manual/ 在这个网页中你可以看到html版的说明文档，也可以下载到pdf版，或者在你下载的mpv压缩包中也是包含这个manual.pdf的。

查看说明文档当然是重中之重，你可以知道哪些文件要放在什么路径下才会生效，什么参数才能激活什么功能，**十万个mpv的为什么**尽在其中。不过文档是英文的，看的时候用个翻译软件吧。

### [【portable-data】](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data)[【mpv-easy-data】](https://github.com/422658476/MPV-EASY-Player/tree/master/mpv-easy-data)2个文件夹的益处

请注意：【icons】【img】【 tutorial】等文件夹你不需要查看，对你有用的只有【portable-data】和【mpv-easy-data】文件夹

既然我已经上传了这2个文件夹中的所有文件，那就说明你看manual.pdf的负担能够减轻很多（写MPV-EASY Player也是为了减轻大家的负担，毕竟很多痛苦的过程，浪费的时间一个人承受就足够了），甚至只需要打开这2个文件夹中的一些文件，对里面的文本进行复制粘贴即可获得你想要的结果，**所以下面这些文字的目的都是为了把MPV-EASY Player中的大部分功能迁移到mpv下作的说明**，你也可以了解2者在运行和功能方面的差异，

这样一来，不管你在什么平台下使用mpv，即使MPV-EASY Player出现bug、版本不更新、不兼容最新版mpv，都可以靠自己获得一个更加强大，更加顺手，甚至属于你自己的mpv player，当然也可以让你更快发现MPV-EASY Player中的bug，以及加入新的功能。

### MPV-EASY Player和mpv文件夹结构的异同

既然MPV-EASY Player源自于mpv，那么2者的文件夹结构其实是非常类似的，所以把前者的设置、文件迁移到后者也非常简单。

那为什么MPV-EASY Player不使用和mpv相同的文件夹结构呢？

那是因为mpv的lua脚本不支持存放在中文路径（理论上应该是路径中带有宽字符或者叫做双字节字符）下使用，所以进行了部分的分离，MPV-EASY Player通过运行前的处理让mpv支持存放在中文路径下时能调用lua脚本，所以你在使用mpv时也一定要注意lua脚本和中文路径的问题，最好在全英文路径下使用。

或许下面所说的文件存放路径、结构、调用方式和你之前所认为的、理所当然的方式有很多出入，甚至可能是多此一举的，但这些功夫都是为中文路径的支持，以及把尽可能少的文件存放到c盘纯英文路径下做的努力，好让大部分数据都保存在非C盘，防止配置文件的丢失和软件的丢失，并且也能够尽可能减少需要复制到c盘的细小文件的数量，从而可以节省时间从而带来更快的启动速度。

## 如何把MPV-EASY Player的2个文件夹改变到适用于mpv(windows)

windows下mpv支持读取的配置路径基本包含2种。你只需要选择使用其中一种即可。

---
#### 使用文字说明可能还是会带来很多理解上的困扰，没有关系，你可以先从[release](https://github.com/422658476/MPV-EASY-Player/releases/tag/0.28.2)下载一个已经打包好的实例：【首页教程示例使用：mpv-0.28.2-i686-20180324(基于第一种方法,纯英文路径下使用)】，边使用边看下方的文字。
---


#### 第一种(仅支持在纯英文路径下完全正常工作,也就是MPV-EASY运行模式：原生2 | mode 2):

![](./img/mpv-conf-dir-1.jpg)

步骤：

1.下载程序。

从网上https://mpv.srsfckn.biz/ 或者 https://sourceforge.net/projects/mpv-player-windows/files/ 下载mpv程序的压缩包，解压到本地，比如图上是解压到mpv player文件夹下，所以你可以在mpv player文件夹中看到mpv.exe这个文件。

2.创建不能变动的文件夹和文件。

打开mpv.exe所在的文件夹(例子中也就是开打mpv player文件夹)，以mpv.exe所在的路径创建以下子文件夹和文件，这些文件和文件夹的名字和路径都是不能变动的。

>mpv.exe所在文件夹\portable_config

>mpv.exe所在文件夹\portable_config\XXXXXXX   (根据下方信息 从下面2条中选一个)

>>mpv.exe所在文件夹\portable_config\lua-settings   (如果使用mpv 0.28.2 2018-3-30前的版本)

>>mpv.exe所在文件夹\portable_config\script-opts    (如果使用2018-3-30后的版本)    

>mpv.exe所在文件夹\portable_config\scripts

>mpv.exe所在文件夹\portable_config\mpv.conf

不理解的话请参考上方图片，文件夹和文件的作用请参考manual.pdf文档

mpv默认就会读取portable_config这个子文件夹下的各种配置，所以接下来所有的文件都会存放于portable_config文件夹中在改动。

3、文件导入到portable_config文件夹下。

从[这个网页](https://github.com/422658476/MPV-EASY-Player)顶部打包下载【portable-data】【mpv-easy-data】文件夹。

把【portable-data】**文件夹内**的所有东西放入【mpv.exe所在文件夹\portable_config】

把【mpv-easy-data】**“连同文件夹本身”**直接放入【mpv.exe所在文件夹\portable_config】

导入文件后就会和图上的结构一样了，你也可以在这时手动确认一下文件夹和文件结构是否和图上一样。

4、修改mpv.conf文件内容，让mpv能够正常读取。

修改mpv.conf的目的：

a.引导mpv去读取下面路径中的配置文件

>mpv.exe所在文件夹\portable_config\mpv-easy-data\input.conf

>mpv.exe所在文件夹\portable_config\mpv-easy-data\rjno1.conf

b.让mpv把历史记录文件保存到以下路径中

>mpv.exe所在文件夹\portable_config\mpv-easy-data\watch_later

打开【mpv.exe所在文件夹\portable_config】下的mpv.conf，检查每一行开头是否都有#号，没有的话请添加#号（以#号开头的每行文本都会被mpv认为是注释，不会产生任何作用）。

检查完毕之后往mpv.conf中添加下面这5行：

>input-conf=portable_config\mpv-easy-data\input.conf

>include=portable_config\mpv-easy-data\rjno1.conf

>watch-later-directory=portable_config\mpv-easy-data\watch_later

>profile="ini-rjno1"

>write-filename-in-watch-later-config

由于使用的是相对路径，所以不管今后mpv player文件夹被移动到任何**纯英文路径**下，无需任何处理配置都能正常工作。


#### 第二种(支持中文路径，但某些文件要复制到c盘,也就是MPV-EASY运行模式：兼容 | mode 0):

![](./img/mpv-conf-dir-2.jpg)

########### 注意：上方图片中第二个箭头是错误的 ###########

########### 应该是从左侧【scripts】文件夹指向右侧的【scripts】文件夹 ###########

第二种则是从第一种演变而来，当你拥有第一种之后，在它基础上稍加操作就能变成第二种。

第二种方法主要是利用mpv在c盘的配置文件夹本身就是纯英文路径来解决lua脚本不支持中文路径的问题。

1.重命名第一种中的【portable_config】文件夹，比如重命名成【data】文件夹，你将会得到以下这些，就像图中那样

>mpv.exe所在文件夹\data

>mpv.exe所在文件夹\portable_config\XXXXXXX   (根据下方信息 从下面2条中选一个)

>>mpv.exe所在文件夹\portable_config\lua-settings   (如果使用mpv 0.28.2 2018-3-30前的版本)

>>mpv.exe所在文件夹\portable_config\script-opts    (如果使用2018-3-30后的版本)  

>mpv.exe所在文件夹\data\scripts

>mpv.exe所在文件夹\data\mpv.conf

>mpv.exe所在文件夹\data\mpv-easy-data

【data】文件夹可以移动和更改到任何路径下，如果想要和mpv一起方便迁移，或者不熟悉mpv，那么还是建议放在mpv.exe所在文件夹下

【mpv-easy-data】文件夹可以配合下面第二步对mpv.conf的修改，移动和更改到任何路径下，如果想要和mpv一起方便迁移，或者不熟悉mpv，那么还是建议放在【mpv.exe\data】文件夹下

2.打开【mpv.exe所在文件夹\data】下的mpv.conf，检查每一行开头是否都有#号，没有的话请添加#号（以#号开头的每行文本都会被mpv认为是注释，不会产生任何作用）。

修改mpv.conf的目的：引导mpv去读取下面路径中的配置文件

检查完毕之后mpv.conf中之前这5行修改成：

>input-conf=data\input.conf

>include=data\mpv-easy-data\rjno1.conf

>watch-later-directory=data\mpv-easy-data\watch_later

>profile="ini-rjno1"

>write-filename-in-watch-later-config

由于使用的是相对路径，今后【mpv player播放器】文件夹（参考下面第三步）变更路径后都无需对mpv.conf进行任何修改。

3.把mpv.exe所在的文件夹和【data】文件夹转移到你想要存放的路径下（支持中文路径），比如我们迁移到

>D:\mpv player播放器\mpv.exe

>D:\mpv player播放器\data

4、复制或剪切（建议复制）【data】文件夹下的【lua-settings】、【scripts】文件夹和【mpv.conf】文件到下面这个路径下，【mpv】文件夹不存在请自行创建
>>上方适用于mpv 0.28.2 2018-3-30前的版本，如果使用mpv 2018-3-30后的版本，lua-settings请换成script-opts


>C:\Users\用户名\AppData\Roaming\mpv

5、每次修改完【data】文件夹中的数据后，重新执行第四步的操作后在运行mpv.exe，修改的内容才会生效；重装系统导致【C:\Users\用户名\AppData\Roaming\mpv】下的数据丢失，也只需要重新执行第四步即可正常.

## MPV播放器的使用（包括参数更改、lua脚本、js脚本、自定义快捷键）

当你通过以上步骤知道如何在windows下灵活的正常使用mpv后，就可以开始对mpv进行各种自定义了，当然自定义基于你对manual.pdf（说明文档）中内容的了解程度而定，越熟悉越能使其强大，如果你并不关心manual.pdf（说明文档），那么也无所谓，因为【portable-data】【mpv-easy-data】文件夹中的已经添加的设置足够强大

注意：如果默认参数不能够让mpv正常工作的话，那就说明mpv在版本升级的时候进行了某些参数的更改，你需要对比新旧版本manual.pdf文档，或者查看更新日志找出差别。

---
### 如果你的mpv需要一些最基本的默认参数，那么可以直接复制[rjno1.conf](https://github.com/422658476/MPV-EASY-Player/blob/master/mpv-easy-data/rjno1.conf)中的参数，然后在进行修改
---

### 对mpv进行各种自定义主要修改哪些文件和文件夹

>mpv-easy-data\input.conf         ----> 主要用来自定义快捷键，文件中已经包含了充分的示例，也已经有了少量修改的快捷键

>mpv-easy-data\rjno1.conf         ----> 主要调整mpv的设置参数，这些设置本来是放在mpv.conf中的，现在已经转为存放在rjno1.conf中，因此mpv.conf无需变动也不建议变动，看到mpv.conf中profile="ini-rjno1"与rjno1.conf中的[ini-rjno1]了吗，其中的**ini-rjno1**可以更改，但要保持一致

---
### rjno1.conf使用注意事项：
>请注意：rjno1.conf中有一个参数：osc=xxx  #(xxx为yes或者no)。这个参数是用来控制osc（播放控制界面）的显示和隐藏的。

>所以，你在使用rjno1.conf时，一定要确保rjno1.conf中的osc=yes而不是osc=no，这样mpv才会显示osc界面

>如果你不明白我说的意思，那么你可以把rjno1.conf中的osc=xxx这行删除，那么mpv肯定会显示osc界面

>mpv-easy player中为何要加osc=xxx这个有些危险的参数？

>那是因为mpv-easy player默认使用外部osc，当rjno1.conf中不存在osc=xxx这个参数或者osc=yes时，windows启动后首次运行或者有些情况下运行mpv-easy player，mpv-easy player显示的可能会是mpv内置的osc，而不是使用外部osc，添加osc=no可以有效的解决这个错误现象
---

>portable-data\scripts文件夹         ----> 从网上得到的mpv的lua脚本、js脚本、自己制作的lua、js脚本要放在这个文件夹中才会被mpv有效读取

>portable-data\XXXXXXX   (根据下方信息 从下面2条中选一个)        ----> 在这个文件夹中创建和脚本名字对应的.conf文件，可以更改脚本中提供的设置，具体用法要看脚本作者对脚本的解释说明

>>portable-data\lua-settings   (如果使用mpv 0.28.2 2018-3-30前的版本)

>>portable-data\script-opts    (如果使用2018-3-30后的版本)  

>portable-data\lua-settings\osc.conf         ----> 这个文件可以调整mpv官方给出的所有osc设置

>>上方适用于mpv 0.28.2 2018-3-30前的版本，如果使用mpv 2018-3-30后的版本，lua-settings请换成script-opts

>portable-data\lua-settings\stats.conf         ----> 这个文件可以调整查看视频详细信息界面的各个参数，已经调整为半透明

>>上方适用于mpv 0.28.2 2018-3-30前的版本，如果使用mpv 2018-3-30后的版本，lua-settings请换成script-opts

### [【portable-data/scripts】](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts) 文件夹中提供的lua脚本和js脚本已经进行了哪些方面的增强

【portable-data】中的脚本文件大部分都可以从github中找到，有些已经进行了些许修改，有些需要你查看脚本中的快捷键、注释、脚本下载页面的说明才能调用，小部分则是MPV-EASY-Player中原创的脚本，你也可以根据脚本中的注释进行改进和bug修正

![](./img/mpv-easy-player-osd-bar-lua.jpg)

>[osd-bar.lua](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts)         ----> MPV-EASY-Player原创,配合rjno1.conf中osd开头的参数，可以美观的让进度条一直显示(全屏状态下仍旧会自动隐藏)

>[playlistnoplayback.lua](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts)         ----> MPV-EASY-Player原创，如果你启用了记录播放历史和进度功能，在播放播放列表时这个lua脚本可以解决播放下个文件时自动跳转到之前播放进度的问题，也就是让播放列表每次播放下个文件总是从头播放,这个脚本的局限性请查看内容中的注释部分

>[local-language.lua](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts)         ----> MPV-EASY-Player原创，这个脚本可以让MPV-EASY-Player和mpv显示的文字变为你最为熟悉的语言，也就是语言本地化，也可以让更多语言本地化功能从input.conf(也就是快捷键配置文件)中剥离，比如说调节音量后osd显示的文字【volume:100%】能够变成【音量:100%】，你无须在去快捷键配置文件中写show-text，也无需担心快捷键改变后show-text是否也被同步添加到新快捷键的命令后面，不管你是用命令还是用任意快捷键调整了音量，osd都会使用【音量:100%】显示音量的改变。不过这个lua脚本并没有被添加到MPV-EASY-Player的默认脚本中，因为它还存在着一些干扰和负面影响，添加到MPV-EASY-Player中有些得不偿失，不过在mpv中应该是一个非常有用的脚本，至少很多常用命令显示的文字可以改变成你喜欢的语言了。默认这个脚本中会把英文转换成简体中文显示。

>[other.js](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts)         ----> MPV-EASY-Player原创，用来自动保存音量，使得下次播放都使用上次调整过的音量，不过这个脚本要在mpv中正常使用需要你进行修改。这个js脚本的已知问题和缺陷请查看内容中的注释部分

![](./img/mpv-easy-player-osc-lua.jpg)

>[osc.lua](https://github.com/422658476/MPV-EASY-Player/tree/master/portable-data/scripts)         ----> MPV-EASY-Player修改自[官方原版](https://github.com/mpv-player/mpv/tree/master/player/lua) ，如果你了解lua脚本，可以让你在osc样式方面拥有完全的自定义。

**注意** 如果你想要使用mpv的原版osc界面，请删除osc.lua这个文件或者把它重命名成非lua后缀名，并且确保rjno1.conf中没有osc=no

---
########################下面是插播########################

![](./img/mpv-easy-player-4.png)

![](./img/mpv-easy-player-4-1.png)

### 看到上面图上这些osc样式了吗？它们不仅可以存在于mpv-easy player中，你使用的mpv的osc也可以变成这样。

操作步骤也非常简单，只需要：

从[【mpv-easy-data/osc-style】](https://github.com/422658476/MPV-EASY-Player/tree/master/mpv-easy-data/osc-style)中下载所有osc-XXX.lua文件。这些lua文件都是mpv-easy player原创（修改自官方的osc.lua），每一个代表一种或者多种风格。

#### 比如【osc-mpc-be-blue-box-bar-or-knob-20-60.lua】，为什么这个lua的文件名这么长？

这是因为它的命名规范为【文件名-osc样式-进度条样式-osc透明度范围-osc透明度范围.lua】，也就是说这个文件名在

>osc样式=box

>进度条样式=bar或者knob

>osc透明度=在20-60之间

才会带有最好的显示效果。

### 如何操作才能让例子中的【osc-mpc-be-blue-box-bar-or-knob-20-60.lua】生效呢？

1、把osc-mpc-be-blue-box-bar-or-knob-20-60.lua重命名成osc.lua

2、把重命名后的osc.lua复制到portable-data\scripts文件夹下，覆盖portable-data\scripts\osc.lua这个同名文件

3、打开portable-data\lua-settings\osc.conf文件，修改成这样

>>上方适用于mpv 0.28.2 2018-3-30前的版本，如果使用mpv 2018-3-30后的版本，lua-settings请换成script-opts

>layout=box

>seekbarstyle=bar

>boxalpha=45

4、osc样式、进度条样式、osc透明度范围就是对应layout、seekbarstyle、boxalpha这三个参数，更改好osc.conf文件后，重新运行mpv就可以看到osc的样式改变了。

如果你想要自己制作这样的OSC外观样式呢？

### [教程:如何制作MPV-EASY Player/MPV Player的OSC外观样式](http://www.rjno1.com/infor/diy/3019-modify-mpv-osc-style.html)

########################插播结束########################

---

>[autoload.lua](https://github.com/mpv-player/mpv/tree/master/TOOLS/lua)         ----> 自动加载为播放列表

>[ontop-playback.lua](https://github.com/mpv-player/mpv/tree/master/TOOLS/lua)         ----> 播放时置顶显示

>[open-file-dialog.lua](https://github.com/rossy/mpv-open-file-dialog)         ----> 显示打开文件界面，需要你按下脚本中的快捷键才能使用

>[pause-when-minimize.lua](https://github.com/mpv-player/mpv/tree/master/TOOLS/lua)         ----> 最小化时自动暂停

>[playlistmanager.lua](https://github.com/jonniek/mpv-playlistmanager)         ----> 高级播放列表，为了外观样式和多国语言的支持代码经过些许修改，需要你按下脚本中的快捷键才能使用


### mpv可以使用的各种脚本请参考这个汇总页面

https://github.com/mpv-player/mpv/wiki/User-Scripts


### 如何把MPV-EASY Player的2个文件夹改变到适用于mpv(mac和linux)

由于MPV-EASY Player并没有mac和linux版，上面的教程加上下方的教程，可以让你自己在mac和linux下创造出一个MPV-EASY Player for mac、MPV-EASY Player for linux，虽然操作功能方面有精简，但是在平时使用时的外观和功能大部分都是一样的。

聪明的你甚至已经想到，可以在windows下调整好MPV-EASY Player的功能，然后再把这些调整后的文件转移到mac或linux下使用，从而省去手动修改配置文件和查阅说明文档的烦恼，不过这样操作的时候有些地方需要小心：

### 由于MPV-EASY Player默认启用了硬解，而mac和linux下MPV使用硬解的参数的值和windows下可能是不同的，如果你从windows中迁移到mac或者linux下时这个参数不修改，可能会导致播放失败，最典型的现象就是双击播放后mpv一闪而过，播放失败，mpv自动退出了。

如果你遇到了这个问题，那么请查看这个参数的值：vo，这个参数存在于：

>mpv-easy-data\rjno1.conf 

同时rjno1.conf中的另一个参数：hwdec的值一定要确定是auto（也就是hwdec=auto，这样一来hwdec这个参数就不会成为造成播放失败的原因之一了），由于vo和hwdec的值对于硬解都起到至关重要的作用，并且相互影响，播放失败时问题的根源往往和这2个参数有关。

当hwdec=auto时，这个文件中，你只需要在说明文档中查看vo=后的面的值是否是否支持你使用的系统即可，如果不兼容的话就手动改成现在系统兼容的值。

如果你并不想要搞清楚这个问题，只想要mpv在mac或者linux下能够正常工作，那么也非常简单，你在windows下调整MPV-EASY Player的功能时，只需要在设置界面中把硬解切换成软解后再把这些调整后的文件转移到mac或linux下使用即可，软解对于所有系统的兼容性都是一样的。

如果你已经在windows下完全掌握了之前【如果如果如何把MPV-EASY Player的2个文件夹改变到适用于mpv(windows)】中描述的2种方法，那么这些设置迁移到mac和linux也非常简单，

【portable-data】【mpv-easy-data】文件夹中的内容依葫芦画瓢按照结构放到以下路径后，依旧按照上方教程（方法一）修改一下mpv.conf文件即可

---
**linux**（下方的~代表的是linux下的home分区，.config是一个隐藏文件夹，需要文件管理器开启【显示隐藏文件】才能看到，【mpv】文件夹可能需要自行创建）：

~/.config/mpv/XXXXXXX  (根据下方信息 从下面2条中选一个)

>>~/.config/mpv/lua-settings   (如果使用mpv 0.28.2 2018-3-30前的版本)

>>~/.config/mpv/script-opts    (如果使用mpv 2018-3-30后的版本)  


~/.config/mpv/scripts

~/.config/mpv/mpv.conf

~/.config/mpv/mpv-easy-data

---
**mac**（下方的~代表的是mac下的【个人目录】也就是home文件夹，.config是一个隐藏文件夹，需要【个人目录】下Command+Shift+G后输入.config后进入，【mpv】文件夹可能需要自行创建）：

![](./img/mpv-easy-player-mac.jpg)

![](./img/mpv-easy-player-in-mac-os-x.png)

【个人目录】=finder->mac->mac系统分区->用户文件夹->用户名文件夹

mac没有home？no no no

使用mac系统的绝大部分人【个人目录】应该都放在了系统分区，如果你已经给mac分过区，并且使用过【设置】-【用户与群组】-【当前用户】右键菜单-【高级选项】-【个人目录】，那么可以把【个人目录】像linux一样挂载到非系统目录下，这样的好处显而易见，个人资料和设置与系统完全分离，重装系统最为干净。

~/.config/mpv/XXXXXXX  (根据下方信息 从下面2条中选一个)

>>~/.config/mpv/lua-settings   (如果使用mpv 0.28.2 2018-3-30前的版本)

>>~/.config/mpv/script-opts    (如果使用mpv 2018-3-30后的版本)  

~/.config/mpv/scripts

~/.config/mpv/mpv.conf

~/.config/mpv/mpv-easy-data

**mpv for mac**的某些缺陷（0.28.2时存在的）

mpv for mac在osc样式方面的显示是有缺陷的，表现在于使用seekbarstyle参数更改osc进度条样式后，进度条的样式依旧不变或者显示的是和说明文档中不一样的样式，所以，如果你遇到了这个问题，请打开下方这个配置文件

~/.config/mpv/lua-settings/osc.conf

>>上方适用于mpv 0.28.2 2018-3-30前的版本，如果使用mpv 2018-3-30后的版本，lua-settings请换成script-opts

使用#号注释掉seekbarstyle这行，也就是

seekbarstyle=***  ---->  #seekbarstyle=***

如果还是有osc方面的问题，可以顺便注释一下同一文件中的layout这行，也就是

layout=***  ---->  #layout=***

如果添加osc.lua且layout=box时，osc没有变为修改后的样式，那么请尝试修改你添加的那个额外的osc.lua

~/.config/mpv/scripts/osc.lua

把文件中的代码

layouts["bottombar"]改成layouts["box"] 同时 layouts["box"]改成layouts["bottombar"]，也就是进行互换。

因为mpv for mac可能不会读取layout=*** 这个设置，而是直接忽略并强行使用layout=bottombar，由于修改的样式在layout=box时才会生效，mpv for mac只会强行读取layout=bottombar处的代码时，通过上方代码的互换，可以把修改后的样式代码从box样式下转移到bottombar样式下。

---
### 为什么MPV-EASY Player设置界面没有提供自定义快捷键功能？

如果你已经使用过mpv（也就是MPV-EASY Player中的【MPV原生GUI】），你会发现它的osc并没有音量控制条，如果你想要改变音量，默认只能够按住非小键盘的9和0来调节，所以在MPV-EASY Player中为了改善这一点，滚轮的滚动功能被强制绑定为音量调节功能，方便日常使用。

input.conf能够自定义所有的快捷键，但在mpv中并不仅仅只是这样，添加的lua、js脚本中也可以添加快捷键用来开启这些脚本提供的功能，这使得分配的快捷键被分散在了多个不同的文件中，并且lua、js脚本中的快捷键往往混合在代码中间，难易提取。

这就使得快捷键的获取、重复快捷键的检测变得异常困难。

更加不幸的是，由于MPV-EASY Player使用类似smplayer的运行方式完全区分开了程序的前端gui和后端（相信我，实际上这种运行方式往往比libmpv更加的合适，因为对普通用户来说随时升级mpv核心更加的简单易懂，对mpv中lua，js脚本的支持也更加简单方便，还能够单独运行和使用mpv），导致当你按下快捷键后，osd中的文字的显示只能够由input.conf中的show text功能负责，当支持多国语言时，input.conf还必须要负责一部分语言功能。例如，当你使用滚轮时，简体中文下是：音量：100%，英文下则是： volume：100%。所以如果自定义快捷键，那么还需要修改show text后对应的文字，这往往又是一个挑战。

幸运的是什么？

作为一个播放器，mpv的日常使用往往并不需要你自定义快捷键，MPV-EASY Player中预设和修改的小部分快捷键已经足够你日常使用，也已经足够的方便，如果你想要自定义某些快捷键，根据上面这些信息，相信我，手动修改input.conf和脚本中的快捷键是一个更加明智和更加简单的选择。
