# Is there a built in way to get this in manifests?
Facter.add(:puppet_confdir) do
  setcode do
    Puppet[:confdir]
  end
end