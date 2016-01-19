# Backup input files locally to the `download` directory
mkdir --parents download

for url in 'https://www.elsevier.com/__data/assets/excel_doc/0015/91122/title_list.xlsx' 'http://www.journalmetrics.com/documents/SNIP_IPP_SJR_complete_1999_2014.xlsx' 'https://raw.githubusercontent.com/dhimmel/delays/756ffebf309499a500ec1f83d68803c044ec8729/data/pubmed-journals.tsv';
do
	wget --timestamping --directory-prefix download --no-verbose $url
done

