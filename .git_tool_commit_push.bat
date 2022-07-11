@echo off
::CONST

::GLOBAL/CONFIG
set skipDefaultVariable=n
set GIT_TOOL_SUPPORT_INI_BAT=.\.__git_tool_support_ini__.bat
set GIT_TOOL_CONFIG=.\.git_tool_config.ini

::PRELOAD
setlocal EnableDelayedExpansion

::README

::变量输入区（选填）

::导入目录变量
::call %GIT_TOOL_SUPPORT_INI_BAT% /s config /i defaultRemoteRespositoryName %GIT_TOOL_CONFIG%
for /f "delims=" %%a in ('call %GIT_TOOL_SUPPORT_INI_BAT% %GIT_TOOL_CONFIG% /s config /i defaultRemoteRespositoryName %GIT_TOOL_CONFIG%') do @set defaultVariableValueFromIni=%%a
echo %abc%
::变量名
set variableName=rmtrepname
::默认变量值
set defaultVariableValue=default
::变量描述
set variableDescription=远程仓库名
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


git add .
git commit -m "."
git push jgorigin main:main
pause