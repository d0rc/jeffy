defmodule Jeffy do
	def jiffy do
		:timer.tc fn -> Enum.each 1..1_000_000, fn _ -> :jiffy.encode(%{:hello => "world", a: [1,2,3]}) |> :jiffy.decode([:return_maps]) end end
	end
	def jazz do
		:timer.tc fn -> Enum.each 1..1_000_000, fn _ -> Jazz.encode!(%{:hello => "world", a: [1,2,3]}) |> Jazz.decode! end end
	end
	def poison do
		:timer.tc fn -> Enum.each 1..1_000_000, fn _ -> Poison.encode!(%{:hello => "world", a: [1,2,3]}) |> :erlang.iolist_to_binary |> Poison.decode! end end
	end
	def test do
		log = [Jeffy.jazz, Jeffy.jazz, Jeffy.jiffy, Jeffy.jiffy, Jeffy.poison, Jeffy.poison]
		IO.puts(inspect(log))
		[{tj1, _}, {tj2, _}, {tjf1, _}, {tjf2, _}, {tp1, _}, {tp2, _}] = log
		IO.puts "#{(tjf1 + tjf2) / (tj1 + tj2)}"
	end
end
