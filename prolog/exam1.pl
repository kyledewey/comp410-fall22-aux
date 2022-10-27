%% element(gold).
%% element(mercury).

type(gold, element).
type(mercury, element).

meltingPoint(mercury, -39).
meltingPoint(gold, 1064).

boilingPoint(mercury, 357).
boilingPoint(gold, 2970).

% 5.d
% ?- element(E),
%    meltingPoint(E, EMeltingPoint),
%    EMeltingPoint =< 0.

% 5.e
% find C1, C2 such that C1 boils before C2 melts
% ?- boilingPoint(C1, C1Boiling),
%    meltingPoint(C2, C2Melting),
%    C1Boiling < C2Melting.
%    
