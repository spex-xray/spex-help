# plot setting
plot dev xw
plot type data
plot x lin
plot y lin
plot ux a
plot uy fa
plot rx 6:10
plot ry 0:800
plot set 1
# HEG color blue
plot data col 11
plot mod lw 3
plot fill disp f
plot back disp f
plot cap id disp f
plot cap ut disp f
plot cap lt disp f
plot