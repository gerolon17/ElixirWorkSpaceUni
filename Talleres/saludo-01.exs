#IO.puts("Bienvenidos a la empresa Once ltda")

@moduledoc """
"Bienvenidos a la empresa Once ltda"
|>IO.puts()
"""

defmodule Mensaje do
    def main do
        "Bienvenidos a la empresa Once ltda"
        |>IO.puts()
    end

    defp mostrar_mensaje(mensaje) do
        mensaje
        |>IO.puts()
    end
end

Mensaje.main()
