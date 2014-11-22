class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  ############################################################
  # before_filters                                           #
  ############################################################
  before_filter :require_is_admin_true


  ############################################################
  # require_                                                 #
  ############################################################
  def require_is_admin_true
    unless @is_admin == true
      redirect_to events_path
    end
  end

  ############################################################
  # list                                                     #
  ############################################################
  def list
    @users = User.all

    respond_to do |format|
      format.html # list.html.erb
     # format.csv { send_data @users.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.json { render json: @users }
      #format.csv { send_data @users.to_csv }
      #format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  ############################################################
  # show                                                     #
  ############################################################
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

end
