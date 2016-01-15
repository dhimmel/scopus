# Parsing data from journalmetrics.com

This repository extracts part of the [Journal Metrics](http://www.journalmetrics.com/values.php) dataset and exports it to tidy TSVs. All execution is performed by the [`process.ipynb`](process.ipynb). The `data` directory contains the two tidy outputs:

1. [`issn.tsv`](data/issn.tsv) containing a mapping between scopus journal identifiers and ISSNs.
2. [`metrics.tsv.gz`](data/metrics.tsv.gz) containing available `SNIP`, `IPP`, `SJR` values.

The current version of this repository is based on `SNIP_IPP_SJR_complete_1999_2014.xlsx`.
