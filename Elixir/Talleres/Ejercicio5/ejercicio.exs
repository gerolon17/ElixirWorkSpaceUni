Code.require_file("../Ejercicio1/util.ex")

Usuarios = [
  %{id: 1, nombre: "ALEJA", edad: 28},
  %{id: 2, nombre: "A le ja ", edad: 32},
  %{id: 3, nombre: "Ale ", edad: 29},
  %{id: 4, nombre: "Juan chica 24", edad: 20}
  %{id: 4, nombre: "Juan chica 24", edad: 20}
]


defmodule ValidarEjercicio do
  def validar_acceso(nombre, edad, credenciales_validas, intentos_fallidos) do
    unless credenciales_validas do
      {:error, "Acceso denegado: #{nombre} no posee credenciales válidas"}
    else
      if intentos_fallidos >= 3 do
        {:error, "Acceso denegado: la cuenta de #{nombre} está bloqueada por #{intentos_fallidos} intentos fallidos"}
      else
        if edad < 18 do
          {:error, "Acceso restrictivo: #{nombre} es menor de edad"}
        else
          {:ok, "Acceso concedido: bienvenido/a, #{nombre}"}
        end
      end
    end
  end

  def main do
    nombre = Util.ingresar("Ingrese su nombre: ", :texto)
    edad = Util.ingresar("Ingrese su edad: ", :entero)
    credenciales = Util.ingresar("¿Posee credenciales válidas? (s/n): ", :texto) == "s"
    intentos_fallidos = Util.ingresar("Ingrese el número de intentos fallidos: ", :entero)

    case validar_acceso(nombre, edad, credenciales, intentos_fallidos) do
      {:ok, msg}    -> IO.puts("\n #{msg}")
      {:error, msg} -> IO.puts("\n #{msg}")
    end
  end

end
ValidarEjercicio.main()
