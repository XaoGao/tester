class Result
  attr_reader :data, :error

  def initialize(status, data, error = nil)
    @status = status
    @data = data
    @error = error
  end

  def valid?
    @status
  end

  def invalid?
    !valid?
  end
end
