-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:14 PM
--Spanner 7/25/08

local QuestID = 42;
local ReqClv = 10;
local ReqJlv = 0;
local NextQuest = 339;
local RewZeny = 237;
local RewCxp = 639;
local RewJxp = 252;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 4;
local RewItemCount2 = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 4201);
	Saga.AddStep(cid, QuestID, 4202);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end
function QUEST_FINISH(cid)
	local freeslots = Saga.FreeInventoryCount(cid, 0);
	if freeslots > 1 then
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1);
	Saga.GiveItem(cid, RewItem2, RewItemCount2);
	return 0;
	else
	return -1;
	end

end
function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	--Eliminate Exiled Merman;Eliminate Be Chased Mermaid

	Saga.Eliminate(cid, QuestID, StepID, 10030, 4, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10031, 4, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10034, 4, 2);
	Saga.Eliminate(cid, QuestID, StepID, 10035, 4, 2);
	--Get loot from Be Chased Mermaid
	Saga.FindQuestItem(cid, QuestID, StepID, 10034, 4073, 8000, 1, 3);

	--chek if all substeps are complete
	for i = 1, 3 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_2(cid, StepID)
	--Report to Misha Berardini

	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1000);

	--check for Completion
	local ret = Saga.GetNPCIndex(cid);
	local ItemCount = Saga.CheckUserInventory(cid, 4073);
	if ret == 1000
	then
	Saga.GeneralDialog(cid, 358);
	if ItemCount > 0
	then
	Saga.NpcTakeItem(cid, 4073, 1);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
-- check if all substeps are complete
	for i -1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local ret = -1;
	local StepID = CurStepID;

	if CurStepID == 4201 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 4202 then
		ret = QUEST_STEP_2(cid, StepID);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
