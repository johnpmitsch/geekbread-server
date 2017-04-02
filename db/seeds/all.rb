beta_file = File.open(File.join(Rails.root, "/db/beta_keys/beta_keys.txt"))
beta_file.each_line { |key| BetaKey.find_or_create_by(beta_key: key.chomp)  }
