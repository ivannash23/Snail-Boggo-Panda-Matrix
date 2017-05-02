class ReposController < ApplicationController

  def index
    @repos = Repo.page(params[:page]).per(10)
  end

  def show
    @repo = Repo.find(params[:id])
    @new_comment = Comment.build_from(@repo, current_user.id, "")
  end

  def new
    @repo = Repo.new
  end

  def search
    query = params[:q]
    @repos = Repo.page(params[:page]).search query
  end

end
