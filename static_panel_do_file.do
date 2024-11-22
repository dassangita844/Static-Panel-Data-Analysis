*********************************************
* Static Panel Data Analysis
* Author: Sangita Das
* Purpose: Panel Data Analysis for Charity Dataset
*********************************************

* Start logging operations and output
log using "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\static_panel_data_analysis_log_file.smcl", replace

* Load data
use "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Data\static_panel_data.dta", clear

*********************************************
* DATA EXPLORATION
*********************************************

* Check dataset structure and summary
describe
summarize
summarize charity income price age ms deps, detail

* Check for missing data
misstable summarize

* Inspect the first 10 rows of specific variables
list charity income price age ms deps in 1/10

* Check for duplicate observations
duplicates report

* Frequency table for a categorical variable
tabulate age

*********************************************
* DATA VISUALIZATION
*********************************************

* Histogram of continuous variables
*histogram charity, color(blue) title("Histogram of Charity")
histogram charity, color(blue) title("Histogram of Charity") xtitle("Charity")
graph export "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Graph\Graph_histogram_charity.png", replace

* Scatterplot of charity vs income
*scatter charity income, mcolor(red) title("Scatterplot: Charity vs Income")
scatter charity income, mcolor(red) title("Scatterplot: Charity vs Income") ytitle("Charity contributions")

graph export "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Graph\scatter_plot_charity_income.png", replace

* Scatterplot with a linear fit line

twoway (scatter charity income) (lfit charity income), title("Scatterplot with Fit Line")

graph export "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Graph\scatter_plot_with_fitline.png", as(png) replace


*********************************************
* DATA TRANSFORMATION
*********************************************

* Recode variable categories
recode charity (1=10) (2=20), gen(new_charity)

* Generate a new variable (log transformation)
generate log_charity = log(charity)

* Check for multicollinearity
corr charity income price age ms deps

* Save the cleaned dataset
save "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Data\cleaned_data.dta", replace

*********************************************
* DECLARE PANEL DATA STRUCTURE
*********************************************

* Declare panel data
xtset subject time

*********************************************
* VISUALIZE PANEL DATA TRENDS
*********************************************

* Line plot of charity over time
*xtline charity, overlay legend(off) title("Charity Over Time")
xtline charity, overlay legend(off) title("Charity Over Time") ytitle("Charity Contributions Over Time")

graph export "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Graph\charity_over_time.png", replace

*********************************************
* DESCRIPTIVE STATISTICS FOR PANEL DATA
*********************************************

* Summarize within and between variation
xtsum charity income price age ms deps

*********************************************
* PANEL DATA REGRESSION ANALYSIS
*********************************************

* Perform OLS regression
reg charity income price age ms deps

* Fixed Effects Model (FE)
xtreg charity income price age ms deps, fe
estimates store fe

* Random Effects Model (RE)
xtreg charity income price age ms deps, re
estimates store re

* Hausman Test (FE vs RE)
hausman fe re

* Fixed Effects Model with robust standard errors
xtreg charity income price age ms deps, fe robust

* Random Effects Model with robust standard errors
xtreg charity income price age ms deps, re robust

*********************************************
* ADDITIONAL TESTS AND DIAGNOSTICS
*********************************************

* Lagrange Multiplier Test for Random Effects
xttest0

* Test joint significance of time dummies
reg charity income price age ms deps i.time
testparm i.time

* Test joint significance of subject dummies
reg charity income price age ms deps i.subject
testparm i.subject

* Regression with both subject and time dummies
reg charity income price age ms deps i.subject i.time
testparm i.subject i.time

*********************************************
* GENERATE DUMMY VARIABLES FOR PANEL IDENTIFIERS
*********************************************

* Create dummy variables for 'subject'
quietly tabulate subject, generate(sub_dum_)

* Regression using one dummy variable as an example
reg charity sub_dum_47

* Regression with all subject dummies (not recommended due to multicollinearity)
reg charity income price age ms deps sub_dum_*

* save the final data with dummy variables
save "C:\Users\Sangita Das\Desktop\Panel_data\Panel_Sangita\Data\data_with_dummy_variables.dta", replace
*********************************************
* END OF SCRIPT
*********************************************

* Close the log file to save all output
log close
