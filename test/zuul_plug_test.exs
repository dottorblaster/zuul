defmodule Zuul.PlugTest do
  @moduledoc """
  Tests for `Zuul.Plug`.
  """

  use ExUnit.Case
  doctest Zuul.Plug

  test "connection is OK" do
    conn_to_test = get_fixture_ok()
    assert Zuul.Plug.call(conn_to_test, key_file: "./test/fixtures/api_keys.txt") === conn_to_test
  end

  test "connection is KO" do
    conn_to_test = get_fixture_not_ok()

    assert_raise Zuul.KeyError, fn ->
      Zuul.Plug.call(conn_to_test, key_file: "./test/fixtures/api_keys.txt")
    end
  end

  test "connection is without authorization header" do
    conn_to_test = get_fixture_without_key()

    assert_raise Zuul.MissingAuthorizedHeaderError, fn ->
      Zuul.Plug.call(conn_to_test, key_file: "./test/fixtures/api_keys.txt")
    end
  end

  def get_fixture_ok() do
    %Plug.Conn{
      assigns: %{},
      body_params: %{},
      cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      halted: false,
      host: "localhost",
      method: "GET",
      params: %{},
      path_info: [],
      path_params: %{},
      port: 4000,
      query_params: %{},
      query_string: "",
      remote_ip: {127, 0, 0, 1},
      req_cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      req_headers: [
        {"accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"},
        {"accept-encoding", "gzip, deflate"},
        {"accept-language", "en-US,en;q=0.5"},
        {"authorization", "correct-horse-battery-staples"},
        {"connection", "keep-alive"},
        {"cookie", "notice_preferences=2:; notice_gdpr_prefs=0,1,2:"},
        {"host", "localhost:4000"},
        {"upgrade-insecure-requests", "1"},
        {"user-agent",
         "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0"}
      ],
      request_path: "/",
      resp_body: nil,
      resp_cookies: %{},
      resp_headers: [
        {"cache-control", "max-age=0, private, must-revalidate"},
        {"x-request-id", "FaEAVcb80eDeCJkAAAjB"},
        {"x-frame-options", "SAMEORIGIN"},
        {"x-xss-protection", "1; mode=block"},
        {"x-content-type-options", "nosniff"},
        {"x-download-options", "noopen"},
        {"x-permitted-cross-domain-policies", "none"},
        {"cross-origin-window-policy", "deny"}
      ],
      scheme: :http,
      script_name: [],
      state: :unset,
      status: nil
    }
  end

  def get_fixture_not_ok() do
    %Plug.Conn{
      assigns: %{},
      body_params: %{},
      cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      halted: false,
      host: "localhost",
      method: "GET",
      params: %{},
      path_info: [],
      path_params: %{},
      port: 4000,
      query_params: %{},
      query_string: "",
      remote_ip: {127, 0, 0, 1},
      req_cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      req_headers: [
        {"accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"},
        {"accept-encoding", "gzip, deflate"},
        {"accept-language", "en-US,en;q=0.5"},
        {"authorization", "this-key-is-nah"},
        {"connection", "keep-alive"},
        {"cookie", "notice_preferences=2:; notice_gdpr_prefs=0,1,2:"},
        {"host", "localhost:4000"},
        {"upgrade-insecure-requests", "1"},
        {"user-agent",
         "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0"}
      ],
      request_path: "/",
      resp_body: nil,
      resp_cookies: %{},
      resp_headers: [
        {"cache-control", "max-age=0, private, must-revalidate"},
        {"x-request-id", "FaEAVcb80eDeCJkAAAjB"},
        {"x-frame-options", "SAMEORIGIN"},
        {"x-xss-protection", "1; mode=block"},
        {"x-content-type-options", "nosniff"},
        {"x-download-options", "noopen"},
        {"x-permitted-cross-domain-policies", "none"},
        {"cross-origin-window-policy", "deny"}
      ],
      scheme: :http,
      script_name: [],
      state: :unset,
      status: nil
    }
  end

  def get_fixture_without_key() do
    %Plug.Conn{
      assigns: %{},
      body_params: %{},
      cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      halted: false,
      host: "localhost",
      method: "GET",
      params: %{},
      path_info: [],
      path_params: %{},
      port: 4000,
      query_params: %{},
      query_string: "",
      remote_ip: {127, 0, 0, 1},
      req_cookies: %{"notice_gdpr_prefs" => "0", "notice_preferences" => "2:"},
      req_headers: [
        {"accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"},
        {"accept-encoding", "gzip, deflate"},
        {"accept-language", "en-US,en;q=0.5"},
        {"connection", "keep-alive"},
        {"cookie", "notice_preferences=2:; notice_gdpr_prefs=0,1,2:"},
        {"host", "localhost:4000"},
        {"upgrade-insecure-requests", "1"},
        {"user-agent",
         "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0"}
      ],
      request_path: "/",
      resp_body: nil,
      resp_cookies: %{},
      resp_headers: [
        {"cache-control", "max-age=0, private, must-revalidate"},
        {"x-request-id", "FaEAVcb80eDeCJkAAAjB"},
        {"x-frame-options", "SAMEORIGIN"},
        {"x-xss-protection", "1; mode=block"},
        {"x-content-type-options", "nosniff"},
        {"x-download-options", "noopen"},
        {"x-permitted-cross-domain-policies", "none"},
        {"cross-origin-window-policy", "deny"}
      ],
      scheme: :http,
      script_name: [],
      state: :unset,
      status: nil
    }
  end
end
