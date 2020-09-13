module Errors
  # This class is responsible for handling invalid operation errors
  class InvalidOperation < YamdbError
    def initialize(message = 'invalid operation')
      super(error: :invalid_operation_error, status: 422, message: message)
    end
  end
end
