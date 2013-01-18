class UsersController < ApplicationController
	# only for non logged in users
	before_filter :anonymous_only, :only => :new

	before_filter :authenticate, :only => [:logout, :update, :edit]

	# shows login form if not logged in, stats if is
	def show
		if session[:user_id]
			@user = @current_user
		else
			# not logged in, get them logged in
			render :action => "login"
		end
	end

	# edit form for #update
	def edit
		@user = @current_user
	end

	# PUT, update data
	def update
		if @current_user.update_attributes(params[:user])
			redirect_to( user_path, :notice => "Your information was sucessfully updated." )
		else
			@user = @current_user
			render :action => "edit"
		end
	end

	# POST, create data
	def create
		@user = User.create(params[:user])
		
		respond_to do |format|
			if @user.save
				login_user
				format.html { redirect_to(user_path, :notice => 'You\'ve sucessfully signed up!' ) }
			else
				format.html { render :action => "new" }
			end 
		end
	end
	
	# POST, log user in
	def login
		login_user
	end
	
	def logout
		logger.info "Delete user cache: #{session[:user_id]}"
		# Rails.cache.delete('user-' + session[:user_id].to_s )
		session[:user_id] = nil
		@user = nil
		redirect_to( root_url, :notice => "Sucessfully Logged Out." )
	end
	
	# user signup form
	def new
		@user = User.new
	end
	
	def destroy
		# TODO?
	end

	protected

	def anonymous_only
		if !@current_user.nil?
			redirect_to( user_path, :notice => "You are already signed up.")
		end
	end

	private

	def login_user
		@user = User.login(params)
	
		unless @user.nil?
			reset_session
			session[:user_id] = @user.id
			logger.info "Cache user: #{@user.id}"
			logger.debug "User class: #{@user.class()}"
			# Rails.cache.write("user-#{@user.id}", @user)
			redirect_to(  user_path, :notice => "Welcome person!")
		else
			flash.now.alert = "Invalid email or password"
			render "login"
		end
	end

	def logout_user
		# TODO?
	end
end

