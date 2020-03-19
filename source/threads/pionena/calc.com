# init.
log exe init
# obs. data
log exe data
# model setting
log exe mdl_pc
# plot setting
#log exe plot
ca
pl
par show free
