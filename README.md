# LaptopActivityTracker

## Getting Started

This project only works with macOS. To begin the data collection, clone this repo to your root directory and change directory to this repo. Then, run:

```bash
chmod +x run.sh
```

And schedule the file to run every two minutes using `crontab`:

```
crontab -e
```

Settings:

```
*/2 * * * * $HOME/LaptopActivityTracker/run.sh >> $HOME/LaptopActivityTracker/run.log 2>&1
```

## Data Visualization

I ran this script on my work computer from March 17th to March 28th, where I work regular 9 AM to 5 PM Monday through Friday.

For these charts, I am filtering to 8 AM to 6 PM to caputure some edge cases where I start work a little early and end the day a little later. I also redacted my agency's sensitive links (Enterprise GitHub Server URL and Enterprise Splunk URL).

The source code for these charts can be found [in this Jupyter Notebook](/data_visualization.ipynb).

### General Laptop Activities

Because `crontab` jobs only run when the computer is awake (i.e. stops when my Mac goes to sleep or is shut down), I can measure the time when I am at my computer, and it has not fallen asleep.

![](/graphs/fig_1_laptop_activity_distribution.png)

Figure 1 shows the distribution of many logs are sent by the hour of the day (combination of all dates). It's clear from this figure that I usually take a lunch break between 12 PM and 2 PM.

![](/graphs/fig_2_heatmap_laptop_activity.png)

Figure 2 is a heatmap of the same data as above, but split out to see the exact activity per date (the rows). It looks like I am consistently online earlier in the day, but tend to fade out and go do other things past 3 PM.

### App Activities

Each log records what app I am looking at during that time. It also takes note of the current "active Chrome tab" I have opened.

![](/graphs/fig_3_most_viewed_apps.png)

Figure 3 shows that I am mostly looking at Google Chrome during my work hours. The pattern is almost exponential, as I spend half the time looking at Visual Studio Code (my prefered IDE, shows as "Code" app), followed by half that time looking at Slack.

![](/graphs/fig_4_top_domains.png)

Figure 4 shows the domain of the Chrome window I am viewing. The vast majority of the time, I am looking at the GitHub instance my team uses, which makes sense as I spend most of my time on Chrome getting my pull request ready and looking at other's code changes. Second to that is Asana (my team's project management platform), and surprisingly Google searches is third. I thought I would spend most of my day looking at Google results.

### Window Switches

The most interesting data I can get out of this is how often I "context switch" or change focus from looking at one app to another. I got this data by looking at rows where the current window is different from the previous, and I count that as one "window switch" in my dataframe. I group this by 30-minute intervals, meaning since my crontab job runs every 2 minutes, I can perform up to 15 switches during that time.

![](/graphs/fig_5_window_switches_all.png)

Figure 5 shows this data entirely throughout the time period I ran this experience (the large gap being the weekend). I am surprised by how often I reached 12 switches in one 30-minute interval.

![](/graphs/fig_6_window_switches_with_subplot.png)

Figure 6 shows the same data as Figure 5, but zoomed in by day. The timezone is in UTC, so this is still showing 8 AM to 6 PM Eastern time. It looks like Tuesday (March 17th) had the least context-switching, which might be attributed to me being more aware that this data is being recorded. It got higher throughout the week, with the next Tuesday (March 24th) being the worst. Around 2 PM to 3 PM is where most peaks happen, meaning I might be paying less attention during this hour.

![](/graphs/fig_7_window_switches_overlap.png)

Figure 7 shows the same data but overlapped, hoping to see more patterns. again, it seems like after lunch hours past 2 PM is where more window switching happens. Overall, it looks like I do a lot of window switching, much more than I expected.

