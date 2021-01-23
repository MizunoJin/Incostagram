class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.paginate(page: params[:page]).includes([:visitor, :visited, :micropost])
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
