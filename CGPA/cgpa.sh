#!/bin/sh
wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=TjfOqgAVnQXlOo38g2QKt6RNC48MHdYqXVaRAXOA%2BTY%3D" -O s1.pdf
wget -q "https://ktu.edu.in/eu/att/attachments.htm?download=file&id=Na6dUyA4QP1Jq3kRQ3zAQvOTF5ZAbU0zDN3nDdTHph4%3D" -O s2.pdf
wget -q "http://14.139.184.212/ask/c4b/c4b.txt" -O cs4b.txt

pdftotext -layout s1.pdf s1.txt
pdftotext -layout s2.pdf s2.txt

cut -f 4,5 cs4b.txt > c4b.txt
awk '{print($1,$2,$3)}' c4b.txt > c4b1.txt

tr -d "\n\r" < s1.txt > s1temp1.txt
tr -d "\n\r" < s2.txt > s2temp1.txt

sed -i 's/MDL16CS/\nMDL16CS/g' s1temp1.txt 
sed -i 's/MDL16CS/\nMDL16CS/g' s2temp1.txt 
sed -i 's/TCE16CS/\nTCE16CS/g' s1temp1.txt
sed -i 's/TCE16CS/\nTCE16CS/g' s2temp1.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' s1temp1.txt
sed -i 's/ELECTRONICSANDBIOMEDICAL/\nELECTRONICSANDBIOMEDICAL/g' s2temp1.txt

grep 'MDL16CS' s1temp1.txt > s1cs.txt 
grep 'MDL16CS' s2temp1.txt > s2cs.txt
grep 'MDL16CS' c4b1.txt > csb4.txt

sed -i 's/MA101/  : MA101/g' s1cs.txt
sed -i 's/CY100/  : CY100/g' s2cs.txt

join csb4.txt s1cs.txt > joins1.txt
join csb4.txt s2cs.txt > joins2.txt
column -t -s $':' joins1.txt > joins11.txt 
column -t -s $':' joins2.txt > joins22.txt

sed -i 's/(O)/ 10/g;s/(A+)/ 9/g;s/(A)/ 8.5/g;s/(B+)/ 8/g;s/(B)/ 7/g;s/(C)/ 6/g;s/(P)/ 5/g;s/(F)/ 0/g;s/(FE)/ 0/g;s/(I)/ 0/g;s/(Absent)/ 0/g' joins11.txt
sed -i 's/MA101/ 4 /;s/PH100/ 4/;s/BE110/ 3/;s/EE100/ 3/;s/BE103/ 3/;s/BE10105/ 3/g;s/PH110/ 1/g;s/EE110/ 1/g;s/CS110/ 1/g' joins11.txt
sed -i 's/,/ /g' joins11.txt
sed -i 's/(O)/ 10/g;s/(A+)/ 9/g;s/(A)/ 8.5/g;s/(B+)/ 8/g;s/(B)/ 7/g;s/(C)/ 6/g;s/(P)/ 5/g;s/(F)/ 0/g;s/(FE)/ 0/g;s/(I)/ 0/g;s/(Absent)/ 0/g' joins22.txt
sed -i 's/MA102/ 4/g;s/BE100/ 4/g;s/BE102/ 3/g;s/EC100/ 3/g;s/CY100/ 4/g;s/CS100/ 3/g;s/CS120/ 1/g;s/EC110/ 1/g;s/CY110/ 1/g' joins22.txt
sed -i 's/,/ /g' joins22.txt

awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21)/23) }' joins11.txt > s1sgpa1.txt
awk '{ print ($1" "$2" "$3":"($4 * $5 + $6 * $7 + $8* $9 + $10 * $11 + $12 * $13 + $14 * $15 + $16 * $17 + $18 * $19 + $20 * $21)/24) }' joins22.txt > s2sgpa1.txt
column -t -s $':' s1sgpa1.txt > s1sgpa.txt
column -t -s $':' s2sgpa1.txt > s2sgpa.txt
cut -d ':' -f 2 s2sgpa1.txt > s2sgpa3.txt
paste s1sgpa.txt s2sgpa3.txt |awk '{print($1" "$2" "$3"  :"($4*23 + $5*24)/47)}' |column -t -s $':' > cgpa.txt
echo
echo  *****************CGPA OF CS4B STUDENTS******************
echo
cat cgpa.txt
rm c4b*.txt
rm joins*.txt
rm *.pdf
rm s*.txt
rm cs*.txt
