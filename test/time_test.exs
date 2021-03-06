
defmodule TimeTest do
  use ExUnit.Case

  @time %Calendar.Time{hour: 10, min: 42, sec: 53, usec: 0}
  @time_with_usec %Calendar.Time{hour: 10, min: 42, sec: 53, usec: 12}
  @time_without_sec %Calendar.Time{hour: 10, min: 42, sec: 0, usec: 0}
  @tuple_time {10, 42, 53, 0}
  @tuple_time_with_usec {10, 42, 53, 12}
  @tuple_time_without_sec {10, 42, 0, 0}

  test "dump Time" do
    assert Calecto.Time.dump(@time) == {:ok, @tuple_time}
    assert Calecto.Time.dump(@time_without_sec) == {:ok, @tuple_time_without_sec}
  end

  test "load Time" do
    assert Calecto.Time.load(@tuple_time) == {:ok, @time}
    assert Calecto.Time.load(@tuple_time_with_usec) == {:ok, @time_with_usec}
  end

  test "cast Time" do
    assert Calecto.Time.cast(@time) == {:ok, @time}
  end
end
