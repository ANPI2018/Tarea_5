1;

#
# Ordinary differential equation
#
function u = f1(x,y)
	u = x*(y^2);
endfunction


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

		#New ki values of formula.
		k1 = f(current_x,current_y);	
		k2 = f(current_x+(1/2)*h,current_y+(1/2)*k1*h);
		k3 = f(current_x+(1/2)*h,current_y+(1/2)*k2*h);
		k4 = f(current_x+h, current_y+k3*h);

		#Runge Kutta 4th degree iteration formula.
		next_y = current_y+(1/6)*(k1+2*k2+2*k3+k4)*h; 
		current_y = next_y;
		
		#Changes to the next x by adding the step to the current x.
		next_x = current_x+h;	
		current_x = next_x;

		x_vector(i)= current_x;
		y_vector(i)= current_y;
		h_vector(i) = h;
		i=i+1;
		
	end
	plot(x_vector,y_vector, 'linewidth', 1.5);
	
	#Plot configuration
  xlabel("x_{i}", "fontweight", "bold");
  ylabel("y(x_{i})", "fontweight", "bold");
  s = sprintf("Function evaluated in the interval %u \\leq x \\leq %u", xi, xf);
  title(s);
  box on;

	x=x_vector;				#Points where the function was evaluated
	y=y_vector(i-1); 	#Solution in the final point xf
endfunction



#usage [hi,yi] = rungekuttaError()
#
# Plots the error in the point x=1 in function
# of the step size h, of the ODE f1 = x*(y^2)
#
# Return values
#	hi Vector with the steps sizes
# yi Vector with the values of y(1)
#
function [hi,yi] = rungekuttaError()

	xi=0;							#Initial point
	xf=1;							#Final point
	y0=1;							#Initial condition
	h = 1/8;					#Initital step size
	realValue = 2;		#Real value of the function in x=1
	
	hi = zeros(1,8);
	yi = zeros(1,8);
	i=1;
	
	while(h>=(1/1024))
		
		[x,y] = rungekutta4(@f1,xi,xf,y0,h);
		hi(i) = h;
		yi(i) = abs(y-realValue);
		h=h/2;
		i=i+1;
		disp(h);
	end
	
	semilogy(hi,yi, 'linewidth', 1.5);
	
	#Plot configuration
	axis([min(hi), max(hi), min(yi), max(yi)]);
	#set(gca, 'XTick', [1/1024:127/5120:1/8]); # 5 ticks in the x-axis
  xlabel("h_{i}", "fontweight", "bold");
  ylabel("y(x)", "fontweight", "bold");
  s = sprintf("Function evaluated in the interval %u \\leq x \\leq %u \n \
  \ using different step sizes %s \\leq h \\leq %s", xi, xf, "1/1024", "1/8");
  title(s);
  box on;

endfunction
