-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:17 PM

local QuestID = 270;
local ReqClv = 18;
local ReqJlv = 0;
local NextQuest = 271;
local RewZeny = 740;
local RewCxp = 2150;
local RewJxp = 860;
local RewWxp = 0;
local RewItem1 = 1700114;
local RewItem2 = 0;
local RewItemCount1 = 3;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Initialize all quest steps
	Saga.AddStep(cid, QuestID, 27001);
	Saga.AddStep(cid, QuestID, 27002);
	Saga.AddStep(cid, QuestID, 27003);

	Saga.InsertQuest(cid, QuestID, 2);
	return 0;
end

function QUEST_FINISH(cid)
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1);

	Saga.InsertQuest(cid, NextQuest, 1);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	--Offical Quest
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
	end

 function QUEST_STEP_2(cid, StepID)
	--Loot Grey Saw Shark's Belly Flesh
	Saga.FindQuestItem(cid, QuestID, 27000, 10159, 4037, 8000, 6, 1);
	Saga.FindQuestItem(cid, QuestID, StepID, 10160, 4037, 8000, 6, 1);
	Saga.FindQuestItem(cid, QuestID, StepID, 10161, 4037, 8000, 6, 1);

	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end

	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid, StepID)
	--Visit Hyunja Yawoong
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1157);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1157 then
		Saga.GeneralDialog(cid, 3936);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end

	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local StepID = CurStepID;
	local ret = -1;

	if CurStepID == 27001 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 27002 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 27003 then
		ret = QUEST_STEP_3(cid, StepID);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
