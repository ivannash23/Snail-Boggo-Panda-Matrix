class ReposController < ApplicationController

  def index
    @repos = Repo.all
  end

  def show
    @repo = Repo.find(params[:id])
    @new_comment = Comment.build_from(@repo, current_user.id, "")
  end

  def new
    @repo = Repo.new
  end

end
