class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @commentable, notice: 'Comment created successfully.'
      else
        # Handle validation errors or any other error handling here
      end
    end
  
    private
  
    def find_commentable
      # Implement logic to find the commentable object based on params
      # For example, if your routes are nested, you can find it this way:
      if params[:social_id]
        Social.find(params[:social_id])
      elsif params[:post_id]
        Post.find(params[:post_id])
      # Add more conditions for other commentable models if needed
      else
        # Handle the case where no commentable object is found
      end
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  