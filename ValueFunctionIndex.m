function group_index = ValueFunctionIndex(state,END_STATES,group_size)

if (ismember(state,END_STATES(1)))
    group_index=1;
elseif(ismember(state,END_STATES(2)))
    group_index=10;
else
    group_index = ceil(state/group_size);
end
end