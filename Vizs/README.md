List of Files

    UFO_Analysis.twb: Tableau Visualization
    UFO_ANALYSIS.twbx: packaged Tableau Visualization
    wrangling.R: R script for cleaning data
    ufos.csv: cleaned dataset
    hexmap_plots_USA.csv: supplemental data file for visualization

The Visualization

The latest version is available on Tableau Public: https://public.tableau.com/profile/sherry2685#!/vizhome/UFO_ANALYSIS/UFOAnalysis

The Data Source

The underlying dataset contains UFO reports in the USA from 1910 to 2014, which was scrubbed from Sigmond Axel's work. The original data is from the National UFO Reporting Center (http://www.nuforc.org/). My Scrubbing included trimming away non-numeric values in Duration, cleaning strings, replacing 0s and empty strings with nulls, and deleting records without City values, which was done through R.

Data Analysis

Seasons were calculated from the months of the observations and daytime from the hours. The number of observations before 1970s were constantly small so I binned the earlier years together and calculated the yearly average number for each bin. The shapes originally had more than 30 categories. I grouped them into 10 categories according to their similarity.

In the analysis of yearly reports, colors represent average duration of observations; in the analysis of shapes, colors represent shape categories; and in the other charts, colors indicate the median duration of observations.

Acknowledgment

The dataset was scraped, geolocated, and time standardized from NUFORC data by Sigmond Axel on GitHub https://github.com/planetsig/ufo-reports

The tilemap location file (hexmap_plots_USA.csv) was created by the Tableau Zen Master Matt Chambers. Thanks to  Rachel Costa for sharing a tutorial on https://www.thedataschool.co.uk/rachel-costa/create-hex-tile-map-in-tableau/
