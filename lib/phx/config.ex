defmodule Phx.Config do
  @moduledoc "Helps with the configuration of a Phoenix project."

  @port 4000
  # Registered ports are 1024 to 49151.
  @range 1024..49151

  @type port_number :: 1024..49151

  @doc "Returns a Phoenix port number."
  @spec port :: port_number
  def port, do: System.get_env("PORT") |> do_port()

  ## Private functions

  @spec do_port(term) :: port_number
  defp do_port(port) when is_binary(port) do
    case String.trim(port) |> Integer.parse() do
      {integer, ""} -> do_port(integer)
      _ -> @port
    end
  end

  defp do_port(port) when port in @range, do: port
  defp do_port(_port), do: @port
end
