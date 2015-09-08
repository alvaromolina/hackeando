class LikesController < ApplicationController


  # POST /likes.json
  def like
    if user_signed_in?
        user = current_user
    else
        user = guest_user
    end
    @like = Like.new
    @like.complaint_id = params[:complaint_id]
    @like.user = user
    @like.email = user.email

    respond_to do |format|
      if @like.save
        format.html { redirect_to @like.complaint, notice: 'Se sumo exitosamente!' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:complaint_id, :user_id, :email)
    end
end
