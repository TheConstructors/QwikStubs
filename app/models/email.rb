class Email
  include MongoMapper::EmbeddedDocument

  key :email, String
  key :password, String
  key :oath_key, String
  key :salt, String

  # Relationship
  belongs_to :user


end
