# SetHighCPUpriorityToWarframeAtStart
There are 2 files that actually modifies your warframe cpu priority to high.
# Batchfile
The bat file calls the ps1 file (powershell) to execute itself with some params.
 # Params
-**script_path** the ps1 file. <br/>
-**steam_game_id** the steam game id. <br/>
-**launcher_name** Warframe game launcher. <br/>
-**game_process** Warframe game exe file. <br/>
-**launcher_wait_time** The wait time until it closed. Sometimes when it gets an update it's closing itself that why you need this. <br/>
-**game_wait_time** The wait time to check if the game is open.
