cls

@ECHO OFF
set n=3
set i=0

title Folder Locker

if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK


:LOCK

ren secured "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

attrib +h +s +r +i "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

echo secured locked

goto End

:UNLOCK

echo put in the key to Unlock the lock

if %i%==%n% goto Del
set /a i=%i%+1

set/p "pass=>password"



if NOT %pass%==123456 goto FAIL

attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" secured
echo  ***********************************************
echo  ***********************************************
echo                Access is granted   .
echo  ***********************************************
echo  ***********************************************
pause

goto End

:FAIL

echo  ***********************************************
echo  ***********************************************
echo                Access is denied.
echo  ***********************************************
echo  ***********************************************


goto UNLOCK

:MDLOCKER

md Secured

goto End

:Del
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"

ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" secured

rmdir secured
echo  ***********************************************
echo  *********************************************** 
echo        Delete file because password is worng
echo  ***********************************************
echo  ***********************************************
pause
goto make

:make
if NOT EXIST Locker goto MDLOCKER
goto End

:End
