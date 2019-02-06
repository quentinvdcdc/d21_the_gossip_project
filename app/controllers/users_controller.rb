class UsersController < ApplicationController
  def welcome
  	@user = User.find_by(first_name: params[:first_name])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
  def show #ex-profile
  	@user = User.find(params[:id])
  	#puts "Ceci est mon premier user : #{@user}"
  	#puts params
  end
end
