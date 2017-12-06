defmodule Billing do
  @moduledoc """
  Documentation for Billing.
  """
  alias Couchdb.Connector
  @doc """
  Hello world.

  ## Examples

      iex> Billing.hello
      :world

  """

  def hello do
    db_props = %{protocol: "http", hostname: "localhost", database: "couchdb_connector_dev", port: 5984}
    ##Couchdb.Connector.Storage.storage_up(db_props)
    ##Couchdb.Connector.Writer.create(db_props, "{\"phoneNo\": \"666\", \"balance\": \"333\"}", "123")
    ##updated = %{current | "phone" => "new value"}
    ##Couchdb.Connector.Writer.destroy(db_props, "666", )
    ##Couchdb.Connector.Writer.get(db_props, "foo")
    id = "123"
    {:ok, reloaded} = Connector.get(db_props, id)
    newBalance = String.to_integer(reloaded["balance"]) - 100
    value = Integer.to_string(newBalance)
    updated = %{reloaded | "balance" => value}
    Connector.update(db_props, updated)
    :hello
  end
end
