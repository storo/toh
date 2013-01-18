class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = Authentication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/new
  # GET /authentications/new.json
  def new
    @authentication = Authentication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/1/edit
  def edit
    @authentication = Authentication.find(params[:id])
  end

  # POST /authentications
  # POST /authentications.json
  def create
    omniauth = request.env["omniauth.auth"]  
      authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])  
      if authentication  
        flash[:notice] = "Signed in successfully."  
        sign_in_and_redirect(:user, authentication.user)  
      elsif current_user  
        current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])  
        flash[:notice] = "Authentication successful."  
        #render :text => "current"
         redirect_to authentications_url  
      else  
        u = User.find_by_email(omniauth['info']['email'])
       
        
        if u 
          u.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])  
           u.update_attributes(:image_fb => omniauth['info']['image'], :name => omniauth['info']['name'], :hometown => omniauth['info']['location'] )
          flash[:notice] = "Authentication successful."  
          #render :text => "current"
           sign_in_and_redirect(:user, u) 
        else
            user = User.new  
            user.apply_omniauth(omniauth)
            user.image_fb = omniauth['info']['image']
            user.name = omniauth['info']['name']
            user.hometown = omniauth['info']['location']
            if user.save  
              flash[:notice] = "Signed in successfully."  
              sign_in_and_redirect(:user, user)  

            else  
              session[:omniauth] = omniauth.except('extra')  
              #render :text => "extra"
              redirect_to new_user_registration_url  
            end
        end
        
      end
      
  end

  # PUT /authentications/1
  # PUT /authentications/1.json
  def update
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      if @authentication.update_attributes(params[:authentication])
        format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])  
      @authentication.destroy  
      flash[:notice] = "Successfully destroyed authentication."  
      redirect_to authentications_url
  end
end
