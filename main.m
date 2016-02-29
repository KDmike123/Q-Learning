R=RMatrix;             %this the Reward matrix entered manually and taken from RMatrix.m
                       %it contains -inf for all unreachable states and 0
                       %for all reachable states from a given state

%get the goal state(terminal value) from the user and store it in variable
%goal_state
prompt = 'Enter row for goal state between(1 & 5)';   
ro=input(prompt);
prompt = 'Enter column for goal state between(1 & 5)';
co=input(prompt);
goal_state = findstate(ro,co);

disp('goal_state')
disp(goal_state);
os2=find(R(:,goal_state)==0);

%Change the transition value to these states to 10
for i = 1 :length(os2)
    R(os2(i),goal_state)=10;
end
    

%get the value for three obstacles from the user and change the reward at
%these values to -10
prompt ='Enter row of first obstacle between(1 & 5)';
ro1=input(prompt);
prompt ='Enter col of first obstacle between(1 & 5)';
col1=input(prompt);
obs1=findstate(ro1,col1);
os1=find(R(:,obs1)==0);

%Change the transition value to obstacle state to -10
for i = 1 :length(os1)
    R(os1(i),obs1)=-10;
end

prompt ='Enter row of second obstacle between(1 & 5)';
ro2=input(prompt);
prompt ='Enter col of second obstacle between(1 & 5)';
col2=input(prompt);
obs2=findstate(ro2,col2);
os2=find(R(:,obs2)==0);

%Change the transition value to obstacle state to -10
for i = 1 :length(os2)
    R(os2(i),obs2)=-10;
end

prompt ='Enter row of third obstacle between(1 & 5)';
ro3=input(prompt);
prompt ='Enter col of third obstacle between(1 & 5)';
col3=input(prompt);
obs3=findstate(ro3,col3);
os3=find(R(:,obs3)==0);

%Change the transition value to obstacle state to -10
for i = 1 :length(os3)
    R(os3(i),obs3)=-10;
end

q = ql(R, goal_state); %call the ql(Q-learning function) with the modified R matrix and given goal_state
disp(q)