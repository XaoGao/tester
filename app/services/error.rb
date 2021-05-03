class Error < Result
  def initialize(data, error)
    super(false, data, error)
  end
end
