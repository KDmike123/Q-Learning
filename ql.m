function q=ql(R, goalstate)


gamma=0.80;            
q=zeros(size(R));        % to begin with Q matrix is zero
q1=ones(size(R))*inf;    % initialize previous Q as big number
count=0;                 % counter

for iteration=1:50000       %Number of times to pick a random start state and calculate q matrix

    y=randperm(25);
    state=y(1);
    
    while state~=goalstate            % loop until find goal state
        x=find(R(state,:)>=0);        % find possible actions that can be taken from this state
                                      % depending on Rewards matrix
        if size(x,1)>0,
            x1=RandomPermutation(x);  % randomize the possible action
                                      % this function is taken from github
                                      % reference
                          
            x1=x1(1);                 % select one action to be the next
            
        end
        
        qMax=max(q,[],2);           % extract qmax from all possible next states
        q(state,x1)= R(state,x1)+gamma*qMax(x1);   
        state=x1;                   % set state to next state
    end
    
        
     % break if convergence: small deviation on q for 1000 consecutive
     if sum(sum(abs(q1-q)))<0.000000001 && sum(sum(q >0))
         if count>1000,
             disp('episode');
             disp(iteration);  % report last episode
             break % for loop
         else
             count=count+1; % set counter if deviation of q is small
         end
     else
         q1=q;
         count=0;  % reset counter when deviation of q from previous q is large
     end
end
%normalize q
 g=max(max(q));
 if g>0
     q=100*q/g;
 end    