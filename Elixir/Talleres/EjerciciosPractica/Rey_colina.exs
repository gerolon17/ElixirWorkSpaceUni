defmodule Rey_colina do
  def main do
    lista = [1,2,3,4,5,6]
    IO.puts(nro_mas_frecuencia(lista, 0))
  end

    def nro_mas_frecuencia([], ac), do: ac
    def nro_mas_frecuencia([h | t], ac) do
      if h > ac do
        nro_mas_frecuencia(t, h)
      else
        nro_mas_frecuencia(t, ac)
      end
    end

end

Rey_colina.main()
