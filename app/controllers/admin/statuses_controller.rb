class Admin::StatusesController < Admin::BaseController
  before_action :admin?
  before_action :set_status, only: [:show, :edit]

  def new
    @status = Status.new
  end

  def edit

  end

  def update
    if @status.update_attributes(status_params)
      flash[:notice] = "Status has been updated."
      redirect_to admin_statuses_path
    else
      flash[:alert] = "Status has not been updated."
      render :action => "edit"
    end
  end

  def create
    @ticket = Status.new(status_params)

    if @ticket.save
      flash[:notice] = "Status successfully created."
      redirect_to admin_statuses_path
    else
      flash[:alert] = "Status has not been created."
      render :new
    end
  end

  def destroy
    @status.destroy
    flash[:notice] = "Status has been deleted."
    redirect_to admin_statuses_path
  end

  private

  def status_params
    params.require(:status).permit(:description)
  end

  def set_status
    @status = Status.find(params[:id])
  end

  def admin?
    if current_user.role != 'admin'
      redirect_to admin_root_path
    end
  end
end