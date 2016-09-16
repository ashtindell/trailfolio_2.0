class ExcursionsController < ApplicationController
  before_action :set_excursion, only: [:show, :edit, :update, :destroy]

  # GET /excursions
  # GET /excursions.json
  def index
    @excursions = Excursion.all
  end

  # GET /excursions/1
  # GET /excursions/1.json
  def show
  end

  # GET /excursions/new
  def new
    @excursion = Excursion.new
  end

  # GET /excursions/1/edit
  def edit
  end

  # POST /excursions
  # POST /excursions.json
  def create
    @excursion = Excursion.new(excursion_params)

    respond_to do |format|
      if @excursion.save
        format.html { redirect_to @excursion, notice: 'Excursion was successfully created.' }
        format.json { render :show, status: :created, location: @excursion }
      else
        format.html { render :new }
        format.json { render json: @excursion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excursions/1
  # PATCH/PUT /excursions/1.json
  def update
    respond_to do |format|
      if @excursion.update(excursion_params)
        format.html { redirect_to @excursion, notice: 'Excursion was successfully updated.' }
        format.json { render :show, status: :ok, location: @excursion }
      else
        format.html { render :edit }
        format.json { render json: @excursion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excursions/1
  # DELETE /excursions/1.json
  def destroy
    @excursion.destroy
    respond_to do |format|
      format.html { redirect_to excursions_url, notice: 'Excursion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excursion
      @excursion = Excursion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def excursion_params
      params.fetch(:excursion, {})
    end
end
