
defmodule Vocales do
  def contar_vocales(cadena) do
    graphems = String.graphemes(cadena)

    contar_lista(graphems, 0)
  end

  defp contar_lista([], contador), do: contador

  defp contar_lista([h | t], contador) do
    if h in ["a", "e", "i", "o", "u"] do
      contar_lista(t, contador + 1)
    else
      contar_lista(t, contador)
    end
  end
end

IO.puts Vocales.contar_vocales("jaime")
