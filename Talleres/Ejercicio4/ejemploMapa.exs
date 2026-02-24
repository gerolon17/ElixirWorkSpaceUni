#Mapa con atomos, aplicar un descuento a todos los productos

productos = [
  %{id: 1, nombre: "Laptop", precio: 1000, stock: 10},
  %{id: 2, nombre: "Teclado Mecánico", precio: 80, stock: 50},
  %{id: 3, nombre: "Ratón Inalámbrico", precio: 25, stock: 120},
  %{id: 4, nombre: "Monitor 24 pulgadas", precio: 200, stock: 5}
]

defmodule Tienda do
  def main(lista_productos, porcentaje_descuento) do
    # 1. Mapeamos la lista para calcular y actualizar los precios
    productos_con_descuento = Enum.map(lista_productos, fn producto ->
      descuento = producto.precio * (porcentaje_descuento / 100)
      nuevo_precio = producto.precio - descuento

      # Retornamos el mapa actualizado
      %{producto | precio: nuevo_precio}
    end)

    # 2. Iteramos sobre la NUEVA lista para imprimir los resultados
    IO.puts("--- Precios con #{porcentaje_descuento}% de descuento ---")
    Enum.each(productos_con_descuento, fn producto ->
      IO.puts("#{producto.nombre}: $#{producto.precio}")
    end)

  end
end

# Fuera del módulo, llamamos a la función pasándole tu variable 'productos' y un descuento (ej. 15%)
Tienda.main(productos, 15)
