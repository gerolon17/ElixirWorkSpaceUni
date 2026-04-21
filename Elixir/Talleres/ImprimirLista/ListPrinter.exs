defmodule ListPrinter do
  # Caso base: Cuando la lista está vacía, terminamos la recursión.
  def print([]), do: :ok

  # Paso recursivo: Separamos la lista en "cabeza" (primer elemento) y "cola" (resto).
  def print([head | tail]) do
    # Imprimimos el primer número
    IO.puts(head)

    # Llamamos a la función recursivamente con el resto de la lista
    print(tail)
  end
end

# Ejemplo de uso:
ListPrinter.print([1, 2, 3, 4, 5])
