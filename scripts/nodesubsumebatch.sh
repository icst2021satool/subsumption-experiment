#!/bin/bash
#set -x

programsdir=../programs
subsumptiondir=../subsumption-data
satooldir=../satool
satool=satool.jar

rm -f $subsumptiondir/checks-output/allprograms/nodesubsume.csv
program=Chart
version=1b

srcdir=$programsdir/$program/$version/build

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv


program=Cli
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv


program=Closure
version=1b

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Codec
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Collections
version=25b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Compress
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Csv
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Gson
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=JacksonCore
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

# ===> Stopped here.

program=JacksonDatabind
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=JacksonXml
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Jsoup
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=JxPath
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Lang
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Math
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Mockito
version=1b

srcdir=$programsdir/$program/$version/build/classes/main

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Time
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv

program=Weka
version=weka

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/nodesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main nodesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/nodesubsume/nodesubsume-${program}

cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption"  > $subsumptiondir/$program/nodesubsume/nodesubsume-${program}.csv
cat $subsumptiondir/$program/nodesubsume/nodesubsume-${program} | grep @@ | grep -v "Local DUA-node subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/nodesubsume.csv
