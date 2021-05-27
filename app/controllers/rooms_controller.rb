class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  
  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    @user = @room.user
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice:"部屋を登録しました" }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = Room.find(params[:id])
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to user_path(current_user), notice: "情報を更新しました" }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: "部屋を削除しました" }
      format.json { head :no_content }
    end
  end
  def search
    @results = @q.result
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = current_user.id
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :introduction, :charge, :address, :room_image, :user_id)
    end

    def set_q
      @q = Room.ransack(params[:q])
    end
end
