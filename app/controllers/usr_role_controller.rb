class UsrRoleController < ApplicationController

  def index

  end

  def create
    @additionalUser = UsrAdditionalUser.new(post_params)
    if @additionalUser.save
      UsrMailer.usr_additional_signup(@additionalUser).deliver
    end
  end

  private
  def post_params
    params.require(:post).permit(:email,:role)
  end
end
