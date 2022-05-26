#!/bin/bash
#set -x

programsdir=../programs
subsumptiondir=../subsumption-data
satooldir=../satool
satool=satool.jar
rm -f $subsumptiondir/checks-output/allprograms/duaduasubsume.csv
program=Chart
version=1b

srcdir=$programsdir/$program/$version/build

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv


program=Cli
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv


program=Closure
version=1b

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Codec
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Collections
version=25b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Compress
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Csv
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Gson
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=JacksonCore
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

# ===> Stopped here.

program=JacksonDatabind
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=JacksonXml
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Jsoup
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=JxPath
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Lang
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Math
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Mockito
version=1b

srcdir=$programsdir/$program/$version/build/classes/main

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Time
version=1b

srcdir=$programsdir/$program/$version/target/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv

program=Weka
version=weka

srcdir=$programsdir/$program/$version/build/classes

echo $program; destdir=$subsumptiondir/$program/duaduasubsume
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir   -dest $destdir >& $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}

cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption"  > $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program}.csv
cat $subsumptiondir/$program/duaduasubsume/duaduasubsume-${program} | grep @@ | grep -v "DUA-DUA subsumption" | grep -v "@@ Method, Nodes, Edges, DUAs, UDUAs, RDUAs, UPerc, RPerc, Time_s, Time_ms" >> $subsumptiondir/checks-output/allprograms/duaduasubsume.csv
