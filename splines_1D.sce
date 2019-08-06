// Computes the 3rd degree polynomial:
//      x(t) = at^3+bt^2+ct+d
// that satisfy the 4 constraints:
//      x(0), x(1), x_dot(0), x_dot(1)

// clear all
xdel(winsid());
clear;

//User entries (constraints)
x_0 = 1;
x_1 = 0;
x_dot_0 = 0;
x_dot_1 = 3;
cc = [x_0; x_1; x_dot_0; x_dot_1];

// matrix setting
AA = [0 0 0 1; 1 1 1 1; 0 0 1 0; 3 2 1 0];

// solving
pp = AA\cc;

//plot
fig1 = figure(0);
fig1.background = 8;
ah = gca();
ah.isoview = "on";
ah.x_label.text = "$t$";
ah.x_label.font_size = 4;
ah.y_label.text = "$x$";
ah.y_label.font_size = 4;
plot_colors = ["r";"g";"b";"k";"y"];
tt =[0:0.01:1];
xx = pp(1)*tt^3+pp(2)*tt^2+pp(3)*tt+pp(4);
plot2d(tt,xx);
