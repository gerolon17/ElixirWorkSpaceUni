defmodule SumaRetorno do
  # Caso base: Cuando la lista está vacía, terminamos la recursión.
  def suma([]), do: :ok

  # Paso recursivo: Separamos la lista en "cabeza" (primer elemento) y "cola" (resto).
  def suma([head | tail]) do
    # Imprimimos el primer número
    sum = head + tail
    IO.puts(head + tail)

    # Llamamos a la función recursivamente con el resto de la lista
    suma(sum)
  end
end

# Ejemplo de uso:
ListPrinter.print([1, 2, 3, 4, 5])
