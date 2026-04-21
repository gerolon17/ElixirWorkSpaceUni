defmodule Clasificador do
  def main do
    lista = [1, 2, 3, 4]
    resultado = clasificar(lista, [], [], {})
    IO.inspect(resultado)
  end

  def clasificar([], lista_par, lista_inpar, tupla) do
    tupla = Tuple.append(tupla, lista_par)
    tupla = Tuple.append(tupla, lista_inpar)
    tupla
  end
  def clasificar([h | t], lista_par, lista_inpar, tupla) do
    if rem(h, 2) == 0 do
      lista_par = lista_par ++ [h]
      clasificar(t, lista_par, lista_inpar, tupla)
    else
      lista_inpar = lista_inpar ++ [h]
      clasificar(t, lista_par, lista_inpar, tupla)
    end
  end
end

Clasificador.main()
