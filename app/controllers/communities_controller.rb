class CommunitiesController < ApplicationController

before_action :set_community, only: [:show, :destroy, :update]	

	def index
		@community = Community.order(created_at: :desc).limit(10)
	end

	def show

	end

	def new
		@community = Community.new
	end

	def create
		@community = Community.new(community_params)

		if @community.save
			redirect_to communities_path
			flash[:new_community] = "¡Has creado una nueva communidad satisfactoriamente!"
		else
      render :new
		end
	end

	def edit
		@community = Community.find(params[:id])
	end

	def update
		if @community.update_attributes(params[:community].permit(:name,:description))
			redirect_to communities_path
			flash[:community_updated] = "¡Has actualizado #{@community.name} correctamente!"
		else
			@errors = community.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@community.destroy
		if @community.save
			redirect_to communities_path
			flash[:community_deleted] = "¡Has eliminado #{@community.name}!"
		else
			render :index
		end
	end

	private

		def community_params
			params.require(:community).permit(:name,:description)
		end

		def set_community
			@community = Community.find(params[:id])
		end

end
