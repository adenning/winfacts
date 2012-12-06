Facter.add(:os_architecture) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select AddressWidth from Win32_Processor where DeviceID="CPU0"')
    query.each do |os|
       # This typically returns 32-bit or 64-bit, but I've seen it only return 64 and 32 in some embedded instances.
       # To keep the fact consistent we only take the first two characters.
        result = os.AddressWidth.to_s[0..1]
    end
    result
  end
end