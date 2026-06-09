@echo off

REM Create android/app directory if it doesn't exist
if not exist android\app mkdir android\app

set KEYSTORE=android\app\keystore.jks
set KEYSTORE_TYPE=JKS
set ALGORITHM=RSA
set KEY_SIZE=2048
set VALIDITY=10000
set ALIAS=release

keytool -genkey -v ^
  -keystore %KEYSTORE% ^
  -storetype %KEYSTORE_TYPE% ^
  -keyalg %ALGORITHM% ^
  -keysize %KEY_SIZE% ^
  -validity %VALIDITY% ^
  -alias %ALIAS%

echo Keystore generated: %KEYSTORE%