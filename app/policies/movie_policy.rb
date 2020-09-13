class MoviePolicy < ApplicationPolicy
  # This class defines the scope for the Movie class
  class Scope < Scope
    def resolve
      age = user.age
      if age < 5
        scope.upto(Movie::Rating.new(:G))
      elsif age.between?(5, 13)
        scope.upto(Movie::Rating.new(:PG))
      elsif age.between?(13, 18)
        scope.upto(Movie::Rating.new(:'PG-13'))
      elsif age > 18
        scope.upto(Movie::Rating.new(:R))
      end
    end
  end
end
