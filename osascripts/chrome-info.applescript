tell application "Google Chrome"
    set activeURL to URL of active tab of front window
    set totalTabs to 0
    set allWindows to every window
    repeat with aWindow in allWindows
        set totalTabs to totalTabs + (count of tabs of aWindow)
    end repeat
    return {activeURL, totalTabs}
end tell
