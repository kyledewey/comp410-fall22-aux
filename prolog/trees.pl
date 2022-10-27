% binary_tree = leaf | internal(binary_tree, INT, binary_tree)

% counts both leaves and internal nodes
% numNodes: BinaryTree, Count
numNodes(leaf, 1).
numNodes(internal(Left, _, Right), Count) :-
    numNodes(Left, LeftCount),
    numNodes(Right, RightCount),
    Count is LeftCount + RightCount + 1.

% addAmountTree: InputBinaryTree, AmountToAdd, OutputBinaryTree
addAmountTree(leaf, _, leaf).
addAmountTree(internal(Left, Value, Right),
              Amount,
              internal(LeftResult, ValueResult, RightResult)) :-
    addAmountTree(Left, Amount, LeftResult),
    ValueResult is Value + Amount,
    addAmountTree(Right, Amount, RightResult).

% extractValues: InputBinaryTree, OutputListOfValues
extractValues(leaf, []).
extractValues(internal(Left, Value, Right), Result) :-
    extractValues(Right, RightResult),
    extractValues(Left, LeftResult),
    append(LeftResult, [Value|RightResult], Result).

% extractValuesWithBound: Bound, Tree, List
extractValuesWithBound(_, leaf, []).
extractValuesWithBound(Bound, internal(Left, Value, Right), Result) :-
    Bound > 0,
    NewBound is Bound - 1,
    extractValuesWithBound(NewBound, Right, RightResult),
    extractValuesWithBound(NewBound, Left, LeftResult),
    append(LeftResult, [Value|RightResult], Result).
