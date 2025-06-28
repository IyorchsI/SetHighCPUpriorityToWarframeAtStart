@echo off
setlocal EnableDelayedExpansion
set "script_path=%~dp0ChangeSteamGamePriorityWithLauncher.ps1"
set "steam_game_id=steam://rungameid/230410"
set "launcher_name=Launcher"
set "game_process_name=Warframe.x64"  
set "launcher_wait_time=10"
set "game_wait_time=15"

echo !script_path!

powershell.exe -noprofile -ExecutionPolicy Bypass -file !script_path! -steam_game_id "!steam_game_id!" -launcher_name "!launcher_name!" -game_process_name "!game_process_name!" -launcher_wait_time !launcher_wait_time! -game_wait_time !game_wait_time!

:: allow a few seconds for cmd to exit
timeout /t 5 /nobreak

exit