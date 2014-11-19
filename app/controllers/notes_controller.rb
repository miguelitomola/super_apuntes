class NotesController < ApplicationController

  before_action :set_note, only: [:show, :delete]

	def index
		@notes=Note.order(created_at: :desc).limit(10)
	end

	def show
		
	end

	def new
		@note=Note.new
	end

	def create
		@note=Note.new(note_params)

		if @note.save
			redirect_to notes_path
		else
         	render :new
		end
	end

	def delete
		@note.destroy
	end


	private
		def note_params
			params.require(:note).permit(:title,:body)
		end

		def set_note
			@note=Note.find(params[:id])
		end

end
