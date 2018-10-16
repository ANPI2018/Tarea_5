1;

#usage [x,y] = rungekutta4(f,xi,xf,y0,h)
#
# Solve ordinary differential equations using
# the Runge-Kutta method of 4th order
#
# f is the differential equation to be solve
#
# xi and xf are the initial and final points
#
# y0 initial value
#
# h is the step size
function [x,y] = rungekutta4(f,xi,xf,y0,h)


	current_x = xi;	
	current_y = y0;
	
	x_vector = zeros(1,1/h);
	y_vector = zeros(1,1/h);
	h_vector = zeros(1,1/h);
  i=1;
	
	while (current_x < xf) 

		k1 = f(current_x,current_y);	#New ki values of formula.
		k2 = f(current_x+(1/2)*h,current_y+(1/2)*k1*h);
		k3 = f(current_x+(1/2)*h,current_y+(1/2)*k2*h);
		k4 = f(current_x+h, current_y+k3*h);

		next_y = current_y+(1/6)*(k1+2*k2+2*k3+k4)*h; #Runge Kutta 4th degree iteration formula.
		current_y = next_y;

		next_x = current_x+h;	#Changes to the next x by adding the step to the current x.
		current_x = next_x;

		x_vector(i)= current_x;
		y_vector(i)= current_y;
		h_vector(i) = h;
		i=i+1;
		
	end
	plot(x_vector,y_vector, 'linewidth', 1.5);
	
	#Configuración del gráfico
  xlabel("x_{i}", "fontweight", "bold");
  ylabel("y(x_{i})", "fontweight", "bold");
  s = sprintf("Function evaluated in the interval %u \\leq x \\leq %u", xi, xf);
  title(s);
  box on;

	x=x_vector;				#Points where the function was evaluated
	y=y_vector(i-1); 	#Solution in the final point xf
endfunction
