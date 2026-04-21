defmodule Print_diagonal do
  def main do
    matrix = [
      [2, 3, 4, 5],
      [1, 5, 4, 6],
      [7, 2, 1, 9],
      [2, 3, 4, 5]
    ]

    print_diagonal(matrix, 0)
  end

  def print_diagonal(matrix, i) do
    # 1. Calculamos el límite una sola vez
    # Usamos length(lista) que es más directo para listas
    filas_length = length(matrix)

    # 2. Usamos una estructura condicional que detenga la recursión
    if i < filas_length do
      # Extraemos la fila
      fila = Enum.at(matrix, i)

      # Extraemos el elemento de la diagonal (índice i de la fila i)
      elemento = Enum.at(fila, i)

      IO.puts("Elemento en [#{i}][#{i}]: #{elemento}")

      # 3. Llamada recursiva SOLO si no hemos terminado
      print_diagonal(matrix, i + 1)
    else
      :ok # Fin de la recursión
    end
  end
end

Print_diagonal.main()
