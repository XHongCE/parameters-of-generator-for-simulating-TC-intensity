clear, clc

coef_net_G_sea = load('coef_net_G_sea.mat');
coef_net_G_land = load('coef_net_G_land.mat');
MeanStdP0 = load('MeanStdOutPut.mat');

% -------------- oversea branch -----------------
dpmax1  = 160;
mld1    = 24;
smlts1  = -9;
vt1     = 6;
s1      = 3;
ln_i1   = -3.5;
dpmax2  = 170;
mld2    = 25;
smlts2  = -9;
vt2     = 6;
s2      = 3;

is_on_land = 0;

x = [dpmax1, mld1, smlts1, vt1, s1, ln_i1, dpmax2, mld2, smlts2, vt2, s2];
y = fun_Dp(x, is_on_land, coef_net_G_sea, coef_net_G_land, MeanStdP0);

% -------------- overland branch -----------------
lat1    = 10.8;
lon1    = 126.3;
vt1     = 8;
s1      = 4;
dp1     = 30;
lat2    = 11.3;
lon2    = 124.8;
vt2     = 7;
s2      = 5.3;
t0      = 3.7;

is_on_land = 1;

x = [lat1, lon1, vt1, s1, dp1, lat2, lon2, vt2, s2, t0];
y = fun_Dp(x, is_on_land, coef_net_G_sea, coef_net_G_land, MeanStdP0);
