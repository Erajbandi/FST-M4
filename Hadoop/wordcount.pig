--Load the input file from HDFS
InputFile = LOAD 'hdfs:///user/Azeema/pigInput.txt' AS (lines);

--Tokenize each work (Map)
words = FOREACH InputFile GENERATE FLATTEN(TOKENIZE(lines)) AS word;

--Group Words
grpd = GROUP words BY word;

--Count the number of words
total_count = FOREACH grpd GENERATE group, COUNT(words);


--Store the result in HDFS
STORE total_count INTO 'hdfs:///user/Azeema/pigOutput333
