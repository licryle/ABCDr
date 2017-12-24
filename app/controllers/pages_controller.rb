class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:collaborer, :manifeste, :association, :proprieteintellectuelle, :confidentialite, :contact]
end
