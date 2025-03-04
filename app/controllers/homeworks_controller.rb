class HomeworksController < ApplicationController
  def index
    @homeworks = Homework.all
  end

  def show
    @homework = Homework.find(params[:id])
  end

  def new
    @homework = Homework.new
  end

  def create
    @homework = Homework.new(homework_params)
    if @homework.save
      redirect_to homeworks_path, notice: '宿題が作成されました。'
    else
      render :new
    end
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def update
    @homework = Homework.find(params[:id])
    if @homework.update(homework_params)
      redirect_to homeworks_path, notice: '宿題が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy
    redirect_to homeworks_path, notice: '宿題が削除されました。'
  end

  private

  def homework_params
    params.require(:homework).permit(:title, :details, :deadline, :status)
  end
end
