function [state,reward] = step(state,END_STATES)

    if (rand<0.5)
        action = -1;
    else
        action = 1;
    end
    step = randperm(100,1);
    step = step*action;
    state= state+ step;
    
    if (state==END_STATES(1))
        reward = -1;
    elseif (state==END_STATES(2))
        reward =1;
    else
        reward = 0;
    end
    
    if(state<END_STATES(1)) state = END_STATES(1);reward =-1;end
    if(state>END_STATES(2)) state = END_STATES(2);reward = 1;end
end