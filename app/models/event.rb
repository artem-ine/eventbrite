class Event < ApplicationRecord
  validates :start_date, presence: true 
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  
  validate :duration_multiple_of_5


  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  belongs_to :user


  private

  def duration_multiple_of_5
    if duration.present? && duration <= 0
      errors.add(:duration, "must be strictly positive")
    elsif duration.present? && duration % 5 != 0
      errors.add(:duration, "must be a multiple of 5")
    end
  end

end
