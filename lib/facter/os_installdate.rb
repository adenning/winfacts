Facter.add(:os_installdate) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select InstallDate from Win32_OperatingSystem')
    query.each do |os|
      result = os.InstallDate[0..7] if !os.InstallDate.nil?
      break
    end
    result
  end
end