defmodule Eliminar_Intrusos do
  def main do
    lista = [1, 2, 3, 3, 4, 5]
    r = eliminar(lista, 3, [])
    IO.inspect(r)
  end

  def eliminar([], _, lista_final), do: lista_final
  def eliminar([h | t], eliminado, lista_final) do
    if(h == eliminado) do
      eliminar(t, eliminado, lista_final)
    else
      lista_new = lista_final ++ [h]
      eliminar(t, eliminado, lista_new)
    end
  end

end

Eliminar_Intrusos.main()
