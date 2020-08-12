class InquiryChatwork
  require 'net/https'
  require 'json'

  def push_chatwork_message
    @uri = URI.parse('https://api.chatwork.com')
    @client = Net::HTTP.new(@uri.host, 443)
    @client.use_ssl = true

    ##### ChatWork APIトークン (~/.bashrcに追加した環境変数から取得する)
    @chatwork_api_token = ENV["a6a5b6d8820cb530c155fbc1f96fa4c6"]

    ##### ChatWorkへメッセージを通知するルームID (~/.bashrcに追加した環境変数から取得する)
    @message_room_id = ENV["143754092"]

    ##### Chatworkへ通知するメッセージ内容
    @message_text = "ブログに投稿がありました"
    ##### ChetWorkへメッセージ送信
    @res = @client.post( "/v2/rooms/#{@message_room_id}/messages", "body=#{@message_text}", {"X-ChatWorkToken" => "#{@chatwork_api_token}"} )

    puts JSON.parse(@res.body)
  end

end