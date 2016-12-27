Facter.add(:soundcard_description) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts://./root/CIMV2')
    query = wmi.ExecQuery('select Description from Win32_SoundDevice')
    query.each do |device|
      result = device.Description.encode(Encoding.find('UTF-8'), {invalid: :replace, undef: :replace, replace: ''})
      break
    end
    result    
  end
end
