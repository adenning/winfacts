Facter.add(:networkadapter_product) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    # http://msdn.microsoft.com/en-us/library/windows/desktop/aa394216(v=vs.85).aspx
    query = 'select * from Win32_NetworkAdapter where AdapterTypeId=0 and (NetConnectionStatus=1 or NetConnectionStatus=2)'
    Facter::Util::WMI.execquery(query).each do |adapter|
      result = adapter.ProductName
      break
    end
    result
  end
end