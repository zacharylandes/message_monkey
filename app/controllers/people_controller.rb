class PeopleController < ApplicationController

  def index 
    @people = Person.all.sort_by(&:created_at).reverse
  end

  def show 
    @person = Person.find(params["id"])
  end

  def create
    person = Person.new(people_params)
    if person.save!
      flash[:success] = "Person Successfully created"
      redirect_to messages_path
    else
      flash[:danger] = "Couldn't create that person, please try again"
      redirect_to messages_path(:modal)
    end
  end

  private

  def people_params
      params.require(:person).permit(:first_name, :last_name, :email, :phone, :visit_date)
  end

end