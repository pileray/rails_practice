class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"
  before_action :require_admin

  def require_admin
    unless current_user&.admin_flag?
      redirect_to root_path
    end
  end
end
