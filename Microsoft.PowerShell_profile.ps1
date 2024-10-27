# POWERSHELL CONFIG
# Author: Alex Ghandhi


# ALIASES
# {{{

function Get-QuickExit{exit}
Set-Alias -Name :q -Value Get-QuickExit -Force -Option AllScope
Set-Alias -Name c  -Value clear
Set-Alias -Name vi -Value vim

# Bash-like 'ls'
function List         { If (Get-Command lsd) { & lsd $args }    Else { & Get-ChildItem } }
function ListAll      { If (Get-Command lsd) { & lsd -a $args } Else { & Get-ChildItem } }
function ListDetailed { If (Get-Command lsd) { & lsd -l $args } Else { & Get-ChildItem } }
Set-Alias -Name ls -Value List
Set-Alias -Name la -Value ListAll
Set-Alias -Name ll -Value ListDetailed

# }}}


# GIT SHORTCUTS
# {{{

# Function Definitions
function Get-GitStatus              { & git status $args }
function Get-GitLog                 { & git log $args }
function Get-GitBranch              { & git branch $args }
function Get-GitAdd                 { & git add $args }
function Get-GitCommit              { & git commit $args }
function Get-GitCheckout            { & git checkout $args }
function Get-GitPush                { & git push $args }
function Get-GitRebase              { & git rebase $args }
function Get-GitRevParse            { & git rev-parse HEAD $args }
function Get-GitInteractiveRebase   { & git rebase -i HEAD~$args }

# Alias Pairings
Set-Alias -Name gs   -Value Get-GitStatus               -Force -Option AllScope
Set-Alias -Name gl   -Value Get-GitLog                  -Force -Option AllScope
Set-Alias -Name gb   -Value Get-GitBranch               -Force -Option AllScope
Set-alias -Name ga   -Value Get-GitAdd                  -Force -Option AllScope
Set-alias -Name gc   -Value Get-GitCommit               -Force -Option AllScope
Set-alias -Name gch  -Value Get-GitCheckout             -Force -Option AllScope
Set-alias -Name gp   -Value Get-GitPush                 -Force -Option AllScope
Set-alias -Name gr   -Value Get-GitRebase               -Force -Option AllScope
Set-alias -Name grph -Value Get-GitRevParse             -Force -Option AllScope
Set-alias -Name grih -Value Get-GitInteractiveRebase    -Force -Option AllScope

# }}}


# CUSTOM PROMPT
# {{{

# Escape sequences are possible with `e[
# FG         - `e[38;2;R;G;Bm
# BG         - `e[48;2;R;G;Bm
# FG_default - `e[39
# BG_default - `e[49

function prompt {
    try {
        $branch = git rev-parse --abbrev-ref HEAD
        if ($branch -eq "HEAD") {
            # Print SHA
            $branch = git rev-parse --short HEAD
            Write-Host "" -NoNewline -ForegroundColor yellow
            Write-Host "$branch" -NoNewline -ForegroundColor black -BackgroundColor yellow
        }
        elseif ($branch) {
            Write-Host "" -NoNewline -ForegroundColor yellow
            Write-Host "$branch" -NoNewline -ForegroundColor black -BackgroundColor yellow
        }
    } catch {
        # Repo has no branch yet
        Write-Host "" -NoNewline -ForegroundColor yellow
        Write-Host "no_branch" -NoNewline -ForegroundColor black -BackgroundColor yellow
    }
    if ($branch) {
        Write-Host ""              -ForegroundColor yellow  -BackgroundColor green   -NoNewline
    } else {
        Write-Host ""              -ForegroundColor green   -NoNewline
    }
    Write-Host "$env:USERNAME"     -ForegroundColor black   -BackgroundColor green   -NoNewline
    Write-Host ""                  -ForegroundColor green   -BackgroundColor magenta -NoNewline
    Write-Host "$env:COMPUTERNAME" -ForegroundColor black   -BackgroundColor magenta -NoNewline
    Write-Host ""                  -ForegroundColor magenta -BackgroundColor blue    -NoNewline
    Write-Host "$pwd"              -ForegroundColor black   -BackgroundColor blue    -NoNewline
    Write-Host ""                  -ForegroundColor blue
    "-> "
}

# }}}
