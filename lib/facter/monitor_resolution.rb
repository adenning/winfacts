Facter.add(:monitor_resolution) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select * from Win32_VideoController')
    query.each do |controller|
      width = controller.CurrentHorizontalResolution
      height = controller.CurrentVerticalResolution
      result = width.to_s + 'x' + height.to_s
      break
    end
    result
  end
end