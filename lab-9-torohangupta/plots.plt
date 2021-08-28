# roll, pitch, yaw plot
set terminal svg enhanced
set output "attitude.svg"
set title "Roll/Pitch/Yaw Plot"
set xlabel "Message Index"
set ylabel "Degrees/Second"
plot "attitude_log.txt" u 2 with lines lw 1 lc rgb "blue" \
ti "Pitch","attitude_log.txt" u 3 with lines lw 1 lc rgb "red" \
ti "Roll","attitude_log.txt" u 4 with lines lw 1 lc rgb "green" ti "Yaw"
reset

# groundspeed and alt plot
set terminal svg enhanced
set output "groundspeed_altitude.svg"
set title "2D plot of ground speed and altitude"
set xlabel "Message Index"
set ylabel "Altitude (feet)"
set ytics 1000 nomirror tc lt 1
set y2label "Ground speed (knots)"
set y2tics 5 nomirror tc lt 1
plot "gps_log.txt" u 4 axis x1y1 with lines lw 1 lc rgb "blue" ti "Altitude (feet)", \
"gps_log.txt" u 5 axis x1y2 with lines lw 1 lc rgb "green" ti "Ground speed (knots)"
reset

# 3d plot
set terminal svg enhanced
set output "3dplot.svg"
set title "3D representation of flight path"
set xlabel "Longitude (DD)"
set ylabel "Latitude (DD)"
set zlabel "Altitude (feet)"
splot "gps_log.txt" u 2:3:4 with lines lw 1 lc rgb "red" ti "Flight path"
reset

# overlay on iowa
set terminal svg enhanced
set output "mapped_flight.svg"
set title "2D plot of flight path with Iowa outline"
set xlabel "Longitude (DD)"
set ylabel "Latitude (DD)"
set xrange [-97:-90]
set yrange [40.5:43.6]
plot "gps_log.txt" u 2:3 with lines lw 1 lc rgb "red" ti "Flight path", \
"usa.txt" u 2:1 with lines lw 1 lc rgb "blue" ti "State Border"
reset

# zoomed flight path
set terminal svg enhanced
set output "mapped_flight_zoom.svg"
set title "2D plot of flight path"
set xlabel "Longitude (DD)"
set ylabel "Latitude (DD)"
set xrange [-94:-93]
set yrange [41.9:42.3]
plot "gps_log.txt" u 2:3 with lines lw 1 lc rgb "red" ti "Flight path"
reset

# Zoomed in flight path with heading arrows
set terminal svg enhanced
set output "heading_arrows.svg"
set title "Zoomed in flight path with heading arrows"
set xlabel "Longitude (DD)"
set ylabel "Latitude (DD)"
set xrange [-93.35:-93.33]
set yrange [42.2:42.203]
h=0.001
xf(phi) = h*cos(phi/180.0*pi)
yf(phi) = h*sin(phi/180.0*pi)
plot "gps_log.txt" u 2:3 with lines lw 1 lc rgb "red" ti "Flight path", \
"gps_log.txt" u 2:3:(yf($6)):(xf($6)) with vectors lw 1 lc rgb "pink" ti "Heading"
reset