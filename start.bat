@echo off
FOR /F "tokens=1,2 delims==" %%G IN (fitnesse.properties) DO ( set %%G=%%H)

IF NOT [%FitNesseRootDir%] == [] IF NOT [%FitNesseRoot%] == [] (
  echo 1
  @echo on
  java -jar lib/fitnesse-20221219-standalone.jar -p 8980 -e 0 -d "%FitNesseRootDir%" -r "%FitNesseRoot%" -f configs/custom.properties
  @echo off
  GOTO END
)

IF NOT [%FitNesseRootDir%] == [] (
  echo 2
  @echo on
  java -jar lib/fitnesse-20221219-standalone.jar -p 8980 -e 0 -d "%FitNesseRootDir%" -f configs/custom.properties
  @echo off
  GOTO END
)

IF NOT [%FitNesseRoot%] == [] (
  echo 3
  @echo on
  java -jar lib/fitnesse-20221219-standalone.jar -p 8980 -e 0 -r "%FitNesseRoot%" -f configs/custom.properties
  @echo off
  GOTO END
)
echo 4
@echo on
java -jar lib/fitnesse-20221219-standalone.jar -p 8980 -e 0 -f configs/custom.properties
@echo off

:END
pause
