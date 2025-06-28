#Parameters:
param(
    [string]$steam_game_id,
    [string]$launcher_name,
    [string]$game_process_name,
    [int]$launcher_wait_time,
    [int]$game_wait_time
)

Write-Host "Parametros recibidos: Steam Game ID: $steam_game_id, Launcher Name: $launcher_name, Game Process Name: $game_process_name, Launcher Wait Time: $launcher_wait_time, Game Wait Time: $game_wait_time"

if(!$steam_game_id -or !$launcher_name -or !$game_process_name -or !$launcher_wait_time -or !$game_wait_time) {
    Write-Host "Faltan parámetros necesarios. Asegúrate de proporcionar todos los parámetros requeridos."
    exit 1
}

Start-Process $steam_game_id

$count = 0
$proceso = $null
$launcher = $null

do {
$launcher = Get-Process -Name $launcher_name -ErrorAction SilentlyContinue
        if ($launcher) {
            Write-Host "El proceso $(($launcher.Name -split ' |-')[0]) se está ejecutando."
            $count = 0
        }else{
        Write-Host "El proceso launcher no se está ejecutando en este momento."
        $count++    
        Write-Host "Tiempo transcurrido: $count segundos, esperando el launcher."
        }
    Start-Sleep -Seconds 1
} while ($count -lt $launcher_wait_time)

$count = 0

do {
$proceso = Get-Process -Name $game_process_name -ErrorAction SilentlyContinue
        if ($proceso) {
                try {
                    # Usar GetProcessById para obtener el proceso completo con la capacidad de cambiar la prioridad
                    $p = [System.Diagnostics.Process]::GetProcessById($proceso.Id)
                    $p.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High
                    Write-Host "Prioridad cambiada a High para el proceso: $($proceso.Name)"
                } catch {
                    Write-Host "No se pudo cambiar la prioridad del proceso con Id: $($proceso.Id)"
                }
        } else {
        Write-Host "El juego no se está ejecutando en este momento."
        $count++ 
        Write-Host "Tiempo transcurrido: $count segundos, esperando el juego..."
        }

    Start-Sleep -Seconds 1

} while (!$proceso -and ($count -lt $game_wait_time))
