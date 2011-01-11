module Auth
  KEYPAIR = Dir.glob(File.expand_path "~/.ssh/id_[dr]sa").first
  SERVER_PASSWORD = IO.read(File.dirname(__FILE__) + '/password.txt').chomp ||
    raise("You must define a server password in password.txt!")
end
