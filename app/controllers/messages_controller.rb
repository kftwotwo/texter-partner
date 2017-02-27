class MessagesController < ApplicationController
  def index
    @messages = Message.all

  end

  def new
    @message = Message.new(to: params[:number])
  end

  def create
    params['message']['to'].split(",").each do |number|
      @message = Message.new(:to => number, :from =>message_params['from'], :body => message_params['body'])
      @message.send_sms
      if @message.save
        flash[:notice] = "Your message was sent!"
      else
        render :new
      end

    end
    flash[:notice] = "Your message was sent!"
    redirect_to messages_path
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
