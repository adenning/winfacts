Facter.add(:videocard_description) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Description from Win32_VideoController')
    query.each do |controller|
      result = controller.Description
      break
    end
    result   
  end
end