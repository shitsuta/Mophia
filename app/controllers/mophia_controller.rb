class MophiaController < ApplicationController

	before_action :move_to_index, except: :index
	def index
      @posts = Post.includes(:user).page(params[:page]).per(5).order("created_at DESC")
	end

	def new

	end

	def create
		Post.create(title: mophia_params[:title], text: mophia_params[:text], movie_link: mophia_params[:movie_link], user_id: current_user.id)
	end

	def destroy
	 	post = Post.find(params[:id])
	 	if post.user_id == current_user.id
	 		post.destroy
	 	end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		# binding.pry
		post = Post.find(params[:id])
		if post.user_id == current_user.id
			post.update(mophia_params)
		end
	end

	def page
		# binding.pry
		@post = Post.find(params[:id])
		gon.link = @post.movie_link
		@answers = Answer.where(post_id: @post.id)
		# binding.pry
	end

	def answerCreate
		# binding.pry
		Answer.create(user_id: current_user.id, answer: params[:answer], post_id: params[:post_id])
		# :move_to_page
		redirect_to :back
	end

	private
	def mophia_params
		params.permit(:title, :text, :movie_link)
	end

	def move_to_index
		redirect_to action: :index unless user_signed_in?
	end

end
