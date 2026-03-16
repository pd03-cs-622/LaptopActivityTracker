tell application "Google Chrome"
    set activeURL to URL of active tab of front window
    set tabCount to count of tabs of front window
    return {activeURL, tabCount}
end tell
