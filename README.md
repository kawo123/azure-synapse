# Azure Synapse

TODO

## Pre-requisite

TODO

## Getting Started

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

```powershell
Install-Module -Name Az -AllowClobber -Force -SkipPublisherCheck
```

```powershell
Connect-AzAccount
```

```powershell
Select-AzSubscription -Subscription <The selected Subscription Id>
```

```powershell
$sqlpwd = "ThePasswordYouWantToUseForSQL" | ConvertTo-SecureString -AsPlainText -Force
$containerSAS = "TheContainerSASYouHave" | ConvertTo-SecureString -AsPlainText -Force

.\deploy.ps1 -SqlAdminLoginPassword $sqlpwd -BackupStorageContainerSAS $containerSAS
```

Import movie data from `./data/movies_southridge.json` to Azure Cosmos DB using Data Explorer

## TODOs

TODO

---

### PLEASE NOTE FOR THE ENTIRETY OF THIS REPOSITORY AND ALL ASSETS

1. No warranties or guarantees are made or implied.
2. All assets here are provided by me "as is". Use at your own risk. Validate before use.
3. I am not representing my employer with these assets, and my employer assumes no liability whatsoever, and will not provide support, for any use of these assets.
4. Use of the assets in this repo in your Azure environment may or will incur Azure usage and charges. You are completely responsible for monitoring and managing your Azure usage.

---

Unless otherwise noted, all assets here are authored by me. Feel free to examine, learn from, comment, and re-use (subject to the above) as needed and without intellectual property restrictions.

If anything here helps you, attribution and/or a quick note is much appreciated.