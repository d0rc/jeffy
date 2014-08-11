defmodule Jeffy.Mixfile do
  use Mix.Project

  def project do
    [app: :jeffy,
     version: "0.0.1",
     deps: deps]
  end

  def application do
    [applications: [:jiffy, :jazz, :poison]]
  end

  defp deps do
    [
      {:jiffy, github: "davisp/jiffy"},
      {:jazz, github: "meh/jazz"},
      {:poison, github: "devinus/poison"}
    ]
  end
end
