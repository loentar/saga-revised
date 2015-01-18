-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM

local QuestID = 141;
local ReqClv = 7;
local ReqJlv = 0;
local NextQuest = 348;
local RewZeny = 88;
local RewCxp = 132;
local RewJxp = 0;
local RewWxp = 0; 
local RewItem1 = 1700113; 
local RewItem2 = 51500003; 
local RewItemCount1 = 1; 
local RewItemCount2 = 10; 

function QUEST_VERIFY(cid)
	Saga.GeneralDialog(cid, 3957);
	return 0;
end

-- Initialisation des �tapes
function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 14101);
	Saga.AddStep(cid, QuestID, 14102);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- R�compenses
	local freeslots = Saga.FreeInventoryCount(cid, 0)
	if freeslots > 1 then
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1 );
	Saga.GiveItem(cid, RewItem2, RewItemCount2 );
		return 0;
	else
		Saga.EmptyInventory(cid);
		return -1;
	end
end

function QUEST_CANCEL(cid)
	-- Annulation de la qu�te
	return 0;
end

function QUEST_STEP_1(cid)
	Saga.StepComplete(cid, QuestID, 14101);
	return 0;
end

function QUEST_STEP_2(cid)
	Saga.AddWaypoint(cid, QuestID, 14102, 1, 1003);
	
	local ret = Saga.GetNPCIndex(cid);    
	if ret == 1003 then
			Saga.SubstepComplete(cid, QuestID, 14102, 1);
		end

--check if all substeps completed
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, 14102, i) == false
then
	return -1;
	end

end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, 14102);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	-- V�rifie toutes les �tapes
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local ret = -1;
	StepID = CurStepID;
	
	if CurStepID == 14101 then
		ret = QUEST_STEP_1(cid);
	elseif CurStepID == 14102 then
		ret = QUEST_STEP_2(cid);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid)
	end
	
	return ret;
end