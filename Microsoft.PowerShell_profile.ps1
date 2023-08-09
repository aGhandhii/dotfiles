<#
POWERSHELL CONFIG
Author: Alex Ghandhi
Last Edited: 9 August 2023
#>


# ALIASES
# {{{

function Get-QuickExit{exit}
Set-Alias -Name :q -Value Get-QuickExit -Force -Option AllScope
Set-Alias -Name c -Value clear
Set-Alias -Name vi -Value vim

# }}}


# GIT SHORTCUTS
# {{{

# Function Definitions
function Get-GitStatus              { & git status $args }
function Get-GitLog                 { & git log $args }
function Get-GitBranch              { & git branch $args }
function Get-GitAdd                 { & git add $args }
function Get-GitCommit              { & git commit $args }
function Get-GitPush                { & git push $args }
function Get-GitRebaseOrigin        { & git rebase origin $args }
function Get-GitRevParse            { & git rev-parse HEAD $args }
function Get-GitInteractiveRebase   { & git rebase -i HEAD~$args }

# Alias Pairings
Set-Alias -Name gs   -Value Get-GitStatus               -Force -Option AllScope
Set-Alias -Name gl   -Value Get-GitLog                  -Force -Option AllScope
Set-Alias -Name gb   -Value Get-GitBranch               -Force -Option AllScope
Set-alias -Name ga   -Value Get-GitAdd                  -Force -Option AllScope
Set-alias -Name gc   -Value Get-GitCommit               -Force -Option AllScope
Set-alias -Name gp   -Value Get-GitPush                 -Force -Option AllScope
Set-alias -Name gro  -Value Get-GitRebaseOrigin         -Force -Option AllScope
Set-alias -Name grph -Value Get-GitRevParse             -Force -Option AllScope
Set-alias -Name grih -Value Get-GitInteractiveRebase    -Force -Option AllScope

# }}}

# CUSTOM PROMPT
# {{{

#function prompt {
#    # Place components of the prompt into variables
#    $curr_dir = $ExecutionContext.SessionState.Path.CurrentLocation.Path
#    if ($curr_dir.Length -eq 0) {
#        $curr_dir = $ExecutionContext.SessionState.Drive.Current.Name+":\"
#    }
#
#    Write-Host "$env:USERNAME" -NoNewline
#    Write-Host "$env:COMPUTERNAME" -NoNewline
#    Write-Host "$curr_dir"
#    "-> "
#}

# }}}
