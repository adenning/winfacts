Facter.add(:os_architecture) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select OSArchitecture from Win32_OperatingSystem')
    query.each do |os|
        result = os.OSArchitecture
        break
    end
    result
  end
end