class Conversation < ActiveRecord::Base

  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  has_many :messages
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :involving, -> (user) do
    where("conversations.sender_id = ? OR conversations.recipient_id = ?", user.id, user.id)
  end

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def last_message
    messages.last
  end

  def new_messages?
    last_message.created_at.to_time > Time.now.to_date - 10
  end
end
