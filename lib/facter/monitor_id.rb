Facter.add(:monitor_id) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select PNPDeviceID from Win32_DesktopMonitor')
    query.each do |monitor|
      # just get the first non-nil result
      if monitor.PNPDeviceID != nil
        result = monitor.PNPDeviceID.split('\\')[1]
        break
      end
    end
    result
  end
end