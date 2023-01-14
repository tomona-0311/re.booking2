class RoomsController < ApplicationController
  before_action :set_q, only: [:home, :serch]

  before_action :authenticate_user!

    def index
      @rooms = Room.all
      @user = current_user
    end

    def  post
      @rooms = Room.all
    end

    def new
      @user = current_user
      @room = Room.new
    end

    def create
      @user = current_user
      @room = Room.create!(room_params)
      p 'ブレークポイントによって止まりました１'
      if @room.save
        p 'ブレークポイントによって止まりました2'
        redirect_to @room #＠roomとすることでDBから取得したデータを指定すると、そのコントローラーのshowアクションに該当するページに遷移する。「redirect_to パラメータ」
     else
       render "new"
     end
   end
   def serch
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @user = current_user


  end
  def home

    @room = @q.result
    @user = current_user

  end
    def show

      @user = current_user
      @reservation = Reservation.new
      @room = Room.find(params[:id])

    end




    private
    def  set_q

      @q = Room.ransack(params[:q])
    end

    def room_params
      params.require(:room).permit(:room_name, :introduction,:price,:address,:image)
    end
  end

