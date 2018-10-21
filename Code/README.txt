----------------------------------------------------------------------
Tarea 2						Juan Pablo Brenes Coto
                  Pablo Bustamante Mora
                  Emily Sancho Murillo

Profesor: Dr. Pablo Alvarado Moya
Análisis Numérico para Ingeniería		19 Octubre, 2018
----------------------------------------------------------------------

----------------------------------------------------------------------
        INSTRUCCIONES DE EJECUCIÓN DEL SCRIPT "Tarea_5.m"
----------------------------------------------------------------------

1) Solución de la EDO y'=xy^2 y gráfico de y(x)

  > [x,y] = rungekutta4(f, xi, xf, y0, h);
  
  Parametros de entrada
   f  -> función a solucionar
   xi -> punto inicial
   xf -> punto final
   y0 -> condición inicial
   h  -> tamaño de paso
  
  Valores de retorno
   x -> Puntos utilizados
   y -> Solución de la ecuación en cada punto
  
  La función f1 = xy^2 se encuentra definida dentro del mismo script
  por lo que se llama a la función con su "manejador" @f1
  
  Por lo que para solucionar f1 = xy^2 se debe ejecutar:
  
  > [x,y] = rungekutta4(@f1, 0, 1, 1, 1/8);
  
  
1.1) Gráfico del error final en x=1 de y'=xy^2

	> [hi,yi] = rungekuttaError();
	
	Valores de retorno
	 hi -> Tamaños de paso utilizados (de 1/1024 hasta 1/8)
	 yi -> Error en x=1 respecto al valor real y(1)=2
	       para cada tamaño de paso
	      
	      
2) Solución de la EDO rígida y'=100-y

   > [t1,t2,t3] = stiffEquation();
   
   Valores de retorno
    t1 -> Tiempo requerido por la función rungekutta4
    t2 -> Tiempo requerido por la función ode45
    t3 -> Tiempo requerido por la función ode23
   
   La función muestra la solución de cada método para la EDO rígida
   en todo el intervalo de puntos x de 0 a 200, junto con el tiempo 
   requerido por cada método y el número de puntos utilizados.
   
   En un subgráfico se muestra la solución de cada método en el intervalo
   "x" de 100 a 200 y "y" de 99.8 a 100.2
   
   
----------------------------------------------------------------------
                  COMPARACIÓN DE LOS MÉTODOS
                  Runge-Kutta, ode45 y ode23
----------------------------------------------------------------------


	
	