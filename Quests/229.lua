-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 229;
local ReqClv = 13;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 319;
local RewCxp = 777;
local RewJxp = 0;
local RewWxp = 0; 
local RewItem1 = 1700113; 
local RewItem2 = 0; 
local RewItemCount1 = 6; 
local RewItemCount2 = 0; 
local StepID = 0;   

-- Modify steps below for gameplay

function QUEST_START(cid)    
    Saga.AddStep(cid, QuestID, 22901);
    Saga.AddStep(cid, QuestID, 22902);       
    Saga.AddStep(cid, QuestID, 22903);           
    Saga.InsertQuest(cid, QuestID, 1);  
    return 0;
end

function QUEST_FINISH(cid)
    -- Gives all rewards
    Saga.GiveItem(cid, RewItem1, RewItemCount1 );
    Saga.GiveZeny(cid, RewZeny);
    Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp); 
    return 0;
end

function QUEST_CANCEL(cid)
    return 0;
end

function QUEST_STEP_1(cid)
    -- Talk with Monika Reynolds
    Saga.AddWaypoint(cid, QuestID, StepID, 1, 1012);      
    
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
    -- Visit Sophie
    Saga.AddWaypoint(cid, QuestID, StepID, 1, 1151);      
    
    -- Check for completion
    local ret = Saga.GetNPCIndex(cid);    
    if ret == 1151 then
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

function QUEST_STEP_3(cid)
    -- Report to Monika Reynolds
    Saga.AddWaypoint(cid, QuestID, StepID, 1, 1012);      
    
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

    if CurStepID == 22901 then
        ret = QUEST_STEP_1(cid);
    elseif CurStepID == 22902 then                               
        ret = QUEST_STEP_2(cid);                             
    elseif CurStepID == 22903 then                           
        ret = QUEST_STEP_3(cid);       
    end
    
    if ret == 0 then
        QUEST_CHECK(cid)
    end
    
    return ret;    
end
