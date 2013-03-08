Facter.add(:bios_releasedate) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select ReleaseDate from Win32_Bios')
    query.each do |bios|
      result = bios.ReleaseDate[0..7] if !bios.ReleaseDate.nil?
      break
    end
    result
  end
end