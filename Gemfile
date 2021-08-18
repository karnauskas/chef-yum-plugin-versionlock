source "https://rubygems.org"

gem "berkshelf", "~> 7.2.2"
gem "chefspec", "~> 9.3.0"
gem "cookstyle", "~> 7.19.0"
gem "rubocop-discourse"
gem "rake"

group :integration do
  gem "kitchen-dokken", "~> 2.14.0"
end

group :vagrant do
  gem "kitchen-inspec", "~> 2.5.0"
  gem "kitchen-vagrant", "~> 1.9.0"
end

group :release do
  gem "stove", "~> 7.1", ">= 7.1.6"
end
