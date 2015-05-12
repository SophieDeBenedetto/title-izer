class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, foreign_key: :sender_id

  after_create :add_avatar

  def add_avatar
    self.avatar = Faker::Avatar.image("my-own-slug", "100x100", "jpg")
    self.save
  end
  
end
