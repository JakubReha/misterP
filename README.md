# misterP
---
## Multilevel Regression and Poststratification - Public Opinion
---
Should employers be allowed to decline coverage of abortions in insurance plans? (Support/Oppose)
Code in pyro and numpyro following the case study of https://bookdown.org/jl5522/MRP-case-studies.
The main notebook with the Probabilsitic model is model.ipynb.
Data folder contains all preprocessed data used in the project.
Cache folder contains saved posteriors, images and models to avoid unnecessary computations.
---
## Notes: 
---
* Poststratification data **Data/poststrat_df.csv**
* Survey data **Data/cces_all_clean.csv**
* US states data **Data/states.xlsx**

---
## References:
--- 
  - Data Processing code: 
    >- Juan Lopez-Martin, Justin H. Phillips, and Andrew Gelman, Multilevel Regression and Poststratification Case Studies, 
      https://bookdown.org/jl5522/MRP-case-studies/downloading-and-processing-data.html

  - Raw Survey data (CCES Data):
    >- https://dataverse.harvard.edu/api/access/datafile/3588803?format=original&gbrecs=true

  - Raw Poststratification data (American Community Survey Data):
    >- https://www2.census.gov/programs-surveys/acs/data/pums/2018/5-Year/
