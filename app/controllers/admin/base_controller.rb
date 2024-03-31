class Admin::BaseController < ApplicationController
  layout "admin/layouts/application"
  before_action :require_admin

  def require_admin
    redirect_to root_path unless current_user&.admin_flag?
  end
end
