$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "electric"
  s.version     = "0.0.5"
  s.authors     = ["JD Warren"]
  s.email       = ["johndavid400@gmail.com"]
  s.homepage    = "https://github.com/johndavid400/electric"
  s.summary     = "Electronics formulas"
  s.description = "Ruby library for calculating things like ohms law, resistor values, etc.."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

end
