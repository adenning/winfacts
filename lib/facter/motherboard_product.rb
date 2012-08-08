Facter.add(:motherboard_product) do
  confine :operatingsystem => :windows
  setcode do    
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Product from Win32_BaseBoard')
    query.each do |board|
      result = board.Product
      break
    end
    result    
  end
end