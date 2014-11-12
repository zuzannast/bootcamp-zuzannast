class AccountsController < ApplicationController
  def new 
    @account = Account.new
    @account.build_person
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to root_path, notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  end

  private
    def account_params
      params.require(:account).permit(:email, :password, :password_confirmation, person_attributes: [ :first_name, :last_name, ]) 
    end
end