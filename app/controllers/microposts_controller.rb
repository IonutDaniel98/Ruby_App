class MicropostsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]

  def create
    #byebug
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    #byebug
    @micropost=Micropost.find(params[:id])
    if @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    else
      render 'static_pages/home'
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :title)
    end
end
