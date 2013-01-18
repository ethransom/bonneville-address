class User < ActiveRecord::Base
	validates :username, :uniqueness => true, :presence => true
	
	validates :password, :presence => true, :length => { :minimum => 5, :maximum => 50 }, :confirmation => true
	attr_accessor :password_confirmation
	validates :password_confirmation, :presence =>true, :length => { :minimum => 5, :maximum => 50 }
	
	validates :email, :presence => true, :length => { :minimum =>5 }

	def admin?
		!self.admin.nil? && self.admin == "yes"
	end
	
	def self.login(credentials)
		user = find_by_username(credentials[:username])

		if( user && user.password == credentials[:password] )
			user
		else
			nil
		end
	end
end
