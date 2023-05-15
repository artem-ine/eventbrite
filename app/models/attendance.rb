class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id }

  after_create :welcome_event 

  def welcome_event
    UserMailer.welcome_event(self).deliver_now
  end 
end
