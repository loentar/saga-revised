-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 247;
local ReqClv = 18;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 609;
local RewCxp = 2150;
local RewJxp = 860;
local RewWxp = 0; 
local RewItem1 = 0; 
local RewItem2 = 0; 
local RewItemCount1 = 0; 
local RewItemCount2 = 0; 
local StepID = 0;   

-- Modify steps below for gameplay

function QUEST_START(cid)    
    Saga.AddStep(cid, QuestID, 24701);
    Saga.AddStep(cid, QuestID, 24702);
    Saga.AddStep(cid, QuestID, 24703);
    Saga.InsertQuest(cid, QuestID, 1);  
    return 0;
end

function QUEST_FINISH(cid)
    -- Gives all rewards
    Saga.GiveZeny(cid, RewZeny);
    Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp); 
    return 0;
end

function QUEST_CANCEL(cid)
    return 0;
end

function QUEST_STEP_1(cid)    
    -- Talk with Monika Reynolds
    Saga.AddWaypoint(cid, QuestID, StepID, 1,  1012);      
    
    -- Check for completion
    local ret = Saga.GetNPCIndex(cid);    
    if ret == 1012 then
        Saga.GeneralDialog(cid, 3936);         
        Saga.SubstepComplete(cid, QuestID, StepID, 1);   
    end    
    
    -- Check if all substeps are completed
    for i = 1, 1 do
         if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
            return -1;
         end
    end        
    
    Saga.StepComplete(cid, QuestID, StepID);
    Saga.ClearWaypoints(cid, QuestID);      
    return 0;                             
end

function QUEST_STEP_2(cid)    
    -- Kill Ressenance of Udar Bandits (8)  
    Saga.Eliminate(cid, QuestID, StepID, 10122, 10, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10123, 10, 1); 
	Saga.Eliminate(cid, QuestID, StepID, 10124, 10, 1); 
	Saga.Eliminate(cid, QuestID, StepID, 10125, 10, 1); 
	Saga.Eliminate(cid, QuestID, StepID, 10126, 10, 1); 
	Saga.Eliminate(cid, QuestID, StepID, 10127, 10, 1); 
	
    -- Check if all substeps are completed
    for i = 1, 1 do
         if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
			return -1;
		 end
    end	
    
    Saga.StepComplete(cid, QuestID, StepID);     
    return 0;                  
end

function QUEST_STEP_3(cid)    
    -- Report to Monika Reynolds
    Saga.AddWaypoint(cid, QuestID, StepID, 1,  1012);      
    
    -- Check for completion
    local ret = Saga.GetNPCIndex(cid);    
    if ret == 1012 then
        Saga.GeneralDialog(cid, 3936);         
        Saga.SubstepComplete(cid, QuestID, StepID, 1);   
    end    
    
    -- Check if all substeps are completed
    for i = 1, 1 do
         if Saga.IsSubStepCompleted(cid,QuestID,StepID, i) == false then
            return -1;
         end
    end        
    
    Saga.StepComplete(cid, QuestID, StepID);
    Saga.ClearWaypoints(cid, QuestID);      
    Saga.QuestComplete(cid, QuestID);     
    return -1;               
end

function QUEST_CHECK(cid)
    local CurStepID = Saga.GetStepIndex(cid, QuestID );
    StepID = CurStepID;
    local ret = -1;

    if CurStepID == 24701 then    
        ret = QUEST_STEP_1(cid);
    elseif CurStepID == 24702 then
        ret = QUEST_STEP_2(cid);   
    elseif CurStepID == 24703 then
        ret = QUEST_STEP_3(cid);        
    end
    
    if ret == 0 then
        QUEST_CHECK(cid)
    end
    
    return ret;    
end
