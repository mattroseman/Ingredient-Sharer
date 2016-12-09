class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def promote
    @user = User.find(params[:id])
    if !@user.is_admin
      @user.update_attribute :is_admin, true
    end
    @user.save!
    redirect_to :controller => 'users', :action => 'show'
  end

  def demote
    @user = User.find(params[:id])
    if @user.is_admin
      @user.update_attribute :is_admin, false
    end
    @user.save!
    redirect_to :controller => 'users', :action => 'show'
  end
end
