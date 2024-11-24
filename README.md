# Static Panel Data Analysis

#### **Author**: Sangita Das  
#### **Purpose**: Panel Data Analysis for Charity Dataset  


## **Overview**

This repository contains code and resources for conducting static panel data analysis on a charity dataset. The analysis involves data exploration, visualization, transformation, and advanced panel regression techniques. Diagnostic tests and model comparisons are included to ensure robust findings.


## **Repository Structure**

### **Files and Folders**

1. **`static_panel_data_analysis_log_file.smcl`**  
   - The Stata log file containing the detailed output of the analysis.

2. **`Data/`**  
   - **`static_panel_data.dta`**: Original dataset used for the analysis.  
   - **`cleaned_data.dta`**: Dataset after cleaning and transformation.  
   - **`data_with_dummy_variables.dta`**: Final dataset including dummy variables for panel identifiers.  

3. **`Graph/`**  
   - Contains visualizations generated during the analysis, including histograms, scatter plots, and line plots.


## **Data Source**

The data was provided during the **Workshop on Panel Data Analysis** at **Rabindra Bharati University**, held on **21st March 2024**.  

- **Resource Person**: Prof. Sebak Kumar Jana, Department of Economics, Vidyasagar University  


## **Acknowledgment**

Special thanks to **Rabindra Bharati University** for organizing the workshop and to **Prof. Sebak Kumar Jana** for providing the dataset and sharing his invaluable insights on static panel data analysis.


## **Key Features of the Script**

### **1. Data Exploration**  
- **Descriptive Statistics**:  
  - Summary statistics (`describe`, `summarize`).  
  - Detailed summaries of key variables.  
- **Data Quality Checks**:  
  - Identifying missing values.  
  - Checking for duplicate observations.  
- **Frequency Tables**:  
  - Frequency distribution for categorical variables.


### **2. Data Visualization**  
- **Histograms**:  
  - Distribution of charity contributions.  
- **Scatter Plots**:  
  - Charity contributions vs. income (with and without fit lines).  
- **Time-Series Visualization**:  
  - Line plot of charity contributions over time.


### **3. Data Transformation**  
- **Variable Recode**:  
  - Transform and categorize variables.  
- **Log Transformation**:  
  - Create log-transformed variables for analysis.  
- **Multicollinearity Check**:  
  - Correlation matrix of key variables.


### **4. Panel Data Setup**  
- **Panel Declaration**:  
  - Specify panel data structure using `xtset`.  
- **Descriptive Statistics**:  
  - Summarize within-group and between-group variation.


### **5. Panel Regression Models**  
- **OLS Regression**:  
  - Basic regression as a baseline.  
- **Fixed Effects (FE) and Random Effects (RE)**:  
  - Estimate panel data models.  
  - Use Hausman Test to compare FE and RE models.  
- **Robust Standard Errors**:  
  - Enhance the reliability of results with robust standard errors.


### **6. Additional Tests and Diagnostics**  
- **Lagrange Multiplier Test**:  
  - Test for the presence of random effects.  
- **Significance Testing**:  
  - Evaluate the joint significance of time and subject dummies.


### **7. Dummy Variables**  
- **Subject Dummies**:  
  - Create dummy variables for panel identifiers.  
  - Run regression models using these dummies.


### **8. Saving Final Dataset**  
- **Export Final Data**:  
  - Save the cleaned and transformed dataset for future analysis.


## **Requirements**

- **Stata**: Required for executing the analysis script.  
- **Git**: Optional, for version control and managing this repository.


## **How to Run**

1. **Load the Data**:  
   Open Stata and load the dataset:  
   ```stata
   use "path/to/static_panel_data.dta", clear
   ```

2. **Run the Script**:  
   Execute the script step by step to explore, visualize, and analyze the data.

3. **Review Outputs**:  
   - Check results in the Stata output window.  
   - View visualizations saved in the `Graph/` folder.

4. **Save Final Dataset**:  
   Ensure the cleaned and processed dataset is saved for future use.

## **Contact**

For queries or feedback, please contact:  
**Sangita Das**  
Email: [dassangita844@gmail.com](mailto:dassangita844@gmail.com)

**Note**: This repository and analysis are intended for educational purposes only.
