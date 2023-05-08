set term svg
set output 'final_retweeted_times.svg'
set boxwidth 0.2
set style fill solid
set grid xtics ytics
set yrange [0:*]
set xrange [-0.5:23.5]
set xtics nomirror
set ytics nomirror
set xlabel "Time"
set ylabel "Number of Occurrences"
plot "../../rt_sorted.csv" using ($2+0.3):1 with boxes notitle
