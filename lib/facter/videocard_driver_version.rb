Facter.add(:videocard_driver_version) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select DriverVersion from Win32_VideoController')
    query.each do |controller|
      result = controller.DriverVersion
      break
    end
    result     
  end
end