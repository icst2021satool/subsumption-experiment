#!/bin/bash
set -x


timesubdir=../subsumption-data/checks-output/timedata

programsdir=../programs
subsumptiondir=../subsumption-data
satooldir=../satool
satool=satool.jar

dataflowsubsumptions="nodesubsume edgesubsume reduce"
#dataflowsubsumptions="edgesubsume"

for subsumption in $dataflowsubsumptions
do

for i in {1..10}
do
  echo "==> $subsumption: $i <=="
program=Chart
version=1b

srcdir=$programsdir/$program/$version/build
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


program=Cli
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
            br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


program=Closure
version=1b

srcdir=$programsdir/$program/$version/build/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


program=Codec
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

program=Collections
version=25b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                        br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

program=Compress
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                        br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

program=Csv
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                            br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


program=Gson
version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
                    echo $program
                    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


    program=JacksonCore
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}


    program=JacksonDatabind
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=JacksonDatabind
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=JacksonXml
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Jsoup
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=JxPath
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Lang
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Math
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Mockito
    version=1b

    srcdir=$programsdir/$program/$version/build/classes/main
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Time
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

    program=Weka
    version=weka

    srcdir=$programsdir/$program/$version/build/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main $subsumption  -src $srcdir -dest $destdir  >& $timesubdir/$subsumption-$i-${program}

done
done
