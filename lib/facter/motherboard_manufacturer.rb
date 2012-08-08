Facter.add(:motherboard_manufacturer) do
  confine :operatingsystem => :windows
  setcode do    
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Manufacturer from Win32_BaseBoard')
    query.each do |board|
      result = board.Manufacturer
      break
    end
    result    
  end
end