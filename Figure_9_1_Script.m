
% the total state numbers except the terminal states
N_STATES = 1000;

% all states
STATES = zeros(1,N_STATES);

% start state
START_STATE = round(N_STATES/2);

% terminal state
END_STATES = [1,N_STATES];

% maximum stride for an action
STEP_RANGE = 100;

%episodes
EPISODES = 1e5;

%step size
alpha = 2e-5;

%number of groups
num_of_groups = 10;
% group size
group_size = N_STATES/num_of_groups;

% compute true value
Vtruth = -1 + 2*(0:(N_STATES+1))/(N_STATES+1);Vtruth(1)=[]; Vtruth(end) = [];

%set the initial value of the seggregation states
Value = zeros(1,num_of_groups);
%store the visited states times
distribution = zeros(1,N_STATES);
% return the index of the original states
%group_index = ValueFunctionIndex(state,END_STATES,group_size)

for ei =1:EPISODES
    fprintf('ei=%d',ei);
    [distribution,Value] = gradient_monte_carlo(START_STATE,Value,alpha,distribution,END_STATES,group_size);
    plot(Value);
end
distribution = distribution/sum(distribution);
state_values = zeros(1,N_STATES);
for si =1:N_STATES
    %is is the number of states ranging from 1 to 1000
    group_index = ValueFunctionIndex(si,END_STATES,group_size)
    state_values(si) = Value(group_index);
end
plot(state_values);
plot(distribution);