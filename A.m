function output = A(x)
    [Loop, Risk, mainflow, otherflow] = mainFunction(15,x);
    output = Loop + 4 * otherflow/Risk + mainflow/Loop;
end