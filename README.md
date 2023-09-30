# Steam Game Updater

This script is designed to update your Steam games using SteamCMD. It automates the process of checking for updates and applying them to your games.

**Important Notes:**

- Running this script will temporarily disrupt your connection to the Steam application until the next application restart.

- This script is not fully automated and requires external scheduling tools like the Windows Task Scheduler for regular updates.
- The script relies on the visibility settings of your Steam game library. To ensure proper functionality, make sure your Steam profile's privacy settings allow everyone to view your game library.

## Prerequisites

- [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) must be installed on your system.
- PowerShell should be available.

## Usage

1. Edit the script and set your Steam username in the `$steamUsername` variable.

2. Generate a `login.xml` file using `Export-Clixml` and `Get-Credential`. The file should contain your encrypted Steam credentials for security reasons, so you don't store your password in plain text. You can use the following command to generate it:

   ```powershell
   Get-Credential | Export-Clixml -Path "login.xml"
