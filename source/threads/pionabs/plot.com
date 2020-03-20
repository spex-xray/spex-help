# plot setting
plot dev xw
plot type data
plot x lin
plot ux a
plot rx 1.5:60
plot y lin
plot uy fa
plot ry 0:20
plot set 1
plot model lw 3
plot fill disp f
plot back disp f
plot cap id disp f
plot cap ut disp f
plot cap lt disp f
