Code.require_file("../Ejercicio1/util.ex")

defmodule ValidadorCupon do
  # --- Función principal para interactuar con el usuario ---
  def main do
    cupon = Util.ingresar("Ingrese el código de su cupón promocional: ", :texto)

    # Ejecutamos la validación
    resultado = validar(cupon)

    # Evaluamos la tupla que nos devuelve la validación
    case resultado do
      {:ok, mensaje} ->
        Util.mostrar_mensaje("✅ RESULTADO: " <> mensaje)

      {:error, mensaje} ->
        Util.mostrar_mensaje("❌ ERROR: " <> mensaje)
    end
  end

  # --- Tubería de validación ---
  def validar(cupon) do
    {cupon, []}
    |> validar_longitud()
    |> validar_mayuscula()
    |> validar_numero()
    |> validar_espacios()
    |> formatear_resultado()
  end

  defp validar_longitud({cupon, errores}) do
    if String.length(cupon) >= 10 do
      {cupon, errores}
    else
      {cupon, ["debe tener al menos 10 caracteres" | errores]}
    end
  end

  defp validar_mayuscula({cupon, errores}) do
    if String.downcase(cupon) != cupon do
      {cupon, errores}
    else
      {cupon, ["debe contener al menos una letra mayúscula" | errores]}
    end
  end

  defp validar_numero({cupon, errores}) do
    numeros = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    if String.contains?(cupon, numeros) do
      {cupon, errores}
    else
      {cupon, ["debe contener al menos un número" | errores]}
    end
  end

  defp validar_espacios({cupon, errores}) do
    if String.replace(cupon, " ", "") == cupon do
      {cupon, errores}
    else
      {cupon, ["no debe contener espacios en blanco" | errores]}
    end
  end

  # --- Formateo final ---
  defp formatear_resultado({_cupon, []}) do
    {:ok, "Cupón válido"}
  end

  defp formatear_resultado({_cupon, errores}) do
    mensaje_unido =
      errores
      |> Enum.reverse()
      |> Enum.join(" y ")

    {:error, "El cupón " <> mensaje_unido}
  end
end

# Arrancamos el programa
ValidadorCupon.main()
