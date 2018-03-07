defmodule MqttDemo do
  def make_client(client_id) do
    {:ok, pid} = Client.start_link(%{})
    options = [client_id: client_id, host: "localhost", port: 1883, ssl: false]
    :ok = Client.connect(pid, options)
    pid
  end

  def publish(pid, topic, message) do
    options = [topic: topic, message: message, dup: 0, qos: 1, retain: 1]
    Client.publish(pid, options)
  end

  def subscribe(pid, topics, qoses)
      when is_list(topics) and is_list(qoses) and length(topics) == length(qoses) do
    options = [topics: topics, qoses: qoses]
    Client.subscribe(pid, options)
  end
end
