class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :collaborer, :manifeste, :association, :proprieteintellectuelle, :confidentialite, :contact]

  def home
  end
end
