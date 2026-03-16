tell application "System Events"
    set frontApp to first application process whose frontmost is true
    set appName to displayed name of frontApp
end tell
return appName
