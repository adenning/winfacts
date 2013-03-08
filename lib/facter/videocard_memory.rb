Facter.add(:videocard_memory) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select AdapterRAM from Win32_VideoController')
    query.each do |controller|
      if controller.AdapterRAM != nil
        bytes = controller.AdapterRAM.to_i
        mb = bytes / (1024*1024)
        result = mb.to_s + " MB"
        break
      end
    end
    result    
  end
end