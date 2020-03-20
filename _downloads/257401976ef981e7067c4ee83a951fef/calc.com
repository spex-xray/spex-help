# init.
log exe init
# obs. data
log exe data
# plot setting
log exe plot
# model setting
log exe mdl_pc
elim 1:1.E3 ryd
calc
plot
par show free
