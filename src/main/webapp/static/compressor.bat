@echo off
rem author thinkgem@163.com
echo Compressor JS and CSS?
pause
cd %~dp0

call compressor\compressor.bat common
call compressor\compressor.bat metronic\assets\global\plugins\jquery-jbox\2.3\Skins\Bootstrap\jbox.css
call compressor\compressor.bat metronic\assets\global\plugins\jquery-jbox\2.3\jquery.jBox-2.3.js
call compressor\compressor.bat metronic\assets\global\plugins\jquery-ztree\3.5.28\css\zTreeStyle\zTreeStyle.css
rem call compressor\compressor.bat metronic\assets\global\plugins\jerichotab\css\jquery.jerichotab.css
rem call compressor\compressor.bat metronic\assets\global\plugins\jerichotab\js\jquery.jerichotab.js
call compressor\compressor.bat metronic\assets\global\plugins\treeTable\themes\vsStyle\treeTable.css
call compressor\compressor.bat metronic\assets\global\plugins\treeTable\jquery.treeTable.js
call compressor\compressor.bat modules

echo.
echo Compressor Success
pause
echo on