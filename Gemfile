source "https://rubygems.org"

gem "berkshelf", "~> 8.1.4"
gem "chefspec", "~> 9.3.0"
gem "cookstyle", "~> 8.1.2"
gem "rubocop-discourse"
gem "rake"

group :integration do
  gem "kitchen-dokken", "~> 2.20.3"
end

group :vagrant do
  gem "kitchen-inspec", "~> 3.0.0"
  gem "kitchen-vagrant", "~> 2.0.0"
end

group :release do
  gem "stove", "~> 7.1", ">= 7.1.6"
end
