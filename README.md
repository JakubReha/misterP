# misterP
---
## Multilevel Regression and Poststratification - Public Opinion
---

### Should employers be allowed to decline coverage of abortions in insurance plans? (Support/Oppose)
Code in pyro and numpyro following the case study of https://bookdown.org/jl5522/MRP-case-studies.
The main notebook with the Probabilsitic model is model.ipynb.
Data folder contains all preprocessed data used in the project.
Cache folder contains saved posteriors, images and models to avoid unnecessary computations.

---
## Notes: 
---
* **Data/poststrat_df.csv** Poststratification data 
* **Data/cces_all_clean.csv** Survey data
* **Data/states.xlsx** US states data

---
## References:
--- 
  - Data Processing code: 
    >- Juan Lopez-Martin, Justin H. Phillips, and Andrew Gelman, Multilevel Regression and Poststratification Case Studies, 
      https://bookdown.org/jl5522/MRP-case-studies/downloading-and-processing-data.html
      https://github.com/JuanLopezMartin/MRPCaseStudy

  - Raw Survey data (CCES Data):
    >- https://dataverse.harvard.edu/api/access/datafile/3588803?format=original&gbrecs=true

  - Raw Poststratification data (American Community Survey Data):
    >- https://www2.census.gov/programs-surveys/acs/data/pums/2018/5-Year/
