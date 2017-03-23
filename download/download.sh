# Download input files. Execute from the `download` directory.
for url in \
  'https://www.elsevier.com/__data/assets/excel_doc/0015/91122/title_list.xlsx' \
  'https://journalmetrics.scopus.com/downloads/metrics/CiteScore_Metrics_2011-2105_Download_19_Jan2017.xlsx' \
	'https://raw.githubusercontent.com/dhimmel/delays/756ffebf309499a500ec1f83d68803c044ec8729/data/pubmed-journals.tsv';
do
	wget --timestamping --no-verbose $url
done
