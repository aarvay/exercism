defmodule HelloWorld do
  def hello(name \\ nil) do
    case name do
      nil ->
        "Hello, World!"
      _ ->
        "Hello, #{name}!"
    end
  end
end
