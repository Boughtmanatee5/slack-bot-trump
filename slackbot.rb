require 'slack-ruby-bot'

SlackRubyBot.configure do |config|
  config.aliases = ['don', 'donald', 'trump']
end

# SlackRubyBot.default do |client, data, match|
#   client.say(text: "<@#{data.user}>, What a loser huh? Sad. real Sad.", channel: data.channel)
# end

class TrumpBot < SlackRubyBot::Bot
  command 'hi' do |client, data, match|
    client.say(text: 'test', channel: data.channel)
  end
  command 'hillary' do |client, data, match|
    client.say(text: "<@#{data.user}>, It's all lies. Check out https://www.lyingcrookedhillary.com/. Sad.", channel: data.channel)
  end
end

TrumpBot.run

=begin
Thread.new do
  EM.run do

  end
end

get '/' do
  if params['code']
    res = HTTP.post("https://slack.com/api/auth.access", params: {
        client_id: ENV['SLACK_CLIENT_ID'],
        client_secret: ENV['SLACK_CLIENT_SECRET']
        code: params['code']
      })

      res = JSON.parse(res)
      token = res['bot']['bot_access_token']
  else
    "hello world"
  end
end
=end



=begin
res = HTTP.post("https://slack.com/api/rtm.start", params: {
    token: ENV['SLACK_AUTH_TOKEN']
  })

resBody = JSON.parse(res.body)
socketUrl = resBody['url']

EM.run do
  ws = Faye::WebSocket::Client.new(socketUrl)

  ws.on :open do
    p [:open]
  end

  ws.on :message do |event|
    data = JSON.parse(event.data);
    if data['text'] =~ /U2LRF8RT3/i
      ws.send({
        type: "message",
        text: "<@#{data['user']}>. What a loser right? Real Sad. Sad.",
        channel: data['channel']
      }.to_json)
    end
    p [:message, JSON.parse(event.data)]
  end

  ws.on :close do |event|
    p [:close, event.code]
    ws = nil
    EM.stop
  end
end
=end
