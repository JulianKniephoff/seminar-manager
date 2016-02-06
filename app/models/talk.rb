class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_name: 'User'

  has_and_belongs_to_many :topics

  validates :date,
            uniqueness: true

  def self.by_semester(year, term)
    # TODO Take time zones into account?
    # TODO Is this always true?
    term_start = Date.new(year, 4, 1) >> (term - 1) * 6
    where date: (term_start...(term_start >> 6))
  end

  def self.archived
    where 'date < ?', Date.today
  end
end
