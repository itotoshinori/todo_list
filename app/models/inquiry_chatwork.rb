class InquiryChatwork
  require 'net/https'
  require 'uri'
  require 'json'
  #git hubでの編集要
  def push_chatwork_message(message,num)
   
      http.start do
        req = Net::HTTP::Post.new(uri.path)
        req['X-ChatWorkToken'] = chatwork_api_token
        req.set_form_data(body: messagetext)
        http.request(req) 
        result = true
      end
    else
      result = false
    end
  end
end
