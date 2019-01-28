function output = A(x)
    [Loop, Risk] = mainFunction(15,x);
    output = Loop + 0.2 * Risk;
end