# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
# set output '3dboxes.1.png'
set boxwidth 0.4 absolute
set boxdepth 0
set grid nopolar
set grid noxtics nomxtics noytics nomytics ztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid vertical layerdefault   lt 0 linecolor 0 linewidth 1.000,  lt 0 linecolor 0 linewidth 1.000
set view 59, 24, 1, 1
set style data lines
set xyplane at 0
set title "3D Boxes" 
set yrange [ 0.00000 : 6.00000 ] noreverse nowriteback
set pm3d interpolate 1,1 flush begin noftriangles border lt black linewidth 1.000 dashtype solid corners2color mean
rgbfudge(x) = x*51*32768 + (11-x)*51*128 + int(abs(5.5-x)*510/9.)
ti(col) = sprintf("%d",col)
## Last datafile plotted: "candlesticks.dat"
splot for [col=5:4:-1] 'candlesticks.dat' using 1:(col):col       with boxes title ti(col)
