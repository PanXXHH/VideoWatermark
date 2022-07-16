@echo off
::CONST
set AWM_CORE_VERSION=1.0.8.220716
set BL_CORE_VERSION=3.2
set TITLE=批量加水印工具
set AUTHOR=panpanpan
set CONTACT=pxxh0120
set PROJECT_ADDRESS=https://github.com/PanXXHH/VideoWatermark

::GLOBAL
set skipDefaultVariable=n
set FFMPEG_EXE=ffmpeg
set FFPROBE_EXE=ffprobe
set SUPPORT_INI_BAT=.\lib\__support_ini__.bat
set CONFIG_INI=.\config.ini

::PRELOAD
setlocal EnableDelayedExpansion

::README
echo **********[%TITLE%（依赖：FFMPEG）, 版本号：%AWM_CORE_VERSION%, 作者：%AUTHOR%, 改进建议/意见：%CONTACT%, 开源地址=%PROJECT_ADDRESS%]**********
echo ********************
echo 注：提前装好FFMPEG工具
echo 注：mp4文件名不能出现空格，否则会出错
echo 注："-d"为跳过后续默认参数
echo 注：水印图片尺寸不能大于视频帧宽或帧高
echo 注：支持图片，动图作为logo
echo 注：支持图片作为视频
echo:

::INPUT(OPTIONAL)

::导入目录变量
::变量名
set variableName=inputdir
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::导出目录变量
::变量名
set variableName=outputdir
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::水印图片文件名称变量

::变量名
set variableName=WMFileName
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::水印X起始位置变量
::变量名
set variableName=WMPlaceX
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::水印Y起始位置变量
::变量名
set variableName=WMPlaceY
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::水印图片宽度
::变量名
set variableName=WMw
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::水印图片高度
::变量名
set variableName=WMh
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::是否加背景模糊变量
::变量名
set variableName=background_blurred
::默认变量值
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::变量描述
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%【y/n】（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::视频文件格式变量（遍历核v3.2 加装）
::变量名
set variableName=videoType
::默认变量值
set defaultVariableValue=mp4
::变量描述
set variableDescription=视频文件格式（遍历核v3.2 加装）
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

::文件完整性报告变量（遍历核v3.2 加装）
::变量名
set variableName=isWriteReport
::默认变量值
set defaultVariableValue=y
::变量描述
set variableDescription=是否写文件完整性报告【y/n】（遍历核v3.2 加装）
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=输入%variableDescription%（默认：%defaultVariableValue%）：
	if not defined %variableName% (
		set %variableName%=%defaultVariableValue%
	)else (
		call set "variableValue=%%%variableName%%%"
		if [!variableValue!] == [-d] (
			set %variableName%=%defaultVariableValue%
			set skipDefaultVariable=y
		)
	)
)

:: 变量预处理区

if not [%WMw%] == [default] goto skip_get_WMw
%FFPROBE_EXE% -v error -of flat=s=_ -select_streams v:0 -show_entries stream=width %WMFileName% >> _temp_width.txt
FOR /f "tokens=5 delims==_" %%i in (_temp_width.txt) do @set WMw=%%i
del _temp_width.txt
:skip_get_WMw
::水印图片高度变量
if not [%WMh%] == [default] goto skip_get_WMh
%FFPROBE_EXE% -v error -of flat=s=_ -select_streams v:0 -show_entries stream=height %WMFileName% >> _temp_height.txt
FOR /f "tokens=5 delims==_" %%i in (_temp_height.txt) do @set WMh=%%i
del _temp_height.txt
:skip_get_WMh

:: 执行区

mkdir %outputdir%
:: ---------------（遍历核v3.2 加装）
echo 执行过程记录表>%outputdir%过程记录.txt
for /f "delims=" %%a in ('dir /b %inputdir%*.%videoType%') do (
echo processing:%%a>>%outputdir%过程记录.txt
if [%background_blurred%] == [y] (
	%FFMPEG_EXE% -i "%inputdir%%%a" -vf "[in]delogo=x=%WMPlaceX%:y=%WMPlaceY%:w=%WMw%:h=%WMh%[a];movie=%WMFileName%,scale=%WMw%:%WMh%[watermark];[a][watermark] overlay=%WMPlaceX%:%WMPlaceY% [out]" "%outputdir%%%a"
)else (
	%FFMPEG_EXE% -i "%inputdir%%%a" -vf "movie=%WMFileName%,scale=%WMw%:%WMh%[watermark];[a][watermark] overlay=%WMPlaceX%:%WMPlaceY% [out]" "%outputdir%%%a"
)
echo success:%%a>>%outputdir%过程记录.txt
)

::生成检查完整性
if not [%isWriteReport%] == [y] goto behindWriteReport
echo 文件完整性报告>%outputdir%文件完整性报告.txt
echo file_Exist:file_Name>>%outputdir%文件完整性报告.txt
for /f "delims=" %%i in ('dir /b %inputdir%*.mp4') do (
if exist %outputdir%%%i (echo true:%%i>>%outputdir%文件完整性报告.txt) else echo false:%%i>>%outputdir%文件完整性报告.txt
)
:behindWriteReport