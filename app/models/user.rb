class User < ApplicationRecord
	validates(:name, presence: true, length: { maximum: 50, minimum: 4})
	VALID_EMAIL_REGEX = /\A\w+\.\w+@rmit\.edu\.au\z/i
	validates:email, presence: true, length: { maximum: 255, minimum: 4}, 
					format: { with: VALID_EMAIL_REGEX},
					uniqueness: { case_sensitive: false}
	has_secure_password
	VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/
	validates :password, presence: true, length: {minimum: 8},
					format: {with: VALID_PASSWORD_REGEX}

	# Returns the hash digest of the given string.
  	def User.digest(string)
    		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end
end
