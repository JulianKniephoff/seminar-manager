class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_name: 'User'

  has_and_belongs_to_many :topics

  validates :date,
            uniqueness: true

  def self.by_semester(semester)
    # TODO Take time zones into account?
    # TODO Is this always true?
    term_start = Date.new(semester.year, 4, 1) >> (semester.term - 1) * 6
    where date: (term_start...(term_start >> 6))
  end

  def self.archived
    where 'date < ?', Date.today
  end

  def semester
    Semester.new(date)
  end
end
