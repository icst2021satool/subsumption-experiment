#!/bin/bash
set -x
autosubdir=../subsumption-data/checks-output/autosubsumption

programsdir=../programs
subsumptiondir=../subsumption-data
satooldir=../satool
satool=safilestool.jar

program=Chart
version=1b

srcdir=$programsdir/$program/$version/build
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


program=Cli
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
            br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


program=Closure
version=1b

srcdir=$programsdir/$program/$version/build/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


program=Codec
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

program=Collections
version=25b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                        br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

program=Compress
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                        br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

program=Csv
version=1b

srcdir=$programsdir/$program/$version/target/classes
destdir=$subsumptiondir/$program/reduce
echo $program
time java -cp $satooldir/$satool:$satooldir/dependency/* \
                            br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


program=Gson
version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
                    echo $program
                    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


    program=JacksonCore
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}


    program=JacksonDatabind
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=JacksonDatabind
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=JacksonXml
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Jsoup
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=JxPath
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Lang
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Math
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Mockito
    version=1b

    srcdir=$programsdir/$program/$version/build/classes/main
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Time
    version=1b

    srcdir=$programsdir/$program/$version/target/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}

    program=Weka
    version=weka

    srcdir=$programsdir/$program/$version/build/classes
    destdir=$subsumptiondir/$program/reduce
    echo $program
    time java -cp $satooldir/$satool:$satooldir/dependency/* \
                                    br.usp.each.saeg.subsumption.cli.Main reduce  -src $srcdir -dest $destdir  >& $autosubdir/autosubsumption-${program}
