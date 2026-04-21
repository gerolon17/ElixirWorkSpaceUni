Code.require_file("../Ejercicio1/util.ex")

defmodule Aerolinea do
  def main do
    destino_ingresado = Util.ingresar("Ingrese su destino, Bogota: 1, Medellin: 2, Cartagena: 3, San andres: 4: ", :texto)

    destino = case destino_ingresado do
    "1" -> :bogota
    "2" -> :medellin
    "3" -> :cartagena
    "4" -> :san_andres
    end

    silla_adicional = Util.ingresar("Desea silla adicional por $15000?: (si/no): ", :texto)

    seguro = Util.ingresar("Desea agregar seguro de viaje por $12000: ", :texto)

    total = calcular_precio(destino, silla_adicional, seguro)
    if destino == :san_andres, do: Util.mostrar_mensaje("Se le adicionaran 45000 de la maleta debido a que para san andres es obligatorio.")
    mensajee = "El total a pagar de recargos es: #{total}"
    Util.mostrar_mensaje(mensajee)

  end

defp maleta(destino) when destino == :bogota, do: Util.ingresar("Desea agregar maleta por $45000? (si/no): ", :texto)
defp maleta(destino) when destino == :medellin, do: Util.ingresar("Desea agregar maleta por $45000? (si/no): ", :texto)
defp maleta(destino) when destino == :cartagena, do: Util.ingresar("Desea agregar maleta por $45000? (si/no): ", :texto)
defp maleta(destino) when destino == :san_andres, do: "si"

defp calcular_precio(destino, silla_adicional, seguro) do
  maleta_ = maleta(destino)
  costo_maleta = if maleta_ == "si", do: 45000, else: 0
  costo_silla  = if silla_adicional == "si", do: 15000, else: 0
  costo_seguro = if seguro == "si", do: 12000, else: 0

  costo_maleta + costo_silla + costo_seguro
end
end

Aerolinea.main()
