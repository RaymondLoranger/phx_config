defmodule Phx.ConfigTest do
  use ExUnit.Case

  alias Phx.Config

  doctest Config

  describe "Config.port/0" do
    test "returns a valid port number" do
      # E.g. on Windows => set port=4041
      set_port = System.get_env("PORT") |> String.to_integer()
      assert Config.port() == set_port || 4000
    end
  end
end
