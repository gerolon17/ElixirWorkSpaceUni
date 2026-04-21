Code.require_file("../Ejercicio1/util.ex")

defmodule EntradaDatos do
    def main do
        "Ingrese el nombre del empleado"
        |> Util.ingresar(:texto)
        |> generar_mensaje()
        |> Util.mostrar_mensaje()
    end

    defp generar_mensaje(nombre) do
"Bienvenidos #{nombre} a la empresa Once Ltda"
end
end

EntradaDatos.main()
