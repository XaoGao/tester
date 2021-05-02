class Service
  def success(data)
    Result.new(true, data)
  end

  def error(data, error)
    Result.new(false, data, error)
  end
end
