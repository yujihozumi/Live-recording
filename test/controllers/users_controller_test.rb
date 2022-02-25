require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def show
    @user = User.find_by(id: params[:id])
  end
end
