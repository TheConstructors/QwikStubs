class Email
  include ApplicationModel
  include MongoMapper::Document
  
  belongs_to :user
  
  key :email
  
  validates :email, :uniqueness => true # form
  
  ensure_index :email
end
