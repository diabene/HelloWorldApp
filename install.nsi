Unicode true

!include WinMessages.nsh
!include FileFunc.nsh


!addplugindir Plugins 
 
SilentInstall silent
RequestExecutionLevel user
ShowInstDetails hide
 
OutFile "HelloWorldApp.exe"
#Icon "llama-blue.ico"
VIProductVersion 2.67.0.00000
VIAddVersionKey ProductName "HelloWorldApp"
VIAddVersionKey LegalCopyright "Copyright (c) 2023 Emma-Ido Ukpong"
VIAddVersionKey FileDescription "Dynamic Templating Tool"
VIAddVersionKey FileVersion 2.67.0.00000
VIAddVersionKey ProductVersion "2.67 / OpenJRE 14.0.2 (x64)"
VIAddVersionKey InternalName "HelloWorldApp"
VIAddVersionKey OriginalFilename "HelloWorldApp.exe"
 
Section
  SetOverwrite off
 
  SetOutPath "$TEMP\jre-14.0.2-HelloWorldApp"
  File /r "jre-14.0.2\*"
 
  InitPluginsDir
  SetOutPath $PluginsDir
  File ".\target\HelloWorldApp-1.0-SNAPSHOT.jar"
  SetOutPath $TEMP
  ${GetParameters} $R0

  #nsExec::Exec '"$TEMP\jre-14.0.2-HelloWorldApp\bin\javaw.exe" -jar "$PluginsDir\HelloWorldApp-1.0-SNAPSHOT.jar" $R0'
  ExecWait '"$TEMP\jre-14.0.2-HelloWorldApp\bin\javaw.exe" -jar "$PluginsDir\HelloWorldApp-1.0-SNAPSHOT.jar" $R0'
  RMDir /r $PluginsDir
SectionEnd