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
      month = year_or_date.month
      term = (4...10).include?(month) ? SUMMER : WINTER
      # correct base-year in case of WINTER
      year = year_or_date.year - ((1...4).include?(month) ? 1 : 0)
    else
      year = year_or_date
    end

    self.year = year
    self.term = term
  end

  def <=>(other)
    [year, term] <=> [other.year, other.term]
  end

  def start
    # TODO Is this really always the start of the semester?
    Date.new(year, 4, 1) >> (term - 1) * 6
  end

  def spanning_years
    if term == WINTER
      [year, year + 1]
    else
      [year]
    end
  end

  def abbrev
    abbrevs = { SUMMER => "SS", WINTER => "WS" }
    "#{abbrevs[term]}#{spanning_years.map { |year| year % 100 }.join('/')}"
  end

  def to_s
    term_names = { SUMMER => 'Sommersemester', WINTER => 'Wintersemester' }
    "#{term_names[term]}\u00a0#{spanning_years.join('/')}"
  end
end
