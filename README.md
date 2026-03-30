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
![](/graphs/fig_2_heatmap_laptop_activity.png)
![](/graphs/fig_3_most_viewed_apps.png)
![](/graphs/fig_4_top_domains.png)
![](/graphs/fig_5_window_switches_all.png)
![](/graphs/fig_6_window_switches_with_subplot.png)
![](/graphs/fig_7_window_switches_overlap.png)
