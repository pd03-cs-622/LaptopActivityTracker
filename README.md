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

TODO

