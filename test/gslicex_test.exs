defmodule GslicexTest do
  use ExUnit.Case, async: true
  doctest Gslicex

  test "gslice with empty list" do
    assert [] == Gslicex.gslice([])
  end

  test "gslice with empty tuple" do
    assert {} == Gslicex.gslice({})
  end

  test "gslice with 1 element list" do
    assert [0] == Gslicex.gslice([0])
  end

  test "gslice with 1 element tuple" do
    assert {0} == Gslicex.gslice({0})
  end

  test "gslice with 2 element list" do
    assert [0, 1] == Gslicex.gslice([0, 1])
  end

  test "gslice with 2 element tuple" do
    assert {0, 1} == Gslicex.gslice({0, 1})
  end

  test "gslice with 2 element range" do
    assert 0..1 == Gslicex.gslice(0..1)
  end

  test "gslice with 2 element range and index" do
    assert [0] == Gslicex.gslice(0..1, 0)
  end

  test "gslice with 2 element list and index" do
    assert [0] == Gslicex.gslice([0, 1], 0)
  end

  test "gslice with 2 element tuple and index" do
    assert [0] == Gslicex.gslice({0, 1}, 0)
  end

  test "gslice with 2 element range and index that is out of bounds" do
    assert [] == Gslicex.gslice(0..1, 42)
  end

  test "gslice with 4 element range and indexes list" do
    assert [1, 3] == Gslicex.gslice(0..3, [1, 3])
  end

  test "gslice with 4 element range and indexes tuple" do
    assert [1, 3] == Gslicex.gslice(0..3, {1, 3})
  end

  test "gslice with 4 element range and indexes range" do
    assert [1, 2, 3] == Gslicex.gslice(0..3, 1..3)
  end

  test "gslice with 6 element list and indexes" do
    assert [1, 3, 5] == Gslicex.gslice(0..5, [1, 3, 5])
  end

  test "gslice with 4 element list and start, count" do
     assert [1, 2] == Gslicex.gslice(0..3, 1, 2)
  end

  test "gslice with 6 element list and starts, counts" do
    assert [1, 2, 4, 5, 6] == Gslicex.gslice(0..6, [1, 4], [2, 3])
  end

  test "gslice with 6 element list and start, count, stride " do
    assert [1, 2, 4, 5] == Gslicex.gslice(0..6, 1, 2, 1)
  end

  test "gslice with 8 element list and start, counts, strides " do
    assert [1, 4, 5] == Gslicex.gslice(0..8, 1, [1, 2], [2])
  end

end
