Facter.add(:bios_description) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Description from Win32_Bios')
    query.each do |bios|
      result = bios.Description
      break
    end
    result
  end
end