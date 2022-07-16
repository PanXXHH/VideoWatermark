@echo off
::CONST
set AWM_CORE_VERSION=1.0.8.220716
set BL_CORE_VERSION=3.2
set TITLE=������ˮӡ����
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
echo **********[%TITLE%��������FFMPEG��, �汾�ţ�%AWM_CORE_VERSION%, ���ߣ�%AUTHOR%, �Ľ�����/�����%CONTACT%, ��Դ��ַ=%PROJECT_ADDRESS%]**********
echo ********************
echo ע����ǰװ��FFMPEG����
echo ע��mp4�ļ������ܳ��ֿո񣬷�������
echo ע��"-d"Ϊ��������Ĭ�ϲ���
echo ע��ˮӡͼƬ�ߴ粻�ܴ�����Ƶ֡���֡��
echo ע��֧��ͼƬ����ͼ��Ϊlogo
echo ע��֧��ͼƬ��Ϊ��Ƶ
echo:

::INPUT(OPTIONAL)

::����Ŀ¼����
::������
set variableName=inputdir
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::����Ŀ¼����
::������
set variableName=outputdir
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::ˮӡͼƬ�ļ����Ʊ���

::������
set variableName=WMFileName
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::ˮӡX��ʼλ�ñ���
::������
set variableName=WMPlaceX
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::ˮӡY��ʼλ�ñ���
::������
set variableName=WMPlaceY
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::ˮӡͼƬ���
::������
set variableName=WMw
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::ˮӡͼƬ�߶�
::������
set variableName=WMh
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::�Ƿ�ӱ���ģ������
::������
set variableName=background_blurred
::Ĭ�ϱ���ֵ
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i %variableName% %GIT_TOOL_CONFIG%') do @set defaultVariableValue=%%a
::��������
for /f "delims=" %%a in ('call %SUPPORT_INI_BAT% %CONFIG_INI% /s config /i _%variableName%Description %GIT_TOOL_CONFIG%') do @set variableDescription=%%a
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��y/n����Ĭ�ϣ�%defaultVariableValue%����
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

::��Ƶ�ļ���ʽ������������v3.2 ��װ��
::������
set variableName=videoType
::Ĭ�ϱ���ֵ
set defaultVariableValue=mp4
::��������
set variableDescription=��Ƶ�ļ���ʽ��������v3.2 ��װ��
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

::�ļ������Ա��������������v3.2 ��װ��
::������
set variableName=isWriteReport
::Ĭ�ϱ���ֵ
set defaultVariableValue=y
::��������
set variableDescription=�Ƿ�д�ļ������Ա��桾y/n����������v3.2 ��װ��
if [%skipDefaultVariable%] == [y] (
	set %variableName%=%defaultVariableValue%
)else (
	set /p %variableName%=����%variableDescription%��Ĭ�ϣ�%defaultVariableValue%����
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

:: ����Ԥ������

if not [%WMw%] == [default] goto skip_get_WMw
%FFPROBE_EXE% -v error -of flat=s=_ -select_streams v:0 -show_entries stream=width %WMFileName% >> _temp_width.txt
FOR /f "tokens=5 delims==_" %%i in (_temp_width.txt) do @set WMw=%%i
del _temp_width.txt
:skip_get_WMw
::ˮӡͼƬ�߶ȱ���
if not [%WMh%] == [default] goto skip_get_WMh
%FFPROBE_EXE% -v error -of flat=s=_ -select_streams v:0 -show_entries stream=height %WMFileName% >> _temp_height.txt
FOR /f "tokens=5 delims==_" %%i in (_temp_height.txt) do @set WMh=%%i
del _temp_height.txt
:skip_get_WMh

:: ִ����

mkdir %outputdir%
:: ---------------��������v3.2 ��װ��
echo ִ�й��̼�¼��>%outputdir%���̼�¼.txt
for /f "delims=" %%a in ('dir /b %inputdir%*.%videoType%') do (
echo processing:%%a>>%outputdir%���̼�¼.txt
if [%background_blurred%] == [y] (
	%FFMPEG_EXE% -i "%inputdir%%%a" -vf "[in]delogo=x=%WMPlaceX%:y=%WMPlaceY%:w=%WMw%:h=%WMh%[a];movie=%WMFileName%,scale=%WMw%:%WMh%[watermark];[a][watermark] overlay=%WMPlaceX%:%WMPlaceY% [out]" "%outputdir%%%a"
)else (
	%FFMPEG_EXE% -i "%inputdir%%%a" -vf "movie=%WMFileName%,scale=%WMw%:%WMh%[watermark];[a][watermark] overlay=%WMPlaceX%:%WMPlaceY% [out]" "%outputdir%%%a"
)
echo success:%%a>>%outputdir%���̼�¼.txt
)

::���ɼ��������
if not [%isWriteReport%] == [y] goto behindWriteReport
echo �ļ������Ա���>%outputdir%�ļ������Ա���.txt
echo file_Exist:file_Name>>%outputdir%�ļ������Ա���.txt
for /f "delims=" %%i in ('dir /b %inputdir%*.mp4') do (
if exist %outputdir%%%i (echo true:%%i>>%outputdir%�ļ������Ա���.txt) else echo false:%%i>>%outputdir%�ļ������Ա���.txt
)
:behindWriteReport