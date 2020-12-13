module SerializableResource
  def serializer!(data, option)
    ActiveModelSerializers::SerializableResource.new(data, each_serializer: option).as_json
  end
end
