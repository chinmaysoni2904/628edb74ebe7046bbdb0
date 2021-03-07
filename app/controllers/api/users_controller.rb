class Api::UsersController < ApplicationController
  before_action :page, only: [:index]
  before_action :set_user, only: [:show, :destroy,:update]
  def index
    @users = User.paginate(page: @page, per_page: @pagesize)
    render :json => {status: 200, data: @users.as_json}
  end

  def show
    render :json => {status: 200, data: @user.as_json}
  end

  def create
    @user = User.create(firstName: params[:firstName], lastName: params[:lastName], email: params[:email])
    return render :json => {message: "Something went wrong"} unless @user
    render :json => {status: 200, data: @user.as_json}
  end
  def update
    @user.update(firstName: params[:firstName], lastName: params[:lastName], email: params[:email])
    render :json => {status: 200, data: @user.as_json}
  end

  def destroy
    @user.destroy
    return render :json => {status: 200, data: {}}
  end

  def search
    @users = User.where("firstName LIKE :search OR lastName LIKE :search OR email LIKE :search", search: "%#{params[:input]}%")
    return render :json => {status: 200, data: @users.as_json}
  end


  def set_user
    @user = User.find_by_id(params[:id])
    return render :json => {status: 500,message: "User not found"} if @user.blank?
  end
  def page
    if params[:page].blank? || params[:page].to_i <= 0
      params[:page] = 1
    end
    @page = params[:page]
    @pagesize = 3
  end
end
