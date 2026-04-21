defmodule QuitarDuplicado do
  def main do
    lista = [1, 2, 3, 4, 4, 4, 5, 8]

    resultado = comprimir(lista, [])
    IO.inspect(resultado)
  end

  def comprimir([], listaAc), do: listaAc
  def comprimir([h | t], listaAc) do
    if (h in listaAc) do
      comprimir(t, listaAc)
    else
      comprimir(t, listaAc ++  [h])
end
  end
end

QuitarDuplicado.main()
