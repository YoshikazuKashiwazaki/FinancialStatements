#!/bin/sh -xv

tmp=/tmp/$$
#dir="$(dirname $0)/FY2018/DENPYOU"
dir="$(dirname $0)"
echo 'Content-type: text/html'
echo ''
echo '<html>'
echo '<head>'
echo '<meta http-equiv="content-type" charset="utf-8">'
echo '</head>'
echo '<body>'
echo '<h2>Financial Statemens</h2>'
echo '<h3>FY2018 総勘定元帳</h3>'

for file in $(ls -f ${dir}/FY2018/DENPYOU | sort -k1,1 -n);
do 
cat "${dir}/FY2018/DENPYOU/${file}"   |
sed 's/\(.*\)/\1<br \/>/'  >> $tmp-denpyou ;
done

cat $tmp-denpyou          |
grep -E "[0-9]{8}"

echo ''
echo '<p></p>'
source ./bin/zandaka_web みずほ
#cat ${dir}/FY2018/REPORT/zandaka_みずほ（法人）.tsv  
echo '<p></p>'
ls ${dir}/FY2018/DENPYOU | wc -l
echo '</body>'
echo '</html>'

rm -f $tmp-*
