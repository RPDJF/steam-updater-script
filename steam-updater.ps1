# Edit this, cowboy
$steamUsername = "";


# Check if steamusername was set
if(!$steamUsername)
{ 
    Write-Host "Please edit the script and set your steamid on `$steamUsername variable"
    pause
    exit
}

# Check if there is a login.xml file (please read readme.md)
if(!(Test-Path "login.xml"))
{ 
    Write-Host "Please create a clixml login.xml (read the readme.md)"
    pause
    exit
}

# Fetch steam game list
$data = [xml](curl "https://steamcommunity.com/id/$steamUsername/games?tab=all&xml=1")
# For each games, update it
Write-Host $data
foreach($game in $data.gamesList.games.game)
{
    Write-Host "######## SteamCMD Update - $(Get-Date -Format "yyyyMMdd") ########"
    Write-Host "Updating $($game.name.'#cdata-section')"
    Invoke-Expression "cmd.exe /c C:\Opt\steamcmd.exe +Login $($login.username) $($login.GetNetworkCredential().password) +app_update $($game.appID) +validate +quit"
    Write-Host "Finish"
}
