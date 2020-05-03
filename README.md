# DSE 6300 COVID-19 Final Project Documentation

<div align="center">
  <img src="https://extension.unh.edu/sites/default/files/field/image/CDC-coronavirus-image-23311-for-web.jpg"><br><br>
</div>

These are the complete source files for 
[DSE 6300: Data Science Applications Final Project](https://github.com/WorldCapital/COVID19-Project).


## Project Proposal

[COVID-19 Project Proposal](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Project-Proposal/Project-Proposal.pdf) for DSE 6300 was selected based primarily on the timing of the pandemic and its impact to us all and proposed by Kyle W. Brown. This section follows a top down format and structured to indicate contributed work to the overall Project Schedule, goals, deadlines, and success. Words highlighted in blue are hyperlinked to their respective model, markdown file, and Jupyter notebook located in the COVID-19 project GitHub repo. 

* [Abstract](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Project-Proposal/Project-Proposal.pdf) design and build a streaming application that provides a model, predictions, and visualization of COVID19 virus data in a Shiny or Tableau dashboard. The objective of our dashboard is implementing a predictive model to identify which factors have the greatest impact on the spread and strength of the COVID-19 virus in a specific geographic area.
* [Project Objectives](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Project-Proposal/Project-Proposal.pdf) are building a functional dashboard in Shiny presenting COVID19 virus predictions, stream COVID data using Kafka or Spark Streaming, visualization of predictive analytics model and data, and predictions or time series analysis based on COVID19, environmental, and economic factors.
* [Team](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Project-Proposal/Project-Proposal.pdf) members and roles can be found located in the Final Report under Team section.

## Project Schedule

* [Task List](https://waynestateprod-my.sharepoint.com/:x:/g/personal/gd3384_wayne_edu/EZrStx70RNRFje2QqQLxb5sBPcYu6rPgN7-pRDEK7h4D1A?e=D4Fa5v) that lead to the development of the Agile Schedule for project tracking and milestones. 
* [Agile Schedule Excel Workbook](https://github.com/WorldCapital/COVID19-Project/tree/master/Kyle_W._Brown_Final_Report_Ppt/Agile-Schedule-Excel-Workbook) was implemented for project management purposes for project scheduling and completion. The Agile Schedule identifies the tasks, duties, and assignments associated with each stage of the project.
* [Checkpoints](https://github.com/WorldCapital/COVID19-Project/tree/master/Kyle_W._Brown_Final_Report_Ppt/Checkpoints)
were used for weekly project updates to accompany the Project Schedule. 

## Models

* [Linear Regressions](https://github.com/WorldCapital/COVID19-Project/blob/master/Regression_R)
 initial models selected for variable relationships and correlations, [updated with R Markdown]( https://github.com/WorldCapital/COVID19-Project/blob/master/Update.Rmd).  
* [Mulivariate Regressions](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Best-Models-Results/Models-Update-1.Rmd)
* [Non-Linear Regressions](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Best-Models-Results/deathsNLM_nyt.R)
* [Principal Component Analysis (PCA)](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Best-Models-Results/PCA.R) PVE was > 1 indicating high variability.
* [Tensorflow Time Series](https://github.com/WorldCapital/COVID19-Project/blob/master/COVID_Time_Series%20(1).ipynb)
provided a baseline of 35.5% accuracy with not much improvement.
* [Tensorflow SARIMAX](https://github.com/WorldCapital/COVID19-Project/blob/master/TimeSeriesV2/coronaFinalProject.ipynb) 
* [H2O AutoML Models](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Best-Models-Results/gbm-model.R) was the top performer with a 0% training error, 99.81% R-Square, 67.69% MSE, and 82.16% RSME.
* [Complete Models Scores](https://github.com/WorldCapital/COVID19-Project/blob/master/COVID-19/Models%20Final.csv)
 
#### GBM H2O AutoML Model Plot

<div align="center">
  <img src="https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Best-Models-Results/GBM_H2O_AutoML_model.png"><br><br>
</div>


## Group Submission

* [COVID19 Group Final PowerPoint](https://github.com/WorldCapital/COVID19-Project/blob/master/Group_Submission_Final_Report_Ppt/COVID19-Group-Presentation.pdf)
* [COVID19 Group Final Report](https://github.com/WorldCapital/COVID19-Project/blob/master/Group_Submission_Final_Report_Ppt/Final_Report.pdf)


## Kyle W. Brown Submission

* [Kyle W. Brown Final PowerPoint](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Kyle_W._Brown_COIVD19_ppt/Analyzing_COVID-19.pptx)
* [Kyle W. Brown Final Report](https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/Kyle_W._Brown_Final_Report.pdf)

## COVID-19 Tableau Dashboard

* [COVID19-Dashboard](https://github.com/WorldCapital/COVID19-Project/tree/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Dashboard) provides stunning visualizations using heatmaps and dashboard development using Tableau. It is worth noting that Michigan has the highest Mortality Rate (8.2) in all the country.

### Dashboard Screenshots

<div align="center">
  <img src="https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Dashboard/Screenshots/Homepage.png"><br><br>
</div>

<div align="center">
  <img src="https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Dashboard/Screenshots/page2.png"><br><br>
</div>

<div align="center">
  <img src="https://github.com/WorldCapital/COVID19-Project/blob/master/Kyle_W._Brown_Final_Report_Ppt/COVID19-Dashboard/Screenshots/page3.png"><br><br>
</div>
