class MessageCreatorService

  def self.send_messages(team, message = '')
    team.users.each do |user|
      formatted_phone = Phony.normalize(user.phone)
      final_phone = '+1'.concat(formatted_phone)
      build_message("Hi #{user.name}! Your coach says: " + message, final_phone)
    end
  end

  def self.error_no_team(to_number)
    build_message("Could not find team. Try again.", to_number)
  end

    private
    attr_reader :account_sid, :auth_token, :client

    def self.account_sid
      @account_sid ||= ENV['twilio_account_sid']
    end

    def self.auth_token
      @auth_token ||= ENV['twilio_auth_token']
    end

    def self.client
      @client ||= Twilio::REST::Client.new(account_sid, auth_token)
    end

    def self.build_message(message, to_number)
      client.messages.create(
        body: message,
        to: '+12055150983',
        from: ENV['twilio_app_number']
      )
    end
end
