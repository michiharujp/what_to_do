class InsectsController < ApplicationController

  def index
    @insects = Insect.all
    @insect  = Insect.new
  end

  def create
    @insect = Insect.new(insect_params)
    if @insect.save
      flash[:success] = "the insect scilently flied out"
      redirect_to insects_path
    else
      @insects = Insect.all
      flash[:danger] = "the insect suddenly died"
      render :index
    end
  end

  def destroy
    @insect = Insect.find(params[:id])
    if @insect.destroy
      flash[:success] = "killed"
    else
      flash[:danger] = "survived"
    end
    redirect_to insects_path
  end

  private

    def insect_params
      params.require(:insect).permit(:name, :picture)
    end

end
