// Computes the 2D curve, as a 3rd degree polynomial in each dimension (x and y):
//      x(t) = at^3+bt^2+ct+d
//      y(t) = at^3+bt^2+ct+d
// that satisfy the 8 constraints:
//      x(0), x(1), x_dot(0), x_dot(1)
//      y(0), y(1), y_dot(0), y_dot(1)

// clear all
xdel(winsid());
clear;

//User entries (constraints)
x_0 = 0;
x_1 = 3;
x_dot_0 = 0;
x_dot_1 = 0;
y_0 = 0;
y_1 = 2;
y_dot_0 = 0;
y_dot_1 = 0;
cx = [x_0; x_1; x_dot_0; x_dot_1];
cy = [y_0; y_1; y_dot_0; y_dot_1];

// matrix setting
AA = [0 0 0 1; 1 1 1 1; 0 0 1 0; 3 2 1 0];

// solving
px = AA\cx;
py = AA\cy;

//plot
fig1 = figure(0);
fig1.background = 8;
ah = gca();
ah.isoview = "on";
ah.x_label.text = "$x$";
ah.x_label.font_size = 4;
ah.y_label.text = "$y$";
ah.y_label.font_size = 4;
plot_colors = ["r";"g";"b";"k";"y"];
tt =[0:0.01:1];
xx = px(1)*tt^3+px(2)*tt^2+px(3)*tt+px(4);
yy = py(1)*tt^3+py(2)*tt^2+py(3)*tt+py(4);
plot2d(xx,yy);
