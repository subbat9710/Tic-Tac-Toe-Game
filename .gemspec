Gem::Specification.new do |spec|
    spec.name          = "Tic-Tac-Toe-Game"
    spec.version       = "0.1.0"
    spec.authors       = ["subbat9710"]
    spec.email         = ["tula.subba1991@gmail.com"]
    spec.summary       = "A brief description of my gem"
    spec.description   = "A longer description of my gem"
    spec.homepage      = "https://github.com/subbat9710/Tic-Tac-Toe-Game"
    spec.license       = "MIT"
  
    spec.files         = Dir["lib/**/*.rb", "bin/*"]
    spec.require_paths = ["lib"]
  
    spec.add_dependency "some_other_gem", "~> 1.0"
  
    spec.metadata = {
      "foo" => "bar",
      "baz" => "qux"
    }
  end
  