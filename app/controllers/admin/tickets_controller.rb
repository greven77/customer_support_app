class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:edit, :update, :show, :reply]

  def show
    @event = Event.where(reference: @ticket.reference).last
  end

  def edit
    @statuses = Status.all.map(&:description)
    @users = User.all.map(&:username)
  end

  def update
    if @ticket.update_attributes(ticket_params)
        flash[:notice] = "Ticket has been updated."
        redirect_to [:admin, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end

  def history
    @events = Event.where(reference: params[:reference])
  end

  def new_unassigned
    @tickets = Ticket.where("status = ? OR status = ?", 
      "Waiting for Staff Response", "Cancelled")
  end

  def open
    @tickets = Ticket.where("status != ? AND status != ?  AND status != ?",
     "Waiting for Staff Response", "Cancelled", "Completed")
  end

  def on_hold
    @tickets = Ticket.where(status: "On Hold")
  end

  def closed
    @tickets = Ticket.where(status: "Completed")
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :department,:subject,
      :issue, :status, :reply_subject, :reply_message, :user, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end