class AdminController < ApplicationController
    
  def index
    @doctors = User.where(role: 'doctor')
    @patients = User.where(role: 'patient')
  end

  def new 
    @user = User.new
  end

  def create
    debugger
    @doctor = User.new(user_params)
    respond_to do |format|
      if @doctor.save!
        redirect_to  admin_index_path
        format.html {redirect_to  admin_index_path , notice: "doctor was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end

end
