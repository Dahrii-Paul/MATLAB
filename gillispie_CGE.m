function stateMat = gillispie_CGE(numSteps,totalTime)
%gillespie algorithm for Constitutuve Gene Experssion (page294 of Ingalls)
% R1: null -> M    ; propensity = kr
% R2: null -> P    ; propensity = kp * nM
% R3: M    -> null ; propensity = dr * nM
% R4: P    -> null ; propensity = dp * nP
nC = 2 ; % number of chemical components
nR = 4 ; % number of chemical reactions
kr = 10; kp = 6; dr = 1; dp = 1;
% starting condition
nM = 0; nP = 0;
% state vector = [nM; nP]  (with nM = RNA and nP = Protein)
state = [nM nP];
sMatrix = [ 1 0 ; 0 1 ; -1 0 ; 0 -1];

time = 0;
step = 0;

for step = 1:1:numSteps
%while (time < totalTime)
    % calculate propensities
    nM = state(1);
    nP = state(2);
    propensitiesVec = [kr   kp*nM   dr*nM   dp*nP]
    
    % calculate totalPropensity
    totalPropensity = sum(propensitiesVec);
    
    % calculate waitTime 
    waitTime = - log( rand(1,1) ) / totalPropensity 
    
    % calculate nextReaction
    
    %prob = rand(1,1);
    %rxn = 0;
    %p1 = 0;
    %while (prob > 0.0 )
    %    rxn = rxn + 1 ;
    %    prob = prob -  propensitiesVec(rxn);
    %end
    %nextReaction = rxn;
    
    prob = rand(1,1)*totalPropensity ;
    cumulativePropensity = cumsum(propensitiesVec) ;
    rxn = 1 ;
    while ( prob > cumulativePropensity(rxn))
        rxn = rxn + 1 ;
    end
    nextReaction = rxn ;
                
    % perform nextReaction on state vector
    state = state + sMatrix(nextReaction,:);
    time = time + waitTime;
    step = step +1;
    %propensitiesVec
    stateMat(step,:) = [time, state, nextReaction];

end

                 