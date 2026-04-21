defmodule AgrupoDeADos do
  def main do
    lista = [1, 2, 3]
    mi = agrupar(lista, {})
    IO.inspect(mi)
  end

  def agrupar([], tupla), do: tupla
  def agrupar([h, h1 | t], tupla) do
      list = [h, h1]
      nueva_tupla = Tuple.append(tupla, list)
      agrupar(t, nueva_tupla)
  end
  def agrupar([h | t], tupla) do
      list = [h]
      nueva_tupla = Tuple.append(tupla, list)
      agrupar(t, nueva_tupla)
  end
end

AgrupoDeADos.main()
