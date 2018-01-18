class User < ApplicationRecord

  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest

  scope :active_user, -> {where(:active=>true)}
	scope :inactive_user, -> {where(:active=>false)}
	
  def capitalize_name
  	self.name.upcase
  end
end
