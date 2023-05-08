set term svg
set output 'originals3.svg'
set boxwidth 0.7 relative
set style fill solid
set yrange [0:*]
set xrange [-0.5:23.5]
set xtics format '%04.2f'
set xlabel "Time"
set ylabel "Number of Occurrences"
plot "../../sorted_plot.csv" using ($1+0.5):xtic(2) with boxes notitle
