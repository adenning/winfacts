Facter.add(:bios_manufacturer) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Manufacturer from Win32_Bios')
    query.each do |bios|
      result = bios.Manufacturer
      break
    end
    result
  end
end