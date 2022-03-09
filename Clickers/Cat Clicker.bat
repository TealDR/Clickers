:start
@echo off
title Cat Clicker
echo Press any key to start Cat Clicker
set /a cp=1
set /a cpcost=50
set /a cats=0
set /a cp2=1
set /a cpcost2=250
goto load
Pause >nul

:1
cls

echo You have %cats% cats. Your CP (CatPower) is %cp%. Press a and Enter to gain cats equal to CP.
echo The current cost to increase CP by 1 is %cpcost%. Type Buy and press Enter to upgrade your CP.
echo Type Buy2 to buy CP2 which increases CP gained per purchase. You have %cp2% CP2. It costs %cpcost2% to upgrade CP2.
set /p input= 
if %input%==Buy goto 3
if %input%==Buy2 goto 5
if %input%==a set /a cats=%cats% + %cp%
if %input%==p set /a cats=%cats% + %cp% * 1000
if %input%==reset goto reset
if %input%==Reset goto reset
goto save
goto 1



:3
if %cats%==%cpcost% goto 4
if %cats% GTR %cpcost% goto 4
cls
goto 1

:4
set /a cp=%cp% + %cp2%
set /a cats=%cats% - %cpcost%
set /a cpcost=%cpcost% * 2
cls
goto 1

:5
if %cats%==%cpcost2% goto 6
if %cats% GTR %cpcost2% goto 6
cls
goto 1

:6
set /a cp2=%cp2% + 1
set /a cats=%cats% - %cpcost2%
set /a cpcost2=%cpcost2% * 4
cls
goto 1


:save
(
echo %cats%
echo %cp%
echo %cp2%
echo %cpcost%
echo %cpcost2%
)>CatClickerSave.dlb
goto 1

:reset
(
echo 0
echo 1
echo 1
echo 50
echo 250
)>CatClickerSave.dlb
goto load

:load
(
set /p cats=
set /p cp=
set /p cp2=
set /p cpcost=
set /p cpcost2=
)<CatClickerSave.dlb
goto 1
