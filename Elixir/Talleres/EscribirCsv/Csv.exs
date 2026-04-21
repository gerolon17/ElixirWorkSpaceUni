defmodule CSV do
  # Lee un archivo, ignora el encabezado y transforma cada línea usando un parser
  def leer_csv(nombre, parser) do
    nombre
    |> File.stream!()
    |> Stream.drop(1)
    |> Enum.map(parser)
  end

  # Genera una cadena con formato CSV a partir de una lista de datos
  def generar_mensaje_csv(datos, parser) do
    datos
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  # Escribe los datos en un archivo físico incluyendo títulos
  def escribir_csv(datos, nombre, titulos, parser) do
    datos
    |> generar_mensaje_csv(parser)
    |> (&(titulos <> "\n" <> &1)).()
    |> (&File.write(nombre, &1)).()
  end
end
