class TicketsController < ApplicationController
  before_action :set_ticket, only: [:edit, :update]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "Ticket successfully sent, please check your email."
      redirect_to root_path
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
    @ticket = Ticket.where(reference: params[:reference]).first
    @events = Event.where(reference: params[:reference])
  end

  def edit
    
  end

  def update
    if @ticket.update_attributes(ticket_params)
        flash[:notice] = "Ticket has been updated."
        redirect_to ticket_history_path(params[:reference])
    else
      flash[:alert] = "Ticket has not been updated."
      redirect_to ticket_history_path(params[:reference])
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email, :department,:subject, :issue,:reference)
  end

  def set_ticket
    @ticket = Ticket.where(reference: params[:reference]).first
  end

end
