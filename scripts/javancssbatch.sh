#!/bin/bash
set -x
metricsdir=../subsumption-data/checks-output/metrics

programsdir=../programs
subsumptiondir=../subsumption-data
javancssdir=../tools

program=Chart
version=1b

srcdir=$programsdir/$program/$version/source

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}


program=Cli
version=1b

srcdir=$programsdir/$program/$version/src/java/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}


program=Closure
version=1b

srcdir=$programsdir/$program/$version/src/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}


program=Codec
version=1b

srcdir=$programsdir/$program/$version/src/java/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Collections
version=25b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Compress
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Csv
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}


program=Gson
version=1b

srcdir=$programsdir/$program/$version/gson/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=JacksonCore
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

# ===> Stopped here.

program=JacksonDataBind
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=JacksonXml
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Jsoup
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=JxPath
version=1b

srcdir=$programsdir/$program/$version/src/java/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Lang
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Math
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Mockito
version=1b

srcdir=$programsdir/$program/$version/src/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Time
version=1b

srcdir=$programsdir/$program/$version/src/main/

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=Weka
version=weka

srcdir=$programsdir/$program/$version/src/main

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=elki-6465675
version=elki-src

srcdir=$programsdir/$program/$version

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=systemds-3.0.0-rc2
version=systemds-src

srcdir=$programsdir/$program/$version/src/main

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}

program=stanford-corenlp-4.4.0
version=CoreNLP-src

srcdir=$programsdir/$program/$version/src

echo $program
time $javancssdir/javancss-32.53/bin/javancss -all $srcdir   >& $metricsdir/metrics-${program}
