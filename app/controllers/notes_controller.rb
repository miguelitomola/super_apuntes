class NotesController < ApplicationController

  before_action :set_note, only: [:show, :destroy, :update]

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
			flash[:notice] = "¡Has creado una nueva nota satisfactoriamente!"
		else
         	render :new
		end
	end

	def  update  
	   if  @note.update_attributes(params[:note].permit(:title, :body))  
	       redirect_to note_path  
	   else 
	   	   #¿Qué hace este else? 
	       @errors  =  note.errors.full_messages  
	       render  ‘edit’  
	   end  
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	def edit
		@note = Note.find(params[:id])
	end

	private
		def note_params
			params.require(:note).permit(:title,:body)
		end

		def set_note
			@note=Note.find(params[:id])
		end

end
