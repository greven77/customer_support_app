class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "Ticket successfully sent, please check your email."
      render :new
    else
      flash[:alert] = "Ticket has not been created."
      render :new
    end
  end

  def confirm_client_email
    @ticket = Ticket.where(reference: params[:reference], email: params[:email])
    @ticket.email_confirmed = true
    #redirect to root with flash notice displaying confirmation success
  end

  def history
    @events = Event.where(reference: params[:reference])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :department,:subject, :issue)
  end

end
