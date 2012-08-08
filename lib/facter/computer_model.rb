Facter.add(:computer_model) do
  confine :operatingsystem => :windows
  setcode do
    result = ''
    require 'win32ole'
    wmi = WIN32OLE.connect('winmgmts:')
    query = wmi.ExecQuery('select Model from Win32_Computersystem')
    query.each do |computer|
      result = computer.Model
    end
    result
  end
end