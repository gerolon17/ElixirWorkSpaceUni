Code.require_file("../Ejercicio1/util.ex")

defmodule EntradaEnteros do
def main do
valor_total = "Ingrese valor total de la factura: "
|> Util.ingresar(:entero)
valor_entregado = "Ingrese valor entregado para el pago: "
|> Util.ingresar(:entero)
calcular_devuelta(valor_entregado, valor_total)
|> generar_mensaje()
|> Util.mostrar_mensaje()


EntradaEnteros.main()
