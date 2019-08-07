// Computes the 2D curve, as a 3rd degree polynomial in each dimension (x and y):
//      x(t) = at^3+bt^2+ct+d
//      y(t) = at^3+bt^2+ct+d
// that satisfy the 8 constraints:
//      x(0), x(1), x_dot(0), x_dot(1)
//      y(0), y(1), y_dot(0), y_dot(1)
// where [x_dot(0) y_dot(0)]^T and [x_dot(1) y_dot(1)]^T are the curve tangent vectors
// at the starting and ending points respectively

// clear all
//xdel(winsid());
//clear;

//User entries (constraints)
p_0 = [-0.1;0.71]; //initial point
p_1 = [1;1]; //end point
v_0 = [cos(0.1);sin(0.1)]; //tangent vector at the starting point (normalized)
v_1 = [1;0]; //tangent vector at the ending point (normalized)

// matrix setting
MM = [2 -2 1 1; -3 3 -2 -1; 0 0 1 0; 1 0 0 0];

// solving
tt =[0:0.01:1];
spline_x = [];
spline_y = [];
for ii=1:size(tt)(2)
	spline_x = [spline_x; [tt(ii)^3 tt(ii)^2 tt(ii) 1]*MM*[p_0(1); p_1(1); v_0(1); v_1(1)] ];
	spline_y = [spline_y; [tt(ii)^3 tt(ii)^2 tt(ii) 1]*MM*[p_0(2); p_1(2); v_0(2); v_1(2)] ];
end

//plot
fig1 = figure(0);
fig1.background = 8;
ah = gca();
ah.auto_clear = "off";
ah.isoview = "on";
ah.x_label.text = "$x$";
ah.x_label.font_size = 4;
ah.y_label.text = "$y$";
ah.y_label.font_size = 4;
ah.grid = [0.1 0.1 -1];
plot(spline_x, spline_y,'r');
ah.children.children.thickness = 3;
