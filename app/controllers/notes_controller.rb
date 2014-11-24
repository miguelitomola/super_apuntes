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

		@note.community_id.to_i

		if @note.save
			redirect_to notes_path
			flash[:new_note] = "¡Has creado una nueva nota satisfactoriamente!"
		else
         	render :new
		end
	end

	def  update  
	   if  @note.update_attributes(params[:note].permit(:community_id, :title, :body))  
	       redirect_to notes_path
	       flash[:note_updated] = "¡Has actualizado #{@note.title} satisfactoriamente!"
	   else 
	   	   #¿Qué hace este else? 
	       @errors = note.errors.full_messages  
	       render ‘edit’  
	   end  
	end

	def destroy
		@note.destroy
		if @note.save
			redirect_to notes_path
			flash[:note_updated] = "¡Has eliminad #{@note.title} satisfactoriamente!"
		else
			render :index
		end
	end

	def edit
		@note = Note.find(params[:id])
	end

	private
		def note_params
			params.require(:note).permit(:community_id, :title,:body)
		end

		def set_note
			@note=Note.find(params[:id])
		end

end
