:start
@echo off
title Lean Clicker
COLOR 5D
echo Press any key to start Lean Clicker
set /a lp1=1
set /a lpcost1=50
set /a lean=0
set /a lp2=1
set /a lpcost2=250
Pause >nul
goto load

:1
cls

echo You have %lean% liters of pure lean. Your LP (LeanPower) is %lp1%. Press a and Enter to gain lean equal to LP.
echo The current cost to increase LP by 1 is %lpcost1%. Type Buy and press Enter to upgrade your LP.
echo Type Buy2 to buy LP2 which increases LP gained per purchase. You have %lp2% LP2. It costs %lpcost2% to upgrade LP2.
set /p input= 
if %input%==Buy goto 3
if %input%==Buy2 goto 5
if %input%==a set /a lean=%lean% + %lp1%
if %input%==p set /a lean=%lean% + %lp1% * 1000
if %input%==reset goto reset
if %input%==Reset goto reset
goto save
goto 1



:3
if %lean%==%lpcost1% goto 4
if %lean% GTR %lpcost1% goto 4
cls
goto 1

:4
set /a lp1=%lp1% + %lp2%
set /a lean=%lean% - %lpcost1%
set /a lpcost1=%lpcost1% * 2
cls
goto 1

:5
if %lean%==%lpcost2% goto 6
if %lean% GTR %lpcost2% goto 6
cls
goto 1
:6
set /a lp2=%lp2% + 1
set /a lean=%lean% - %lpcost2%
set /a lpcost2=%lpcost2% * 4
cls
goto 1


:save
(
echo %lean%
echo %lp1%
echo %lp2%
echo %lpcost1%
echo %lpcost2%
)>LeanClickerSave.dlb
goto 1

:load
(
set /p lean=
set /p lp1=
set /p lp2=
set /p lpcost1=
set /p lpcost2=
)<LeanClickerSave.dlb
goto 1

:reset
(
echo 0
echo 1
echo 1
echo 50
echo 250
)>LeanClickerSave.dlb
goto load
