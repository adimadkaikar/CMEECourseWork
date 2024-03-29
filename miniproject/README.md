# Miniproject

### This docments outlines the miniproject

'miniproject' contains four directories namely 'code', 'data', 'results, 'sandbox'.

#### Code
This directory contains all the script required to carry out the miniproject workflow. All the scripts have to be called using this directory as the present working directory. The following is a short description of the files present in this directory:

* run_miniproject.sh: This shell script can be used to run the entire workflow. Call this script from inside the code directory to run the entire workflow. 
* cleaning.R: This is the first script of the workflow. It cleans the raw data and saves the modified data to the data folder. This script also carries out rest of the workflow by running the rest of the scripts in the required order.
* mfitting.R: This script is for linear model fitting. It inputs the modfied data, fits the linear models to it and then saves the coefficient as a .csv file in the results folder.
* AIC_func.R: This file generates the functions used for the RSS and AICc calculations. 
* nmfitting.R: This function prepares the data for non-linear model fitting and initilizes and empty dataframe to save the non-linear coefficients.
* nmfittingMini.R: This file fits the Gomertz model to the data and saves the coefficients to the dataframe initialized by nmfitting.R.
* nmfittingMiniLogis.R: THis file fites the Logistic model to the data and saves the coefficients to the dataframe initialized my nmfitting.R.
* plotting.R: This script takes the coeffcient .csvs produced by mfitting.R and nmfitting.R and used them to predict values over multiple timepoints for the data subsets and then plots them. It generates two .pdfs, first containing exploratory plots for linear model fitting and second containg exploratory plots for non-linear model fitting.
* comparison.R: This script comapres the AICc of the different models, generates and saves the plots required for the report.
* report.tex: The .tex file for the report. The following packages are used for the report.
* compileLatex.sh: The script used to compile the .tex file to a PDF report. 
* texcount.pl: This is an executable perl script. This is used to do the word count of the document. This script is not modified and used as a part of the package. 

The following packages are required to run this workflow:
* tidyverse
* minpack.lm

The following LaTex packages are required for compiling the report:
 * babel: Used for typsetting in multiple languages.
 * geometry: A package to change the page length and layout.
 * amsmath: Useful for mathmetical formulae. It also enhances printed output of documents.
 * graphicx: Used for inserting images into Latex.
 * caption: Customizes captions in floating environments like figures and tables.
 * subcaption: Similar function as caption but allows captions to be added for subfigures.
 * textcomp: Supports text companion fonts which provide symbols
 * array: Useful for making tables.
#### Data
This directory has all the data and the metadata for the miniproject. The data modified after cleaning is also saved to this directory. Additonally, a plot for the report is saved here as it is not generated during analysis.

#### Results
This directory id empty presently. On running the workflow, the exploratory plots and the plots required for the report will be saved here. Also, the coefficients for each model will be saved as .csv files here.

#### Sandbox
This directory is for practice and contains practice scripts and files. On GitHub it is empty as it is not meant for submission. 