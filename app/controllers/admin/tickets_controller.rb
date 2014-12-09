class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:edit, :update, :show, :reply]

  def show

  end

  def edit

  end

  def update
    if @ticket.update_attributes(ticket_params)
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

  def reply
    @ticket.send_reply_email(reply_subject, reply_message)
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