Facter.add(:bios_smbversion) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select SMBIOSBIOSVersion from Win32_Bios')
    query.each do |bios|
      result = bios.SMBIOSBIOSVersion
      break
    end
    result
  end
end