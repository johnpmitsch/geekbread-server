User.where(nickname: nil).map { |x| x.update_attribute("nickname", "breadgeek#{x.id}") }
