function[x,y]= rungekutta4(f,xi,xf,y0,h)

	% Aplique el método RK4 para resolver dy/dx=f(x,y)
	% con y(xi)=y0, entre xi y xf
	% La salida x=xi:h:xf
	% La salida y será la solución a la EDO

	f = @(x,y)(x*(y^2));	%first function to test.

	current_x = xi;	%Current values to iterate.
	current_y = y0;
	
	x_vector = 0;
	y_vector = 0;
	h_vector = 0;
	
	for contador = xi : xf	%Iterates through all the interval.

		k1 = f(current_x,current_y);	%New ki values of formula.
		k2 = f(current_x+(1/2)*h,current_y+(1/2)*k1*h);
		k3 = f(current_x+(1/2)*h,current_y+(1/2)*k2*h);
		k4 = f(current_x+h, current_y+k3*h);

		next_y = current_y+(1/6)*(k1+2*k2+2*k3+k4)*h; %Runge Kutta 4th degree iteration formula.
		current_y = next_y;

		next_x = current_x+h;	%Changes to the next x by adding the step to the current x.
		current_x = next_x;

		x_vector(contador)= current_x;
		y_vector(contador)= current_y;
		h_vector(contador) = h;
		h = h/2;	%Dividing the step by two.

	loglog(x_vector,y_vector)	
	semilogy(,h_vector)
	end
