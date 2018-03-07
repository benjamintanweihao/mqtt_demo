defmodule MqttDemoTest do
  use ExUnit.Case
  doctest MqttDemo

  test "greets the world" do
    assert MqttDemo.hello() == :world
  end
end
