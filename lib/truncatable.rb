module Truncatable
  
  def short_name
    name.truncate(17, :separator => ' ')
  end

end
