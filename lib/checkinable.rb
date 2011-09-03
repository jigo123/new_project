module Checkinable
  
  def checkin(user)
    users << user
  end

  def checkout(user)
    users.delete user
  end

  def matches(matching_user)
    matches = []
    self.users.each do |user|
      user.match matching_user
      if user.matches
        matches << user
      end
    end
    matches
  end
  
end
