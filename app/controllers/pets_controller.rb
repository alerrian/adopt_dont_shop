class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.create(pet_params)

    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  def edit
    @pet_id = params[:pet_id]
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(
      :image,
      :name,
      :description,
      :age,
      :sex,
      :status,
      :shelter_id
    )
  end
end
