# Business disruptions from social distancing

# Citation
Please cite as 

> Koren, Miklós and Rita Pető. 2020. "Business disruptions from social distancing." Covid Economics, Issue 2. CEPR, London, UK. http://koren.mk/papers/working_papers/social_distancing/

## Release notes
### Version submitted to PLOS ONE
If you are interested in replicating the version we submitted to PLOS ONE, please use [Release version 1.1](https://github.com/ceumicrodata/social-distancing/tree/v1.1)

### Version submitted to arXiv
The version published on arXiv removes some occupations where telecommunication can more easily be used. Code and data are available at [Release version 1.2](https://github.com/ceumicrodata/social-distancing/tree/v1.2)

Please cite this version as
> Koren, Miklós, and Rita Pető. 2020. “Business Disruptions from Social Distancing.” arXiv [econ.GN]. arXiv. http://arxiv.org/abs/2003.13983.

### Version submitted to Covid Economics
The version compares our occupation indexes to that of Dingel and Neiman (2020) and cite several pieces of parallel research using O* NET data. Code and data are available at [Release version 1.3](https://github.com/ceumicrodata/social-distancing/tree/v1.3)

# License and copyright
All text (`*.md`, `*.txt`, `*.tex`, `*.pdf`) are [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/). All code (`*.do`, `Makefile`) are subject to the [3-clause BSD license](https://opensource.org/licenses/BSD-3-Clause). All derived data (`data/derived/*`) are subject to [Open Database License](https://opendatacommons.org/licenses/odbl/index.html). Please respect to copyright and license terms of original data vendors (`data/raw/*`).

# Data availability statement
All the data used in the analysis, including raw data, is available for reuse with permissive licenses. Raw data are saved in the folder `data/raw/`. The `Makefile` in each folder shows the URLs used to download the data.
## O* NET
### Citation
> U.S. Department of Labor/Employment and Training Administration, 2020. "O* NET Online." Downloaded 2020-03-12.
### License
CC-BY-4.0 https://www.onetonline.org/help/license

## Current Employment Statistics
### Citation
> U.S. Bureau of Labor Statistics. 2020. "Current Employment Statistics."
https://www.bls.gov/ces/ Downloaded 2020-03-15.

### License
Public domain: https://www.bls.gov/bls/linksite.htm

## National Employment Matrix
### Citation
> U.S. Bureau of Labor Statistics. 2018. "National Employment Matrix."
https://www.bls.gov/emp/data/occupational-data.htm Downloaded 2020-03-15.

### License
Public domain: https://www.bls.gov/bls/linksite.htm

## Crosswalk
### Citation
> U.S. Bureau of Labor Statistics. 2019. "O* NET-SOC to Occupational Outlook Handbook Crosswalk."
https://www.bls.gov/emp/classifications-crosswalks/nem-onet-to-soc-crosswalk.xlsx Downloaded 2020-03-15.

### License
Public domain: https://www.bls.gov/bls/linksite.htm

## GeoNames
### Citation
> Wick, Marc, Christophe Boutreux et al. 2020. "GeoNames geographical database." Available at: https://www.geonames.org/ Accessed on 2020-03-22.

### License
[CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)

## County Business Patterns
### Citation
> U.S. Bureau of the Census. 2017. "County Business Patterns." Available at https://www.census.gov/programs-surveys/cbp.html

### License
https://www.census.gov/data/developers/about/terms-of-service.html

# Replication instructions
### Software
Analysis uses [Stata 15.1](https://www.stata.com/stata15/) without any additional Stata packages.

The entry point for analysis is `analysis/Makefile`, which can be run by [GNU Make](https://www.gnu.org/software/make/) on any Unix-like system by 
```
cd analysis
make
```

The dependence of outputs on code and input data is captured in the respective Makefiles.

We have used Mac OS X, but all the code should run on Linux and Windows platforms, too.
### Hardware
The analysis takes a few minutes on a standard laptop.

### File organization
1. Raw data are in `data/raw/<vendor>/<dataset>`. This data is saved as it has been received from the data publisher, downloaded by the respective Makefiles. Each folder has a `README.md` with data citation and license terms.
2. Clean data are in `data/clean/<dataset>`. Each folder has a `Makefile` that specifies the steps of data cleaning.
3. Analysis data are in `data/derived/<topic>`. Each folder has a `Makefile` that specifies the steps of sample specification, variable selection and modification.
4. Analysis codes are in `analysis/`. A `Makefile` specifies how the .do files have to be run to reproduce the analysis.

| Exhibit | File | Code |
|---------|------|------|
| Table 1 |   NA   | NA    |
| Table 2 | `data/derived/top-industries.csv`  | `analysis/toplist.do`   |
| Table 3 | `analysis/cost_by_naics2.csv`     | `analysis/counterfactual.do`     |
| Figure 1 | NA | NA |
| Figure 2 | NA | NA |
| Figure 3 | `text/fig3.pdf` | `analysis/scatter_customers_teamwork_byoccupation.do` |
| Figure 4 | `text/fig4.pdf` | `analysis/risk-by-density.do` |
