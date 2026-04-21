Code.require_file("../Ejercicio1/util.ex")

defmodule Matrushka do
  n_inicial = Util.ingresar("Ingrese el numero de matrushkas: ", :entero)
  mprimir_matrushka(n_inicial)
  def imprimir_matrushka(n_inicial) do
      n = n_inicial
       IO.puts(n)
       cond do
      n == 1 -> imprimir_matrushka(n+1) 
      n != 1 -> precio_con_descuento
      n == n_inicial -> precio_con_descuento # Cláusula por si el usuario escribe otra cosa
    end

  end
end
