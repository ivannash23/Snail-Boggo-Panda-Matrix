class ReposController < ApplicationController

  def index
    @repos = Repo.all
  end

  def show
    @repos = Repo.find_by_id(params[:id])
  end

end