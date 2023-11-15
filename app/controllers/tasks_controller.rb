class TasksController < ApplicationController
  # READ PART -- BEGIN
  def index
    @tasks = Task.all
    # implicit render index.html.erb
    # pointe vers l'index avec la variable d'instance tasks (tableau d'instances)
  end

  def show
    @task = Task.find(params[:id])
  end
  # READ PART -- END

  # CREATE PART -- BEGIN
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end
  # CREATE PART -- END

  # UPDATE PART -- BEGIN
  def edit
    @task = Task.find(params[:id])
    # render edit.html.erb
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # To avoid Forbiden::Error
    redirect_to root_path
  end
  # UPDATE PART -- END

  # DELETE PART -- BEGIN
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end
  # DELETE PART -- END

  private

  # Obligatoire : Permet de donner des autorisations pour créer une instance
  # Car la méthode create est un post : on veut soumettre des infos via formulaire
  # S'emploie aussi pour les updates
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
