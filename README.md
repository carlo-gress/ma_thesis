# Master's Thesis: Count me in? How Considering Foreign Residents in the Population Statistics Affects Federal Constituency Boundaries

## Overview

This repository contains the R scripts, datasets, and additional resources used for my Master's Thesis at Hertie School, Berlin.

## Repository Structure

- `/thesis.rmd` - This filec contains the analysis code
- `/Data sources` - This directory contains all datasets used in the thesis
- `/tables` - This directory includes all tables referenced in the thesis
- `/final_figures` - This directory includes all figures referenced in the thesis

## How to Use

To replicate the analysis presented in the thesis:
1. Clone this repository to your local machine and set the working directory.
2. Run the thesis.rmd file for replicating the analysis

## Dependencies

List of R packages and other software dependencies required to run the scripts:
- **tidyverse**
- **sf**
- **sp**
- **plotly**
- **leaflet**
- **mapview**
- **tmap**
- **gridExtra**
- **kableExtra**
- **readxl**
- **redist**

- ## Executive Summary

Prior to each federal election in Germany, it is necessary to revise the geographic boundaries of numerous constituencies to address shifts in demographic composition. Legally, the population size of any given constituency must not exceed a deviation of more than 25 per cent from the average constituency population size. Although finding optimal solutions for these redistricting problems remains a relevant task for policymakers, there currently is no universally accepted methodology for determining \textit{how} constituencies should be redistricted. This thesis uses Sequential Monte Carlo (SMC) simulations for proposing mathematically optimal redistricting plans.  \\

Related studies exclusively focused on the current legislation. This analysis combines redistricting simulations with another heavily contested issue: The political rights of foreign residents in Germany. When the population size of constituencies is calculated, foreign residents are not considered, while other groups not eligible to vote (such as children) are included. As a result, this legislation has far-reaching consequences since some constituencies have a tremendously higher total population than others. This, in turn, affects the work of policymakers in the respective constituencies. \\

Since policymakers and scholars have debated whether this legislation should be adjusted, this thesis asks: How would it affect the demographic and geographic composition of federal constituencies in Germany if foreign residents were included in the population figures? After comparing the deviation values under the current legislation and a legislation in which foreign residents would be considered, this thesis calculates how many constituencies would be allocated to each federal state under the latter legislation. Furthermore, the twelve federal constituencies in Berlin are used for demonstrating the SMC redistricting simulation. The data is provided by the Federal Returning Officer (Bundeswahlleiterin, 2021) and the Amt für Statistik Brandenburg (2023). \\

The analysis reveals that considering foreign residents when calculating the population figures has profound consequences: First, the population of numerous constituencies would exceed the limit (absolute deviations from the mean of more than 25 per cent), requiring geographic redistricting. Moreover, the number of constituencies per federal state, which is based on their population, would need to be adjusted: Some states would gain constituencies, while others would lose. Ultimately, the redistricting simulation demonstrates that SMC simulations are an effective tool for this task, successfully meeting all required legal standards. \\


## Contact

For any queries regarding the thesis, please contact:
- Name: Carlo Greß
- Email: carlo-gress@web.de
