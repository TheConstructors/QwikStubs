# A task to generate our `seeds.rb` from `seeds.yml`. The eventual 
# goal being to write a scraper that populates `seeds.yml`, then use
# `gen_seeds.rb` to generate the `seeds.rb` file.

task :gen_seeds do
	ruby "db/gen_seeds.rb"
end