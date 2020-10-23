#!/bin/bash
#set -x

programsdir=../programs
subsumptiondir=../subsumption-data
satooldir=../satool
satool=satool.jar

rm -f $subsumptiondir/checks-output/allprograms/edgesubsume.csv
program=Chart
version=1b

srcdir=$programsdir/$program/$version/build

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv


program=Cli
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv


program=Closure
version=1b

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Codec
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Collections
version=25b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Compress
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Csv
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Gson
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=JacksonCore
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

# ===> Stopped here.

program=JacksonDataBind
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=JacksonXml
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Jsoup
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=JxPath
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Lang
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Math
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Mockito
version=1b

srcdir=$programsdir/$program/$version/build/classes/main

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Time
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv

program=Weka
version=weka

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/edgesubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main edgesubsume  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/edgesubsume/edgesubsume-${program}

cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption"  > $subsumptiondir/$program/edgesubsume/edgesubsume-${program}.csv
cat $subsumptiondir/$program/edgesubsume/edgesubsume-${program} | grep @@ | grep -v "Local DUA-edge subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, SubDUAs, Perc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/edgesubsume.csv
