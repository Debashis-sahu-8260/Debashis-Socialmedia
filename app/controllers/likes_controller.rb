class LikesController < ApplicationController
  before_action :authenticate_user!



  def create
    @like = find_like

    if @like.nil?
      redirect_to @social_path, alert: 'Invalid likeable object.'
      return
    end

    @like = @like.likes.build(user: current_user)

    if @like.save
      redirect_to @like, notice: 'Liked!'
    else
      redirect_to @like, alert: 'Unable to like.'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @likeable = @like.like

    if @like.destroy
      redirect_to @like, notice: 'Unliked!'
    else
      redirect_to @like, alert: 'Unable to unlike.'
    end
  end

  private

  def find_like
    # Implement logic to find the likeable object based on params
    # For example, if your routes are nested, you can find it this way:
    if params[:social_id]
      Social.find(params[:social_id])
    elsif params[:post_id]
      Post.find(params[:post_id])
    # Add more conditions for other likeable models if needed
    else
      # Handle the case where no likeable object is found
    end
  end
end
