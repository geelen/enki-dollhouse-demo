deployment :production do
  server 'enki_box' do
    task 'prepare rackspace server for dollhouse' do
      # By default, rackspace servers have a root account with
      # password access via SSH. Dollhouse requires a root account
      # accessible without a password, so we use this handy shell command
      # to put our local key up there.
      #
      # Note: this does _not_ use dollhouse to communicate, it just shells out to ssh.
      puts `cat #{Auth::KEYPAIR + '.pub'} | ssh root@#{ip} "mkdir -p ~/.ssh; cat > ~/.ssh/authorized_keys"`
    end

    task 'setup' do
      # Installs babushka
      bootstrap

    end
  end
end
