function values = randValueWithWeight(values_posible, weight, num_of_values)
    p = weight./sum(weight);
    cumulative_prob = cumsum(p);
    random_numbers = rand(1,num_of_values);
    
    selections = bsxfun(@ge, random_numbers, cumulative_prob);
    inds = sum(selections, 2) + 1;
    values = values_posible(inds);
end
