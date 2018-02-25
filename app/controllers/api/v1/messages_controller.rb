class Api::V1::MessagesController < ApplicationController

  before_action :message, :find_team, only: [:create]

  def create
    if @team.nil?
      MessageCreatorService.error_no_team(sender_number)
    else
      MessageCreatorService.send_messages(@team, message)
    end
  end

    private
    attr_reader :message, :team, :sender_number

    def find_team
      @team ||= Team.find_by(id: message.match(/^\d+/).to_a.first)
    end

    def message
      @message ||= params['Body']
    end

    def sender_number
      @sender_number ||= params['From']
    end

end
