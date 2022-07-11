@echo off

::GLOBAL/CONFIG
set skipDefaultVariable=n

::PRELOAD
setlocal EnableDelayedExpansion

if not exist "%JG_GITRESPOSITORIES_PATH%\" (
	echo Զ��Ŀ¼������
	pause
	goto EOF
)

::README
echo ע��"-d"Ϊ����Ĭ�ϲ���

::���������������

::Ҫ�������Ƶ����
:projectName
::������
set variableName=projectName
::��������
set variableDescription=��Ŀ���ơ����鲻�����ġ�

set /p %variableName%=����%variableDescription%��
if not defined %variableName% (
	echo "������Ϊ�������"
	goto %variableName%
)

:: ����Ԥ������

if exist "%JG_GITRESPOSITORIES_PATH%\%projectName%" (
	echo ����ʧ�ܣ�����Ŀ�����Ѵ��ڣ�
	pause
	goto EOF
)

mkdir "%JG_GITRESPOSITORIES_PATH%\%projectName%"

git init --bare "%JG_GITRESPOSITORIES_PATH%\%projectName%"

set "variable=%JG_GITRESPOSITORIES_PATH%\%projectName%"

set "drive=%variable:~0,1%"

set variable=%variable:~2%
set "variable=%variable:\=/%"

if %drive%==A set "drive=a"
if %drive%==B set "drive=b"
if %drive%==C set "drive=c"
if %drive%==D set "drive=d"
if %drive%==E set "drive=e"
if %drive%==F set "drive=f"
if %drive%==G set "drive=g"
if %drive%==H set "drive=h"
if %drive%==I set "drive=i"
if %drive%==J set "drive=j"
if %drive%==K set "drive=k"
if %drive%==L set "drive=l"
if %drive%==M set "drive=m"
if %drive%==N set "drive=n"
if %drive%==O set "drive=o"
if %drive%==P set "drive=p"
if %drive%==Q set "drive=q"
if %drive%==R set "drive=r"
if %drive%==S set "drive=s"
if %drive%==T set "drive=t"
if %drive%==U set "drive=u"
if %drive%==V set "drive=v"
if %drive%==W set "drive=w"
if %drive%==X set "drive=x"
if %drive%==Y set "drive=y"
if %drive%==Z set "drive=z"

set "variable=/%drive%%variable%"

git remote add jgoriginc "%variable%"

pause