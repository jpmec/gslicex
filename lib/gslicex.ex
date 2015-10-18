defmodule Gslicex do
    @moduledoc """
    Provides generalized slicing functions.
    """

    @doc ~S"""
    If a single argument is passed with no other arguments, then return it.


    ## Examples
        iex> Gslicex.gslice 'a'
        'a'

        iex> Gslicex.gslice 1
        1

        iex> Gslicex.gslice 1.0
        1.0

        iex> Gslicex.gslice []
        []

        iex> Gslicex.gslice [1, 2, 3]
        [1, 2, 3]

    """
    def gslice(arg) do
        arg
    end


    @doc ~S"""
    If an argument passed with an empty index list, then return empty list.


    ## Examples
        iex> Gslicex.gslice 1, []
        []

        iex> Gslicex.gslice [1, 2, 3], []
        []

    """
    def gslice(_enumerable, []) do
        []
    end


    @doc ~S"""
    Slice an enumerable by a tuple of indexes.
    Returns a list containing the elements at each index.


    ## Examples
        iex> GSlice.gslice [0, 1, 2, 4], {}
        []

        iex> GSlice.gslice [0, 1, 2, 4], {1, 4}
        [1, 4]

    """
    def gslice(enumerable, index_tuple) when is_tuple(index_tuple) do
        gslice(enumerable, Tuple.to_list(index_tuple))
    end


    @doc ~S"""
    Slice an enumerable by a list of indexes.
    Returns an enumerable containing the elements at each index.
    If the index is out of bounds, an empty enumerable is returned.


    ## Examples
        iex> GSlice.gslice [0, 1, 2, 4], [1, 3]
        [1, 3]

    """
    def gslice(enumerable, [index | tail]) do
        gslice(enumerable, index) ++ gslice(enumerable, tail)
    end


    @doc """
    Slice a tuple by the index.
    Returns a list containing a single element at the tuple index.
    If the index is out of bounds, an empty list is returned.


    ## Examples
        iex> GSlice.gslice {0, 1, 2, 3}, 1
        [1]

    """
    def gslice(tuple, index) when is_tuple(tuple) do
        gslice(Tuple.to_list(tuple), index)
    end


    @doc """
    Slice a enumerable by the index.
    Returns a enumerable containing a single element at the index.
    If the index is out of bounds, an empty enumerable is returned.


    ## Examples
        iex> GSlice.gslice [0, 1, 2, 3], 2
        [2]

    """
    def gslice(enumerable, index) when is_integer(index) do
        Enum.slice(enumerable, index, 1)
    end


    @doc """
    Slice a enumerable by the index.
    Returns a enumerable containing a single element at the index.
    If the index is out of bounds, an empty enumerable is returned.
    """
    def gslice(enumerable, index) do
        gslice(enumerable, Enum.to_list(index))
    end

    def gslice(_enumerable, [], []) do
        []
    end

    def gslice(enumerable, [start | start_tail], [count | count_tail]) do
        gslice(enumerable, start, count) ++ gslice(enumerable, start_tail, count_tail)
    end

    def gslice(_enumerable, [], _count) do
        []
    end

    def gslice(_enumerable, _start, []) do
        []
    end

    def gslice(enumerable, [start | tail], count) do
        gslice(enumerable, start, count) ++ gslice(enumerable, tail, count)
    end

    @doc ~S"""
    Slice a enumerable by a start position and a count.
    This behaves exactly like Enum.slice

        iex> Gslicex.gslice [0, 1, 2, 3, 4], 1, 2
        [1, 2]
    """
    def gslice(enumerable, start, count) do
        Enum.slice(enumerable, start, count)
    end

    def gslice([], _start, _count, _stride) do
        []
    end

    def gslice(_enumerable, _start, [], _count) do
        []
    end

    def gslice(enumerable, start, [count | count_tail], []) do
        gslice(enumerable, start, count) ++ gslice(enumerable, start, count_tail)
    end

    def gslice(enumerable, start, count, []) do
        gslice(enumerable, start, count)
    end

    def gslice(enumerable, start, [count | count_tail], [stride | stride_tail]) do
        {head, tail} = Enum.split(enumerable, start + count)
        gslice(head, start, count) ++ gslice(tail, stride, count_tail, stride_tail)
    end

    def gslice(enumerable, start, [count | count_tail], stride) do
        {head, tail} = Enum.split(enumerable, start + count)
        gslice(head, start, count) ++ gslice(tail, stride, count_tail)
    end

    def gslice(enumerable, start, count, stride) do
        {head, tail} = Enum.split(enumerable, start + count)
        gslice(head, start, count) ++ gslice(tail, stride, count, stride)
    end
end
