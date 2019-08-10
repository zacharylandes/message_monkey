class PeopleController < ApplicationController
  def show 
    @person = Person.where(params[:id]).first
  end
end