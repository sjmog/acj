class CodesController < ApplicationController
  def create
    task = Task.find(code_params[:task_id])

    files.each { |file| Code.create(task: task, pdf: file) }

    redirect_to task
  end

  private

  def files
    params.require(:files)
  end

  def code_params
    params.require(:code).permit(:task_id)
  end
end