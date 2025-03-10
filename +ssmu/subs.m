function subsExpr = subs(expr, old, new)
% Wrapper to handle expressions of type 'sym' and 'casadi.SX' with
% substitutions
    if isa(expr, 'casadi.SX')
        subsExpr = casadi.substitute(expr, old, new);
    elseif isa(expr, 'sym')
        subsExpr = subs(expr, old, new);
    else
        error("Expression must be one of casadi.SX|sym")
    end
end