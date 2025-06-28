# SetHighCPUpriorityToWarframeAtStart
There are 2 files that actually modifies your warframe cpu priority to high.
# Batchfile
The bat file calls the ps1 file (powershell) to execute itself with some params.
 **Params**
-**script_path** the ps1 file
-**steam_game_id** the steam game id
-**launcher_name** Warframe game launcher 
-**game_process** Warframe game exe file  
-**launcher_wait_time** The wait time until it closed. Sometimes when it gets an update it's closing itself that why you need this.
-**game_wait_time** The wait time to check if the game is open.
