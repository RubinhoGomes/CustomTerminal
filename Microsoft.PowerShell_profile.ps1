function goto {
    param (
        $location
    )

    switch($location) {
        "nvim" {
            Set-Location -Path "C:\Users\ruben\AppData\Local\nvim"
          }
        "h" {
            Set-Location -Path "$HOME"
        }
        "d" {
            Set-Location -Path "$HOME\OneDrive\Ambiente de Trabalho"
        }
        "fst" {
            Set-Location -Path "C:\Code\1Ano"
        }
        "pj" {
            Set-Location -Path "C:\Code\2Ano"
        }
        "c" {
            Set-Location -Path "C:\Code\_Files"
        }
        "w" {
            Set-Location -Path "C:\wamp64\www\pws"
          }
        default {
            echo "Burro, acrescenta mais opcoes"
        }
    }

}

function weather {
    param (
        $city
    )

    curl wttr.in/$city
}

function parrot {
    curl parrot.live
}

function pask {
    param (
        $planguage,
        $question
    )
    curl cheat.sh/$planguage/$question
}


function f {
    param (
      $filename
    )

   Get-ChildItem -Path C:\ -Filter $filename -Recurse -ErrorAction SilentlyContinue | Where-Object {!$_.PSIscontainer}

   }

function fp {
    param (
      $filename
    )
    
    (Get-ChildItem -Path C:\ -Filter $filename -Recurse -ErrorAction SilentlyContinue | Where-Object {!$_.PSIscontainer} | Select-Object -First 1).FullName | Clip

  }

function flast {
    param (
      $days
    )
    Get-ChildItem -Recurse -File | Where-Object {$_.LastWriteTime -gt (Get-Date).AddDays(-$days)}
  }

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

function oddtk {
    param (
      $name
    )

    taskkill /f /pid "$name"

  }

function mysqlc{
    mysql -u root
  }

function tl {
    param (
      $name
    )

    TASKLIST /fi "imagename eq $name.exe"
  }

function netsall {
    netsh wlan show profile
  }

  function nets{
    param (
      $networkname
    )
    
    netsh wlan show profile $networkname key=clear | Select-String "Key Content"
    
  }

function nmap {
    param (
      $ip
    )

    nmap -sV $ip
  }



function mvi {
    param (
      $filePath,
      $destinationPath
    )
  
    Move-Item -Path $filePath -Destination $destinationPath

  }

function rmv {
    param (
      $fileName
    )

    rmdir -Force $fileName

  }

function cc {
    param (
      $fileName
    )

    gcc "$filename.c" -o "$fileName"

  }



function gccm {
     gcc "main.c" -o "main"
  }

## ------------------- Sound Control ----------------

## If the Volume is muted and the function doesnt work, uncomment the following lines and add the if function
## function checkMute {
    ## $muted = (Get-Volume).Mute
    ## if ($muted -eq $true) {
      ## return $true
    ## } else {
      ## return $false
    ## }
  ## }

##function vol {
    ##param (
      ##$volume
    ##)
    ##unmuteVol
    ##Set-Volume -Volume $volume
  ##}

##function muteVol {
    ##Set-Volume -Mute
  ##}  

##function unmuteVol {
    ##Set-Volume -Unmute
  ##}


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

Set-Alias vi nvim
Set-Alias g git
Set-Alias l ls
Set-Alias c clear
Set-Alias s start
Set-Alias py python3
Set-Alias e explorer
Set-Alias n node

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "者 marvel ♤ ♡ ♢ ♧ "
Invoke-Expression (&starship init powershell)

clear
