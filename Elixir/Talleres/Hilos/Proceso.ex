defmodule EjemploProcesos do
  @doc """
  Esta es la función que ejecutará cada proceso hijo.
  Recibe el PID (Process Identifier) del proceso padre para saber a quién responder.
  """
  def procesar_tarea(pid_padre, numero_tarea) do
    # Simulamos que la tarea toma un tiempo (entre 0.5 y 1.5 segundos)
    Process.sleep(:rand.uniform(1000) + 500)

    # Enviamos un mensaje de vuelta al proceso padre
    # Usamos una tupla para identificar el tipo de mensaje
    send(pid_padre, {:tarea_completada, numero_tarea, self()})
  end

  @doc """
  Función principal para iniciar la demostración.
  """
  def ejecutar(cantidad_tareas \\ 5) do
    IO.puts("Iniciando proceso principal con PID: #{inspect(self())}")

    # 1. Usamos mapeo de colecciones para generar los procesos hijos
    1..cantidad_tareas
    |> Enum.map(fn numero ->
      # 'spawn' crea un nuevo proceso ligero y ejecuta la función dada
      spawn(fn -> procesar_tarea(self(), numero) end)
    end)

    IO.puts("Se han lanzado #{cantidad_tareas} procesos. Esperando respuestas...\n")

    # 2. Llamamos a nuestra función recursiva para recibir los mensajes
    esperar_respuestas(cantidad_tareas)
  end

  # 3. Usamos pattern matching y recursión para procesar la bandeja de entrada

  # Caso base: cuando ya no quedan tareas por esperar
  defp esperar_respuestas(0) do
    IO.puts("\n¡Todas las tareas han sido procesadas con éxito!")
  end

  # Caso recursivo: esperamos la respuesta y llamamos a la función de nuevo restando 1
  defp esperar_respuestas(tareas_restantes) do
    receive do
      # Pattern matching para extraer los datos del mensaje recibido
      {:tarea_completada, numero_tarea, pid_hijo} ->
        IO.puts("✅ Tarea #{numero_tarea} completada por el proceso #{inspect(pid_hijo)}")

        # Llamada recursiva disminuyendo el contador
        esperar_respuestas(tareas_restantes - 1)
    after
      # Un timeout por si algún proceso falla o se queda colgado
      5000 ->
        IO.puts("⏳ Tiempo de espera agotado. Faltaron procesos por responder.")
    end
  end
end

EjemploProcesos.ejecutar()
