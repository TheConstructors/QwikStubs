class Email
  include ApplicationModel
  
  belongs_to :user
  
  key :email
  
  validates :email, :uniqueness => true # form
  
  ensure_index :email
end
