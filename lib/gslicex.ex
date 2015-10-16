defmodule Gslicex do

    def gslice([]) do
        []
    end

    def gslice(list) do
        list
    end

    def gslice(_, []) do
        []
    end

    def gslice(list, [index | tail]) do
        gslice(list, index) ++ gslice(list, tail)
    end

    def gslice(list, index) do
        Enum.slice(list, index, 1)
    end

    def gslice(_, [], []) do
        []
    end

    def gslice(list, [start | start_tail], [count | count_tail]) do
        gslice(list, start, count) ++ gslice(list, start_tail, count_tail)
    end

    def gslice(_, [], _) do
        []
    end

    def gslice(list, [start | tail], count) do
        gslice(list, start, count) ++ gslice(list, tail, count)
    end

    def gslice(list, start, count) do
        Enum.slice(list, start, count)
    end

end
