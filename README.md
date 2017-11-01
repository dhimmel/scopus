# Tidying and mapping Scopus and Journal Metrics data

This repository creates user-friendly (tidy) TSVs of data from [Scopus](https://www.elsevier.com/solutions/scopus/content) and [Journal Metrics](http://www.journalmetrics.com/values.php) and converts data to NLM journal IDs for PubMed integration. Data pulled from Scopus include journal subject areas and open access status. Data pulled from Journal Metrics include journal three measures (`CiteScore`, `SJR`, `SNIP`) of journal prestige and a Scopus–ISSN mapping.

Execution is performed by running notebooks in the following order:

+ [`1.process-titles.ipynb`](1.process-titles.ipynb) to process the raw Scopus title list
+ [`2.process-metrics.ipynb`](2.process-metrics.ipynb) to process the raw Journal Metric download
+ [`3.pubmed.ipynb`](3.pubmed.ipynb) to convert Scopus IDs to NLM journal IDs

### Scopus titles

The `data` directory contains the following tidy outputs:

+ [`titles.tsv`](data/titles.tsv): IDs and names for titles in Scopus
+ [`title-attributes.tsv`](data/title-attributes.tsv): attributes for Scopus titles such as open access status, publisher, and active status (excludes conference proceedings)
+ [`title-top-levels.tsv`](data/title-top-levels.tsv): top-level subject categories for each Scopus title
+ [`asjc-codes.tsv`](data/asjc-codes.tsv): ASJC (All Science Journal Classification) code definitions
+ [`subject-areas.tsv`](data/subject-areas.tsv): ASJC subject areas for each Scopus title

### Scopus mappings

The `data` directory contains the following tidy outputs:

+ [`issn.tsv`](data/issn.tsv): a mapping between Scopus titles and ISSNs
+ [`pubmed-map.tsv`](data/pubmed-map.tsv): a Scopus–NLM journal mapping

### Journal metrics

+ [`metrics.tsv.gz`](data/metrics.tsv.gz): metrics for Scopus journals
+ [`pubmed-metrics.tsv.gz`](data/pubmed-metrics.tsv.gz): metrics for PubMed journals

## Source and version info

This repository is built from the following publicly-available inputs in [`download`](download):

+ `title_list.xlsx`: Scopus title list ([source](https://www.elsevier.com/solutions/scopus/content))
+ `CiteScore_Metrics_2011-2105_Download_19_Jan2017.xlsx`: Journal Metrics ([source](https://journalmetrics.scopus.com/))
+ `pubmed-journals.tsv`: PubMed journal information ([source](https://github.com/dhimmel/delays/blob/master/data/pubmed-journals.tsv))

See [`download.sh`](download/download.sh), which downloads local copies of the inputs, for the source URLs.

## Environment

This repository uses [conda](http://conda.pydata.org/docs/) to manage its environment as specified in [`environment.yml`](environment.yml).
Install the environment with:

```sh
conda env create --file=environment.yml
```

Then use `source activate scopus` and `source deactivate` to activate or deactivate the environment. On windows, use `activate scopus` and `deactivate` instead.
