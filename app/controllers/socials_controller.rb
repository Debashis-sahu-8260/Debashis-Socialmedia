class SocialsController < ApplicationController
        before_action :authenticate_user!, except: [:show, :edit, :update, :destroy]
      
        def index
          @socials = Social.all
    
        end
      
        def show 
          # Use 'find' method on the model class
          @social = Social.find(params[:id])
        end
      
        def new
          @social = current_user.socials.build
        end
      
        def create
            puts params.inspect
            @social = current_user.socials.build(social_params)
            if params[:user] && params[:user][:gender]
              @social = current_user
              @social.user.gender = params[:user][:gender]
            end
            if @social.save
                flash[:success] = 'Social post was successfully created.'
                redirect_to socials_path
            else
                flash.now[:error] = 'There was an error creating the social post.'
                render :new
                # redirect_to blogings_path, alert: 'Failed to create task!'
            end
        end
      
        def update
          if @social.update(social_params)
            redirect_to social_path(@social)
          else
            render :edit
          end
        end
          
        def destroy
          @social = current_user.socials.find(params[:id])
          @social.destroy # Corrected 'destory' to 'destroy'
          redirect_to socials_path, notice: 'Social post successfully deleted'
        end
      
        private
      
        def set_social
          @social = current_user.socials.find(params[:id]) # Corrected method name
        end
      
        def social_params
          params.require(:social).permit(:title, :content, :image, :avatar, user_attributes: [:gender]) # Corrected 'params_required' to 'require'
        end
 end
      
    
