Facter.add(:monitor_description) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Description from Win32_DesktopMonitor')
    query.each do |monitor|
      result = monitor.Description
      break
    end
    result
  end
end