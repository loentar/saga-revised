-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM

local QuestID = 207;
local ReqClv = 18;
local ReqJlv = 0;
local NextQuest = 208;
local RewZeny = 348;
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
    Saga.AddStep(cid, QuestID, 20701);
    Saga.AddStep(cid, QuestID, 20702);       
    Saga.AddStep(cid, QuestID, 20703);      
    Saga.InsertQuest(cid, QuestID, 1);  
    return 0;
end

function QUEST_FINISH(cid)
    -- Gives all rewards
    Saga.GiveZeny(cid, RewZeny);
    Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp); 
    Saga.InsertQuest(cid, NextQuest, 1);  
    return 0;
end

function QUEST_CANCEL(cid)
    return 0;
end

function QUEST_STEP_1(cid)
    -- Deliver Flint to Kuno Aston
    Saga.AddWaypoint(cid, QuestID, StepID, 1, 1095);      
    
    -- Check for completion
    local ret = Saga.GetNPCIndex(cid);    
    if ret == 1095 then
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
    -- Obtain Flint (1)
    Saga.FindQuestItem(cid, QuestID, StepID, 10122, 3997, 8000, 1, 1);
    Saga.FindQuestItem(cid, QuestID, StepID, 10123, 3997, 8000, 1, 1);
    Saga.FindQuestItem(cid, QuestID, StepID, 10124, 3997, 8000, 1, 1);
    
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
    -- Obtain Flint
    Saga.AddWaypoint(cid, QuestID, StepID, 1, 1095);      
    
    -- Check for completion
    local ret = Saga.GetNPCIndex(cid);    
    if ret == 1095 then
        Saga.GeneralDialog(cid, 3936);             
        
        local ItemCountA = Saga.CheckUserInventory(cid,3997);    
        if ItemCountA > 0 then
            Saga.NpcTakeItem(cid, 3997,1);          
            Saga.SubstepComplete(cid, QuestID, StepID, 1); 
        end        
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

    if CurStepID == 20701 then
        ret = QUEST_STEP_1(cid);
    elseif CurStepID == 20702 then                   
        ret = QUEST_STEP_2(cid);        
    elseif CurStepID == 20703 then               
        ret = QUEST_STEP_3(cid);          
    end
    
    if ret == 0 then
        QUEST_CHECK(cid)
    end
    
    return ret;    
end
