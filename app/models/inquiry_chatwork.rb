class InquiryChatwork
  require 'net/https'
  require 'uri'
  require 'json'

  def push_chatwork_message(comment_massage)
    chatwork_room_id = '197330662'
    chatwork_api_token = '74bfe242711fcf573a2379c183b250fb'
    uri = URI.parse("https://api.chatwork.com/v2/rooms/#{chatwork_room_id}/messages")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    message = "[To:3775224]#{comment_massage.name}さんからブログにコメントがありました。確認をお願いします。"

    http.start do
      req = Net::HTTP::Post.new(uri.path)
      req['X-ChatWorkToken'] = chatwork_api_token
      req.set_form_data(body: message)
      http.request(req)
    end
  end
end