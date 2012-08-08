Facter.add(:motherboard_version) do
  confine :operatingsystem => :windows
  setcode do
    result = ''    
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Version from Win32_BaseBoard')
    query.each do |board|
      result = board.Version
      break
    end
    result    
  end
end