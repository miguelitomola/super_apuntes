class NotesController < ApplicationController

  before_action :set_community
  before_action :set_notes
  before_action :set_note, only: [:show, :destroy, :edit, :update]

	def index
		@notes = @notes.order(created_at: :desc).limit(10)
	end

	def show
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)

		@note.community_id.to_i

		if @note.save
			redirect_to notes_path
			flash[:new_note] = "¡Has creado una nueva nota satisfactoriamente!"
		else
         	render :new
		end
	end

	def edit
	end

	def  update  
	   if  @note.update_attributes(note_params)
	       redirect_to (@community? community_notes_path(@community): notes_path)
	       flash[:note_updated] = "¡Has actualizado #{@note.title} satisfactoriamente!"
	   else 
	   	   #¿Qué hace este else? 
	       @errors = note.errors.full_messages  
	       render ‘edit’  
	   end  
	end

	def destroy
		if @note.destroy
			redirect_to (@community? community_notes_path(@community): notes_path)
			flash[:note_updated] = "¡Has eliminado #{@note.title} satisfactoriamente!"
		else
			render :index
		end
	end

	private
		def note_params
			params.require(:note).permit(:title, :body, :community_id, :published)
		end

		def set_community
			if params[:community_id]
				@community = Community.find(params[:community_id])
			end	
		end

    def set_notes
	    if @community
		    @notes = Note.accesible_by(@community.id)
		  else
			  @notes = Note.published
		  end
    end

		def set_note
			@note = @notes.find(params[:id])
		end

end

=begin
			if
				@note.accesible_by(@note.community.id))
			else
				redirect_to notes_path
			end

=end


