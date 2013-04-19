require 'bcrypt'

class User
  include ApplicationModel
  
  many :emails
  has_many :promoter_memberships
  
  key :full_name,       String
  key :salt,            String
  key :password_digest, String
  
  #validates :full_name, :presence => true, :format => /\w+\s+\w+/
  validates :salt, :presence => true
  validates :password_digest, :presence => true
  # validates :active_email, :presence => true  Commented out temporarily so we can create user then email -Colin

  def first_name
    @first_name ||= full_name.split.first
  end

  def last_name
    @last_name ||= full_name.split.last
  end

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
    self.password_digest = BCrypt::Engine.hash_secret(passw, self.salt)
  end
  
  # may need a better name, for now just check password correctness
  def is_auth?(passw)
    self.password_digest == BCrypt::Engine.hash_secret(passw, self.salt)
  end
end
