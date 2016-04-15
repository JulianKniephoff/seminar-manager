class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_name: 'User'

  has_and_belongs_to_many :topics

  has_many :materials
  accepts_nested_attributes_for :materials

  validates :date,
            presence: true,
            uniqueness: true

  # TODO Take time zones into account?
  def self.by_semester(semester)
    where date: (semester.start...(semester.start >> 6))
  end

  def self.before_semester(semester)
    where 'date < ?', semester.start
  end

  def semester
    Semester.new(date)
  end

  def in_semester?(semester)
    self.semester == semester
  end

  def before_semester?(semester)
    self.semester < semester
  end
end
