if @new_message.present?
  json.arry! @new_message #配列かつjson形式で@new_messageを返す
end
