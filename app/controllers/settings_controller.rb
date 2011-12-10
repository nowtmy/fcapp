class SettingsController < ApplicationController
  before_filter :require_user
  def index
     load_common_variables
  end

  def update_acc

  end

end
