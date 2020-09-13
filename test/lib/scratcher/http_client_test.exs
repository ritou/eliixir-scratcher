defmodule Scratcher.HttpClientTest do
  use ExUnit.Case
  doctest Scratcher.HttpClient

  alias Scratcher.DummyHttpClient

  test "behaviour" do
    assert {:ok, %{status_code: 200, body: "dummy_resp", headers: [a: :b]}} ==
             DummyHttpClient.request(:get, "https://example.com/", nil, [], [])
  end
end
