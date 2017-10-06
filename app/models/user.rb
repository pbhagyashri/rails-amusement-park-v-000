class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
  validates :happiness, presence: true
  validates :nausea, presence: true
  validates :height, presence: true
  validates :tickets, presence: true

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end

end
