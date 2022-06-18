source "https://rubygems.org"

gem "berkshelf", "~> 8.0.0"
gem "chefspec", "~> 9.3.0"
gem "cookstyle", "~> 7.32.0"
gem "rubocop-discourse"
gem "rake"

group :integration do
  gem "kitchen-dokken", "~> 2.17.0"
end

group :vagrant do
  gem "kitchen-inspec", "~> 2.6.0"
  gem "kitchen-vagrant", "~> 1.12.0"
end

group :release do
  gem "stove", "~> 7.1", ">= 7.1.6"
end
