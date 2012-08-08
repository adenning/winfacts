Facter.add(:videocard_maxrefreshrate) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select MaxRefreshRate from Win32_VideoController')
    query.each do |controller|
      result = controller.MaxRefreshRate
      break
    end
    result     
  end
end