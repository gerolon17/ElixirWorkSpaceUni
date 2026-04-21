Code.require_file("../Ejercicio1/util.ex")

defmodule Hotel do
  def main do
    # Convertimos el texto ingresado a un entero para poder hacer los cálculos luego
    noches_texto = Util.ingresar("Ingrese noches: ", :texto)
    noches = String.to_integer(noches_texto)

    tipo_cliente = Util.ingresar("Ingrese el tipo del cliente (frecuente, corporativo, ocasional): ", :texto)

    tipo = case tipo_cliente do
      "frecuente" -> :frecuente
      "corporativo" -> :corporativo
      "ocasional" -> :ocasional
      _ -> :ocasional # Es buena práctica tener un valor por defecto
    end

    temporada = Util.ingresar("Ingrese el tipo de temporada (alta/baja): ", :texto)

    # Llamamos a la función y guardamos/mostramos el resultado
    total = calcular(noches, tipo, temporada)
    IO.puts("El total a pagar es: #{round(total)}")
  end

  # Función principal de cálculo
  def calcular(noches, tipo, temporada) do
    tarifa = tarifa_base(noches)
    precio_con_descuento = descuento(tarifa, tipo)

    # Retornamos el precio final con el recargo
    recargo_temporada(temporada, precio_con_descuento)
  end

  # --- A partir de aquí, las funciones privadas están FUERA de `calcular` ---

  defp tarifa_base(noches) when noches <= 2, do: 120000 * noches
  defp tarifa_base(noches) when noches <= 5 and noches >= 3, do: 100000 * noches
  defp tarifa_base(noches) when noches > 5, do: 85000 * noches

  defp descuento(tarifa, :frecuente), do: tarifa - (tarifa * 0.20)
  defp descuento(tarifa, :corporativo), do: tarifa - (tarifa * 0.15)
  defp descuento(tarifa, :ocasional), do: tarifa

  defp recargo_temporada(temporada, precio_con_descuento) do
    cond do
      temporada == "alta" -> (precio_con_descuento * 0.25) + precio_con_descuento
      temporada == "baja" -> precio_con_descuento
      true -> precio_con_descuento # Cláusula por si el usuario escribe otra cosa
    end
  end
end

Hotel.main()
