defmodule GslicexTest do
  use ExUnit.Case

  test "gslice with empty list" do
    assert [] == Gslicex.gslice([])
  end


  test "gslice with 1 element list" do
    assert [0] == Gslicex.gslice([0])
  end


  test "gslice with 2 element list" do
    assert 0..1 == Gslicex.gslice(0..1)
  end

  test "gslice with 2 element list and index" do
    assert [0] == Gslicex.gslice(0..1, 0)
  end


  test "gslice with 4 element list and indexes" do
    assert [1, 3] == Gslicex.gslice(0..3, [1, 3])
  end


  test "gslice with 4 element list and start, count" do
    assert [1, 2] == Gslicex.gslice(0..3, 1, 2)
  end


  test "gslice with 6 element list and starts, counts" do
    assert [1, 2, 4, 5, 6] == Gslicex.gslice(0..6, [1, 4], [2, 3])
  end


end
