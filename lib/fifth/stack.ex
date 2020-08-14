defmodule Fifth.Stack do
    use GenServer

    # Callbacks

    @impl true
    def init(stack) do
        {:ok, stack}
    end

    @impl true
    def handle_call(:pop, _from, [head | tail]) do
        {:reply, head, tail}
    end

    @impl true
    def handle_call({:push, element}, _from , state) do
        stack = [element | state]
        depth = length(stack)
        {:reply, depth, [element | state]}
    end
end