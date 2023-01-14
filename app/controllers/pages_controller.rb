class PagesController < ApplicationController
  layout false
  def home
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @user = current_user

    end

    private
    def  set_q

      @q = Room.ransack(params[:q])
    end
end
