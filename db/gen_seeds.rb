require 'yaml'

SEEDS_YAML = "./seeds.yml"

def main
	data = YAML.load_file(SEEDS_YAML)
	outputf = open("seeds.rb", 'w')
	for class_name, args in data
		clazz = class_name.capitalize
		for arg_hash in args 
			obj = new_class(clazz, arg_hash)
			outputf.write(obj)
		end
	end
end

def new_class(clazz, args)
	fargs = if args.is_a?(Hash) 
		keys_to_symbols(args) 
	else 
		args
	end
	"#{clazz}.create!(#{fargs.to_s})\n"
end

# Bad style? but really annoying to not be mapable 
# class Hash
# 	def map(&block)
# 		for k, v in self
# 			(kp, vp) = yield k, v
# 		end
# 	end
# 	
# 	def map_keys
# 	end
# 		
# 	def map_values
# 	end
# end

def keys_to_symbols(hash)
	sym_hash = {}
	for key, value in hash
		sym_hash[key.to_sym] = value
	end
	sym_hash
end
	
if __FILE__ == $0
	main
end