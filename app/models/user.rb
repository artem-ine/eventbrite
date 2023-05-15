class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  
  after_create :welcome_send 

  def welcome_send 
    UserMailer.welcome_email(self).deliver_now
  end 
end
