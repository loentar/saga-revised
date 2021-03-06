-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM

local QuestID = 198;
local ReqClv = 16;
local ReqJlv = 0;
local NextQuest = 199;
local RewZeny = 300;
local RewCxp = 1700;
local RewJxp = 680;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 3;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 19801);
	Saga.AddStep(cid, QuestID, 19802);
	Saga.AddStep(cid, QuestID, 19803);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- Gives all rewards
	Saga.GiveItem(cid, RewItem1, RewItemCount1);
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.InsertQuest(cid, NextQuest, 1);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	-- Talk with Rufus Haw
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1098);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1098 then
		Saga.GeneralDialog(cid, 3357);
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
	return 0;
end

function QUEST_STEP_2(cid, StepID)
	-- Eliminate Stony Spider (8)
	Saga.Eliminate(cid, QuestID, StepID, 10114, 8, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10115, 8, 1);
	
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
   -- Talk with Rufus Haw
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1098);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1098 then
		Saga.GeneralDialog(cid, 3360);
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

	if CurStepID == 19801 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 19802 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 19803 then
		ret = QUEST_STEP_2(cid, StepID);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
