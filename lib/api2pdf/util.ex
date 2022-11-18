defmodule Api2pdf.Util do
  @moduledoc false

  # exclude nill values from Map or Struct
  # https://github.com/devinus/poison/issues/55#issuecomment-581916926
  @spec prune_nils(map) :: map
  def prune_nils(s) when is_struct(s), do: s |> Map.from_struct() |> Enum.reduce(%{}, &reducer/2)
  def prune_nils(m) when is_map(m), do: Enum.reduce(m, %{}, &reducer/2)

  @spec reducer({any, any}, map) :: map
  defp reducer({k, v}, map) when is_map(v), do: Map.put(map, k, prune_nils(v))
  defp reducer({_k, v}, map) when is_nil(v), do: map
  defp reducer({k, v}, map), do: Map.put(map, k, v)
end
