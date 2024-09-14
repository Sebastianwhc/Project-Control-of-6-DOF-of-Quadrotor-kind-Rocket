clear
clc
close all

stifness = 4000000
damping = 4000000
%%
GP_num = [-392 25];
GP_den = [40 0 0];
GP = tf(GP_num,GP_den);



