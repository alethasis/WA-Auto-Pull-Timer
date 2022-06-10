local sendToChat = function(textToSend)
  local editBox = ChatFrame_OpenChat("", DEFAULT_CHAT_FRAME)

  if (editBox) then
      editBox:SetText("")
      editBox:Insert(textToSend)
      ChatEdit_OnEnterPressed(editBox)
  end
end

local startPullTimer = function(timerSeconds)
  local pullText = format("/pull %d", timerSeconds)
          
  aura_env.sendToChat(pullText)
end

aura_env.sendToChat = sendToChat
aura_env.startPullTimer = startPullTimer