# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
   @candidates.select{|candidate| candidate[:id] === id }
  #return @candidates

end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    github(candidate) &&
    applied(candidate) &&
    age(candidate) &&
    ruthon(candidate)
  end
end

def github(candidate)
  candidate[:github_points] >= 100
end

def ruthon(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end

def applied(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def age(candidate)
  candidate[:age] >= 18
end

def ordered_by_qualifications(candidates)
  @candidates.sort{|a,b| a[:years_of_experience] <=> b[:years_of_experience]}.reverse
end



# More methods will go below
