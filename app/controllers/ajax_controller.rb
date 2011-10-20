class AjaxController < ApplicationController
  def create_user
    user = params[:user]
    result = user.inspect
    render :text => result
  end

end
