class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :feed, :exercise, :sleep, :evolve]
  before_action :authorize

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.where("user_id='#{session[:user_id]}'")

  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    if @pet.updated_at <= 5.minutes.ago && @pet.exercise == 1
      @pet.exercise = 0
      @pet.save
    end

    if @pet.updated_at <= 6.hours.ago && @pet.state != 0
      @pet.state = @pet.state - 1
      if @pet.exercise == 1
        @pet.exercise = 0
      end
      @pet.save
    end

    if @pet.updated_at <= 3.days.ago && @pet.state == 1
      @pet.alive = 0
      @pet.save
    end

    if @pet.created_at < 7.days.ago && @pet.alive == true
      @pet.evolve = true
      @pet.save
    end
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def exercise
    if @pet.state != 0
      @pet.state = @pet.state - 1
      @pet.exercise = 1
      @pet.sleep = 0
      @pet.save
    end
    redirect_to @pet
  end

  def feed
    if @pet.state != 3
      @pet.state = @pet.state + 1
      @pet.exercise = 0
      @pet.sleep = 0
      @pet.save
    end
    redirect_to @pet
  end

  def sleep
    if @pet.sleep == 1
      @pet.sleep = 0
    else
      @pet.sleep = 1
    end
    @pet.exercise = 0
    @pet.save
    redirect_to @pet
  end

  def evolve
    if @pet.state == 3 && @pet.evolve != true && @pet.updated_at < 10.minutes.ago
      @pet.evolve = true
      @pet.save
    end
    redirect_to @pet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :state, :date_of_death, :user_id)
    end

end
