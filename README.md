# Parsing data from journalmetrics.com

This repository creates user-friendly (tidy) TSVs of data from [Journal Metrics](http://www.journalmetrics.com/values.php). Journal Metrics provides three measures (`SNIP`, `IPP`, `SJR`) of journal prestige. This repository provides data in NLM journal IDs for PubMed integration.

Execution is performed by running notebooks in the following order:

1. [`process.ipynb`](process.ipynb) to process the raw Journal Metric download
2. [`pubmed.ipynb`](pubmed.ipynb) to convert to NLM journal IDs

The `data` directory contains three tidy outputs:

1. [`issn.tsv`](data/issn.tsv) containing a mapping between scopus journal identifiers and ISSNs.
2. [`metrics.tsv.gz`](data/metrics.tsv.gz) containing metrics for scopus journals.
3. [`pubmed-metrics.tsv.gz`](data/metrics.tsv.gz) containing metrics for PubMed journals.

The current version of this repository is based on `SNIP_IPP_SJR_complete_1999_2014.xlsx`.
