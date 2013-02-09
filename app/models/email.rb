class Email < ApplicationModel
  include ActiveModel::SecurePassword

  key :email, String
  key :password_digest, String

  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create

  # Relationship
  belongs_to :user
end
