Facter.add(:networkadapter_product) do
  confine :operatingsystem => :windows
  setcode do
    require 'win32ole'
    result = ''
    # http://msdn.microsoft.com/en-us/library/windows/desktop/aa394216(v=vs.85).aspx
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select * from Win32_NetworkAdapter where AdapterTypeId=0 and (NetConnectionStatus=1 or NetConnectionStatus=2)')
    query.each do |adapter|
      result = adapter.ProductName
      break
    end
    result
  end
end
