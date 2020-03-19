# plotting
plot dev xw
plot type data
plot ux a
plot uy fa
plot x log
plot rx 1.2E0 1.E4
plot y lin
plot ry 0 50
plot set 2
plot da col 11
plot mo col 3
plot set 3:8
plot da col 6
plot set all
plot back disp f
plot
