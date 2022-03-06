:start
@echo off
title Glizzy Clicker
echo Press any key to start Glizzy Clicker
set /a gp1=1
set /a gpcost1=50
set /a glizzys=0
set /a gp2=1
set /a gpcost2=250
Pause >nul
goto load

:1
cls
echo You have %glizzys% glizzys. Your GP (GlizzyPower) is %gp1%. Press a and Enter to gain glizzys equal to GP.
echo The current cost to increase GP by 1 is %gpcost1%. Type Buy and press Enter to upgrade your GP.
echo Type Buy2 to buy GP2 which increase GP gained per purchase. You have %gp2% GP2. It costs %gpcost2% to upgrade GP2.
set /p input= 
if %input%==Buy goto 3
if %input%==Buy2 goto 5
if %input%==a set /a glizzys=%glizzys% + %gp1%
goto save


goto 1



:3
if %glizzys%==%gpcost1% goto 4
if %glizzys% GTR %gpcost1% goto 4
cls
goto 1

:4
set /a gp1=%gp1% + %gp2%
set /a glizzys=%glizzys% - %gpcost1%
set /a gpcost1=%gpcost1% * 2
cls
goto 1

:5
if %glizzys%==%gpcost2% goto 6
if %glizzys% GTR %gpcost2% goto 6
cls
goto 1

:6
set /a gp2=%gp2% + 1
set /a glizzys=%glizzys% - %gpcost2%
set /a gpcost2=%gpcost2% * 4
cls
goto 1


:save
(
echo %glizzys%
echo %gp1%
echo %gp2%
echo %gpcost1%
echo %gpcost2%
)>GlizzyClickerSave.dlb
goto 1

:load
(
set /p glizzys=
set /p gp1=
set /p gp2=
set /p gpcost1=
set /p gpcost2=
)<GlizzyClickerSave.dlb
goto 1