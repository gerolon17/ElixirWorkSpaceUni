defmodule Contador_Racha do
  def main do
    lista = [1, 1, 2, 2, 3, 4, 4, 4, 4]
    r = contar_rachas(lista)
    IO.inspect(r)
  end

  def contar_rachas([]), do: []


  def contar_rachas([h | t]) do
    contador_lista(t, h, [], 1)
  end

  def contador_lista([], elPrev, listaF, contador) do
    listaF ++ [{elPrev, contador}]
  end

  def contador_lista([h | t], h, listaF, contador) do
    contador_lista(t, h, listaF, contador+1)
  end

  def contador_lista([h | t], elPrev, listaF, contador) do
    nueva_lista = listaF ++ [{elPrev, contador}]

    contador_lista(t, h, nueva_lista, 1)
  end

end

Contador_Racha.main()
