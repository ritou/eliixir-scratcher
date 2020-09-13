# Scratcher

Scratcher is a library for calling various HTTP Clients equivalently.

It respects the design of the ex_aws HTTP client module.
[ExAws.Request.HttpClient](https://github.com/ex-aws/ex_aws/blob/master/lib/ex_aws/request/http_client.ex)


You can call various HTTP Clients within your module by following the steps below.

1. Use a module that already implements `Scratcher.HttpClient` as Behavior, or implement a module that uses the HTTP Client that you want to use.
2. Specify the module in Config.
3. The module that wants to send HTTP request can use the HTTP Client module obtained from Config.

```elixir
  defmodule Your.HttpClient do
    @behaviour Scratcher.HttpClient
    def request(method, url, body, headers, http_opts) do

      # use hackney, httpoison, httpotion...

      {:ok, %{status_code: 200, body: "..."}}
    end
  end
```

```elixir
config :your_module, http_client: Your.HttpClient
```

```elixir
  defmodule YourModule do
    @http_client Application.fetch_env!(:your_module) |> Keyword.fetch!(:http_client)

    def request(method, url, body, headers, http_opts) do
      @http_client.request(method, url, body, headers, http_opts)
    end
  end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `scratcher` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:scratcher, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/scratcher](https://hexdocs.pm/scratcher).

