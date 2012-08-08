Facter.add(:motherboard_serialnumber) do
  confine :operatingsystem => :windows
  setcode do    
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select SerialNumber from Win32_BaseBoard')
    query.each do |board|
      result = board.SerialNumber
      break
    end
    result    
  end
end