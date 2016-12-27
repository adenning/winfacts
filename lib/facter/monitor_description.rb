Facter.add(:monitor_description) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Description from Win32_DesktopMonitor')
    query.each do |monitor|
      result = monitor.Description.encode(Encoding.find('UTF-8'), {invalid: :replace, undef: :replace, replace: ''})
      break
    end
    result
  end
end
