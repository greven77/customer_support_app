class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:edit, :update, :show, :reply]

  def show

  end

  def edit

  end

  def update
    reply_subject = params[:reply_subject]
    reply_message = params[:reply_message]
    if @ticket.update_attributes(ticket_params)
      @ticket.send_reply_email(reply_subject, reply_message)
      flash[:notice] = "Ticket has been updated."
      redirect_to [:admin, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render "edit"
    end
  end

  def history
    @events = Event.where(reference: params[:reference])
  end
  #statuses
  #"Waiting for Staff Response"
  #"Waiting for Customer"
  #"On Hold"
  #"Cancelled"
  #"Completed"
  def new_unassigned
    @tickets = Ticket.where("status = ? OR status = ?", "Waiting for Staff Response", "Cancelled")
  end

  def open
    @tickets = Ticket.where("status != ? AND status != ?  AND status != ?  AND status != ?",
     "Waiting for Staff Response", "Cancelled", "On Hold", "Completed")
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
      :issue, :status, :reply_subject, :reply_message)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end