class NotesController < ApplicationController
  before_filter :set_note, only: [:show, :edit, :update]

  # GET /notes
  # GET /notes.json
  def index
    expires_in 1.minute, public: true
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    fresh_when @note, public: true
    expires_in 1.minute, public: true
  end

  # GET /notes/new
  def new
    expires_in 5.minutes, public: true
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    fresh_when @note, public: true
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:username, :message)
    end
end
