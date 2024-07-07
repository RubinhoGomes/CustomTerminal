# Done By Rubinho  
# (Quote ...)


# (Semi)Personal Function
# To go quickly to the hardcoded location 
# Why Semi Personal, because this is my hardcoded Paths, so Personal in a Way that it's mine. But you can easily change


function goto {
    param (
        $location
    )

    switch($location) {
        "nvim" {
            Set-Location -Path "C:\Users\Admin\AppData\Local\nvim"
          }
        "h" {
            Set-Location -Path "$HOME"
        }
        "d" {
            Set-Location -Path "$HOME\Desktop"
        }
        "pj" {
            Set-Location -Path "D:\Code\School"
        }
        "c" {
            Set-Location -Path "D:\Code"
        }
        "w" {
            Set-Location -Path "C:\wamp64\www\pws"
          }
        default {
            echo "Burro, acrescenta mais opcoes"
        }
    }

}

# Kinda Personal Function
# Get the Valentines Day 

function getValentineDay {
    $currentDate = Get-Date

    $valentine = Get-Date -Year $currentDate.Year -Month 2 -Day 14 

    if($valentine -lt $currentDate) {
        $valentine = Get-Date -Year ($currentDate.Year + 1) -Month 2 -Day 14
    }

    $timeLeft = ($valentine - $currentDate).Days

    Write-Host "Faltam $timeleft dias para o dia dos namorados"
  }

# Personal Function 
# Get My BirthDay

function getBirthday {
    $currentDate = Get-Date

    $birthday = Get-Date -Year $currentDate.Year -Month 2 -Day 16

    if($birthday -lt $currentDate) {
        $birthday = Get-Date -Year ($currentDate.Year + 1) -Month 2 -Day 16
    }

    $timeLeft = ($birthday - $currentDate).Days

    Write-Host "Faltam $timeleft dias para o meu aniversario"
  }

# Personal Function 
# Get my love birthday

function getMyLoveBirthday {
    $currentDate = Get-Date

    $loveBirthday = Get-Date -Year $currentDate.Year -Month 06 -Day 02
    
    if($loveBirthday -lt $currentDate) {
        $loveBirthday = Get-Date -Year ($currentDate.Year + 1) -Month 06 -Day 02
    }

    $timeLeft = ($loveBirthday - $currentDate).Days

    Write-Host "Faltam $timeleft dias para o aniversario da minha PRINCESA LINDA FOFINHA MARAVILHOSA PERFEITA CHEIROSA GOSTOSA"
  }

# Personal Function 
# Get my love date (Where We started dating)

function getLoveDate {
    $currentDate = Get-Date

    $loveDate = Get-Date -Year 2024 -Month 2 -Day 18

    $timeLeft = (($currentDate - $loveDate).Days) + 1 ## Para contar o proprio dia

    Write-Host "Estamos juntos a $timeleft dias"
  }

# Get the Weather

function weather {
    param (
        $city
    )

    curl wttr.in/$city
}

# Just for fun xD

function parrot {
    curl parrot.live
}

# Using a Curl Request to get an answer to the question on a programming language

function pask {
    param (
        $planguage,
        $question
    )
    curl cheat.sh/$planguage/$question
}

# Save a Note in a specific file (hardcoded)

function save {
    param(
      [string]$notes
    ) 

    echo "Saving: $notes"

    Add-Content -Path "C:\Code\_Files\FastNotes.md" -Value "`nNote: $notes"
    Add-Content -Path "C:\Code\_Files\FastNotes.md" -Value "`n##################"    
    
    echo "Saved Secessufuly"

  }

# Find the file given by parameter 

function f {
    param (
      $filename
    )

   Get-ChildItem -Path C:\ -Filter $filename -Recurse -ErrorAction SilentlyContinue | Where-Object {!$_.PSIscontainer}

   }

# Find the path or paths of the specific name of the file

function fp {
    param (
      $filename
    )
    
    (Get-ChildItem -Path C:\ -Filter $filename -Recurse -ErrorAction SilentlyContinue | Where-Object {!$_.PSIscontainer} | Select-Object -First 1).FullName | Clip

  }

# Find last created or changed file in a period of time / days

function flast {
    param (
      $days
    )
    Get-ChildItem -Recurse -File | Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-$days)}
  }

 Find Last file changed or created  

function flast {
    Get-ChildItem -Recurse -File | Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-7)}
  }

function tk {
    param (
      $name
    )

    taskkill /f /im "$name.exe"

  }


#TODO: Function to search odd PID in tl, so can be terminated with tk
function oddtl{
    param (
      $name
    )

    TASKLIST /fi "imagename eq $name.exe"

  }


# Still Working on it

function oddtk {
    param (
      $name
    )

    taskkill /f /pid "$name"

  }

# To authenticate the MySQL 

function mysqlc{
    mysql -u root
  }

# To kill an task with is name

function tl {
    param (
      $name
    )

    TASKLIST /fi "imagename eq $name.exe"
  }

# To get all the Networks Names
# Not usable on this computer

function netsall {
    netsh wlan show profile
  }


# To quickly get the Network Passowrd
# Not usable on this computer

  function nets{
    param (
      $networkname
    )
    
    netsh wlan show profile $networkname key=clear | Select-String "Key Content"
    
  }

# To use the NMAP on an IP

function nmap {
    param (
      $ip
    )

    nmap -sV $ip
  }

# To move or more quickly a file or directory 

function mvi {
    param (
      $filePath,
      $destinationPath
    )
  
    Move-Item -Path $filePath -Destination $destinationPath

  }

# @Brief: To remove quickly a file  // Not tested to directorys yet 

function rmv {
    param (
      $fileName
    )

    rmdir -Force $fileName

  }

# @Brief: To facilitate the compile of the "fileName", inserted in the parameter

function cc {
    param (
      $fileName
    )

    gcc "$filename.c" -o "$fileName"

  }

# @Brief: To facilitate the compile of the main file

function gccm {
     gcc "main.c" -o "main"
  }

# ------------------- Sound Control ----------------

# If the Volume is muted and the function doesnt work, uncomment the following lines and add the if function
# function checkMute {
    # $muted = (Get-Volume).Mute
    # if ($muted -eq $true) {
      # return $true
    # } else {
      # return $false
    # }
  # }

#function vol {
    # param (
      # $volume
    # )
    # unmuteVol
    # Set-Volume -Volume $volume
  # }

# function muteVol {
    # Set-Volume -Mute
  # }  

# function unmuteVol {
    # Set-Volume -Unmute
  # }


## ----------- GIT HUB MANAGEMENT -------------------

function g-s {
    git status
  }

function g-c {
  param ($message)
    git add .
    git commit -m $message 
  }

function g-ps {
    git push
  }

function g-pl {
    git pull
  }

function g-cl {
    param ($link)
    git clone $link
  }


## --------------------- Alias ----------------------

Set-Alias vi nvim
Set-Alias g git
Set-Alias l ls
Set-Alias c clear
Set-Alias s start
Set-Alias py python3
Set-Alias e explorer
Set-Alias n node
Set-Alias cl "c && l"

## -------------------- Starship CONFIG -------------- 

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者 marvel ♠️ ❤️ ♣️ ♦️ "
Invoke-Expression (&starship init powershell)

clear
