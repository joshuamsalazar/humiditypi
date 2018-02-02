#!/usr/bin/gnuplot

set terminal png    #output format of graph
set term pngcairo size 800,600    #resolution
set output "prueba_`date --date= +"%Y%m%d"`.png"
set title "T-Water-Y" 
set xlabel "Tiempo[s]"    #horizontal axis name
set ylabel "Temperatura[C] y Humedad[%]"    #vertical axis name 
#set xdata time    #x axis is not numbers, but dates/times
#set timefmt "%Y%m-%d %H:%M:%S"    #format of time is source file (temperature_temporary.dat)
#set format x "%H:%M"    #format of time labels in axis label
set grid xtics lc rgb "#888888" lw 1 lt 0    #grey grid on background
set grid ytics lc rgb "#888888" lw 1 lt 0    #grey grid on background
plot "mydata.dat" using 1:2 lt rgb "red" title "Humedad", "mydata.dat" using 1:3 lt rgb "blue" title "Temperatura"
 
 
