classdef euclidean_loss_layer < layer
    % euclidean_loss_layer Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function layer = euclidean_loss_layer()
            layer.Do = 1;
            layer.type = 'euclidean_loss';
            layer.initialized = false;
        end;
        
        function result = forward(e, input, target)
            intermediate = input - target;
            result = 0.5 * norm(intermediate, 'fro') ^ 2 / size(input, 2);
%             result = 0.5 * norm(intermediate, 'fro') ^ 2;
        end;
        
        function result = backward(e, input, target, gradoutput)
            result = {gradoutput * (input - target), []};
%             result = {gradoutput * ((input - target) / size(input, 2)), []};
        end
        
        function e = change_dimensions(e, Di)
            e.Di = Di;
            e.Do = 1;
            e.initialized = true;
        end
        
        function paramvec = get_paramvec(e)
            paramvec = [];
        end
        
        function e = set_paramvec(e, paramvec)
            
        end

    end
    
end

