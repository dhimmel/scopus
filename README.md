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
+ [`publishers.tsv`](data/publishers.tsv): number of journals per publisher as well as URL-friendly slugs. Redundant or misspelled publisher names can be manually fixed in [`publisher-name-patches.tsv`](data/publisher-name-patches.tsv).
+ [`title-top-levels.tsv`](data/title-top-levels.tsv): top-level subject categories for each Scopus title
+ [`asjc-codes.tsv`](data/asjc-codes.tsv): ASJC (All Science Journal Classification) code definitions
+ [`subject-areas.tsv`](data/subject-areas.tsv): ASJC subject areas for each Scopus title

### Scopus mappings

The `data` directory contains the following tidy outputs:

+ [`issn.tsv`](data/issn.tsv): a mapping between Scopus titles and ISSNs, including [linking ISSNs](https://github.com/dhimmel/scopus/issues/7).
+ [`pubmed-map.tsv`](data/pubmed-map.tsv): a Scopus–NLM journal mapping

### Journal metrics

+ [`metrics.tsv.gz`](data/metrics.tsv.gz): metrics for Scopus journals
+ [`pubmed-metrics.tsv.gz`](data/pubmed-metrics.tsv.gz): metrics for PubMed journals

## Source and version info

This repository is built from the following publicly-available inputs in [`download`](download):

+ `extlistJuly2021.xlsx`:
  Scopus title list (from "Download Scopus Source List" at [source](https://www.scopus.com/sources))
+ `CiteScore 2011-2020 new methodology - May 2021.xlsb`:
  Journal Metrics
+ `pubmed-journals.tsv`:
  PubMed journal information ([source](https://github.com/dhimmel/delays/blob/master/data/pubmed-journals.tsv) via [process-nlm-catalog.ipynb](https://github.com/dhimmel/delays/blob/4f541e0818322d86365f56671c9634c111eaf8c4/process-nlm-catalog.ipynb))
+ `20210912.ISSN-to-ISSN-L.txt.gz`:
  The "ISSN-L matching table" is extracted and compressed from `issnltables.zip` which is available [upon request](http://www.issn.org/services/online-services/access-to-issn-l-table/) from ISSN.

## Environment

This repository uses [conda](http://conda.pydata.org/docs/) to manage its environment as specified in [`environment.yml`](environment.yml).
Install the environment with:

```sh
conda env create --file=environment.yml
```

Then use `conda activate scopus` and `conda deactivate` to activate or deactivate the environment.

## License

All original work in this repository is dedicated to the public domain under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/legalcode).
Note that this repository incorporates publicly available datasets that were not explicitly released with a public license.
The authors of this repository claim no ownership of this content.
