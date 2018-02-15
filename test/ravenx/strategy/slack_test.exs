defmodule Ravenx.Strategy.SlackTest do
  use ExUnit.Case, async: true

  import Mock

  alias Ravenx.Strategy.Slack

  setup_all do
    %{
      payload: %{text: "Test Message"},
      opts: %{
        username: "Ravenx",
        icon_emoji: ":squirrel:",
        channel: "general",
        url: "https://slack.com"
      }
    }
  end

  describe "Ravenx.Strategy.Slack" do
    test "works as expected", %{payload: payload, opts: opts} do
      # Mock valid response
      with_mock HTTPoison,
        post: fn _url, _, _ -> {:ok, %HTTPoison.Response{body: "Received!", status_code: 200}} end do
        assert {:ok, "Received!"} == Slack.call(payload, opts)
      end
    end

    test "recognises http errors", %{payload: payload, opts: opts} do
      # Mock error response
      with_mock HTTPoison,
        post: fn _url, _, _ -> {:ok, %HTTPoison.Response{body: "Error!", status_code: 500}} end do
        assert {:error, {:error_response, "Error!"}} == Slack.call(payload, opts)
      end
    end

    test "recognises general errors", %{payload: payload, opts: opts} do
      with_mock HTTPoison, post: fn _url, _, _ -> {:error, %HTTPoison.Error{reason: :timeout}} end do
        assert {:error, {:error, :timeout}} == Slack.call(payload, opts)
      end
    end

    test "send options and text passed", %{payload: payload, opts: opts} do
      # Mock valid response returning original payload
      with_mock HTTPoison,
        post: fn _url, payload, _ ->
          {:ok, %HTTPoison.Response{body: payload, status_code: 200}}
        end do
        {result, payload} = Slack.call(payload, opts)

        assert result == :ok
        assert payload =~ "\"username\":\"Ravenx\""
        assert payload =~ "\"icon_emoji\":\":squirrel:\""
        assert payload =~ "\"channel\":\"general\""
        assert payload =~ "\"text\":\"Test Message\""
      end
    end

    test "should require url configuration", %{payload: payload, opts: opts} do
      invalid_opts = Map.delete(opts, :url)
      assert {:error, {:missing_config, :url}} == Slack.call(payload, invalid_opts)
    end
  end
end
