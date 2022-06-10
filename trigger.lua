function (event, ...)
  local isRaidEnabled = IsInRaid() and aura_env.config.isRaidEnabled
  local isPartyEnabled = (not IsInRaid() and aura_env.config.isPartyEnabled)
  local isWeakAuraEnabled = isPartyEnabled or isRaidEnabled

  if (not isWeakAuraEnabled) then
    return
  end

  if (event == "CHAT_MSG_SYSTEM") then
      local text = ...
      local isEveryoneReady = text == READY_CHECK_ALL_READY

      local isGroupLeader = UnitIsGroupLeader("player")
      local isGroupAssistant = UnitIsGroupAssistant("player")
      local canStartPullTimer = isGroupLeader or isGroupAssistant

      if (canStartPullTimer and isEveryoneReady) then
          local timerSeconds = isRaidEnabled and aura_env.config.pullTimerRaid or aura_env.config.pullTimerParty

          aura_env.startPullTimer(timerSeconds)
      end
  end
end
