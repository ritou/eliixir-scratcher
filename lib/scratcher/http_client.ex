defmodule Scratcher.HttpClient do
  @moduledoc """
  Module used as Behavior of HTTP Client.

  It respects the design of the ex_aws HTTP client module.
  [ExAws.Request.HttpClient](https://github.com/ex-aws/ex_aws/blob/master/lib/ex_aws/request/http_client.ex)


  """

  @type http_method :: :get | :post | :put | :delete
  @callback request(
              method :: http_method,
              url :: binary,
              req_body :: binary,
              headers :: [{binary, binary}, ...],
              http_opts :: term
            ) ::
              {:ok, %{status_code: pos_integer, body: binary, headers: list}}
              | {:error, %{reason: any}}
end
