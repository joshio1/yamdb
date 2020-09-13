# This class is responsible for handling for any YAMDB error
class YamdbError < Beekeeper::Error
  attr_reader :error, :status, :message

  def initialize(error: nil, status: nil, message: nil)
    @error = error || :unprocessable_entity
    @status = status || 422
    @message = message || 'Something went wrong'
  end
end
