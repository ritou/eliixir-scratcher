defmodule Scratcher.DummyHttpClient do
  @behaviour Scratcher.HttpClient

  def request(_method, _url, _req_body, _headers, _http_opts) do
    {:ok, %{status_code: 200, body: "dummy_resp", headers: [a: :b]}}
  end
end
