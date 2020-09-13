class Movie
  # This class is responsible for the rating related interactions
  class Rating
    include ActiveModel::Model

    # constants ...............................................................

    RATING_MAP = {
      NR: 0,
      G: 1,
      PG: 2,
      'PG-13': 3,
      R: 4
    }.freeze

    # accessors ...............................................................

    attr_reader :code

    # initializer .............................................................

    def initialize(code)
      @code = code
      @code = :NR if @code.blank?
    end

    # instance methods ........................................................

    def certification_level
      RATING_MAP[@code]
    end

    def display_name
      @code.to_s
    end

    # class methods ...........................................................

    def self.from(certification_level: nil, certification_code: nil)
      if certification_level.present?
        from_certification_level certification_level
      elsif certification_code.present?
        from_certification_code certification_code
      else
        Rating.new :NR
      end
    end

    def self.from_certification_level(level)
      Rating.new(RATING_MAP.invert[level])
    end

    def self.from_certification_code(code)
      Rating.new(code)
    end

    def self.max(ratings)
      Rating.from(certification_level: ratings&.map(&:certification_level)&.max)
    end
  end
end
