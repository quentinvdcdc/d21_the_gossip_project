class GossipsController < ApplicationController
	def index
	end
  def show
  	@gossip = Gossip.find(params[:id])
  	@author = @gossip.user
  	@first_name = @author.first_name
    #@comments = Comment.where(gossip_id: params[:id]).class
  end
  def new
  	@gossip = Gossip.new
  end
  def create
  	@user = User.find_by(first_name: "Anonymous")
  	@gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user' => @user)
  	if @gossip.save # essaie de sauvegarder en base @gossip
  	  # si ça marche, il redirige vers la page d'index du site
  	  flash[:success] = "Well Done, Old Chap!" #hash depuis l'application.html.erb
  	  redirect_to root_path
  	else
  	  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	  flash[:danger] = "Oh oh oh ! #motus" #idem
  	  render 'new'
  	end
  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update('title' => params[:title], 'content' => params[:content], 'user' => @gossip.user)
      flash[:success] = "Modification saved !"
      redirect_to root_path
    else
      flash[:danger] = "Non modification pas sauvegardée !"
      render :edit
    end
  end
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
end
