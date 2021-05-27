class TopController < ApplicationController

  before_action :sign_in_required, only: [:show]
  before_action :set_q, only: [:index, :search]

  def index
  end

  def search
    @results = @q.result
  end



  private
    def set_q
      @q = Room.ransack(params[:q])
    end

end
