class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_name: 'User'

  has_and_belongs_to_many :topics

  validates :date,
            presence: true,
            uniqueness: true

  # TODO Take time zones into account?
  def self.by_semester(semester)
    where date: (semester.start...(semester.start >> 6))
  end

  def self.archived
    where 'date < ?', Date.today
  end

  def semester
    Semester.new(date)
  end
end
