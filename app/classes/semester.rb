class Semester
  include Comparable

  # Term identifiers
  SUMMER = 1
  WINTER = 2

  attr_accessor :year
  attr_accessor :term

  def initialize(year_or_date, term = SUMMER)
    # TODO Also make this work with `Time` and other types?
    if year_or_date.kind_of?(Date)
      year = year_or_date.year
      term = (4...10).include?(year_or_date.month) ? SUMMER : WINTER
    else
      year = year_or_date
    end

    self.year = year
    self.term = term
  end

  def <=>(other)
    [year, term] <=> [other.year, other.term]
  end

  def to_s
    "#{['Sommer', 'Winter'][term - 1]}semester #{year}#{"/#{year + 1}" if term == 2}"
  end
end
