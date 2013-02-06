require 'bcrypt'

class User
  include MongoMapper::Document
  
  # key :first_name,   String
  # key :last_name,    String
  # Reconmended change from Andrew: full_name
  key :full_name,    String
  key :active_email, String
  key :all_emails,   Array
  key :salt,         String
  key :hashed_pw,    String

	# Validate with "/\w\s\w/
  validates :full_name, :presence => true
  validates :salt, :presence => true
  validates :hashed_pw, :presence => true
  validates :active_email, :presence => true
  
  def first_name
	  @first_name ||= full_name.split.first
	end
	
	def last_name
		@last_name ||= full_name.split.last
	end
  # It is most likely better to just embed emails as an Array inside
  # of User, as each email is simply one field: an email, and all other
  # information is common to a single user.
  
  # Relationships
  #has_many :emails
  
  # An accessor for password, when you do `user.passsword = "a_new_pass"
  # this method is invoked, causing the object to generate a new salt,
  # and store the hashed contents of the password, as well as the new
  # salt.
  
  # A note on Password Storage 
  
  # There are a few ways to store passwords, hashing is *by far* the
  # safest way. You choose a hash function because they are one way, meaning
  # that the function reduces the amount of information, so that it is really
  # easy to go one way, and hard to go the other. Aka pass => hash is easy, and 
  # hash => pass is hard. This means there is no way to recover the password from
  # the hash because all we store is the result of hash(salt + pass). This is unlike
  # plaintext passwords where we do simple comparsion to confirm, or encrypted 
  # passwords where we encrypt and decrypt, but is not safe because given the 
  # encryption key, all plain text passwords are obtainable.
  def password=(passw)
	  new_salt = BCrypt::Engine.generate_salt
	  self.salt = new_salt
	  self.hashed_pw = BCrypt::Engine.hash_secret(passw, new_salt)
	end
end
