Get-ChildItem -Recurse -Directory -Hidden -Filter .git | ForEach-Object { & git --git-dir="$($_.FullName)" --work-tree="$(Split-Path $_.FullName -Parent)" pull }
