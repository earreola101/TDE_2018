@echo on

rem �����������ļ����ڵ�·��


echo ***** Replace "Value" as "Values" *****
rem ����Ҫ�滻���¾��ַ���
set strOld=Value
set strNew=Values

rem ��������޸ı��ػ�����
setlocal enabledelayedexpansion

rem ѭ��ȡ��Ҫ������ļ���
for /f "tokens=*" %%i in ('dir teststatus_sensor1820stars.txt /b') do (
    set "var=%%i"
    if not !var!.==. (
rem �����ļ�һ���д��������ֶ��滻�����ֶ�
    for /f "tokens=*" %%j in (!var!) do (
        set "tmp=%%j"
        if not !tmp!.==. (
          set "tmp=!tmp:%strOld%=%strNew%!"
          rem ��������ÿһ�м�¼׷�ӵ�temp.txt�ļ���
          echo !tmp!>>temp.txt
        )
    )
    rem �ڵ����ļ���ÿһ�о����滻�����󣬽��������ı���temp.txt��ʱ�ļ�������Ŀ�괦���ļ���(��������ʱ�ļ����Զ�ɾ��)
    move temp.txt !var!
    )
)

