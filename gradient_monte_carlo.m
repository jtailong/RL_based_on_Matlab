function [distribution,Value] = gradient_monte_carlo(START_STATE,Value,alpha,distribution,END_STATES,group_size)
state = START_STATE;
states = [state];
%rewards = [];
while (~ismember(state,END_STATES))
    distribution(state) = distribution(state) +1;
    [next_state,reward] = step(state,END_STATES);
    states = [states,next_state];
    %rewards = [rewards,reward];
    state = next_state;
end

for i=1:length(states)
    %reward = rewards(i);
    state = states(i);
    group_index = ValueFunctionIndex(state,END_STATES,group_size)
    %get hte group number
    if (group_index<10)
    delta = alpha*(reward-Value(group_index+1));
    else
        delta = alpha*(reward-Value(group_index));
    end
    %update the groups value
    Value(group_index) = Value(group_index) + delta;
end
end