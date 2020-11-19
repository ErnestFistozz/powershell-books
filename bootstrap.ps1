# download chef client
$download_url = 'http://dump.dfl.nednet.co.za/oldies/archives/chef/chef-client-14.11.21-1-x64.msi'
(New-Object System.Net.WebClient).DownloadFile($download_url, 'C:\\Windows\\Temp\\chef.msi')

# install chef client
Start-Process 'msiexec' -ArgumentList '/qb /i C:\\Windows\\Temp\\chef.msi' -NoNewWindow -Wait

# download cert store
$download_url = 'http://dump.dfl.nednet.co.za/oldies/archives/certs/cacert.pem'
(New-Object System.Net.WebClient).DownloadFile($download_url, 'C:\\opscode\\chef\\embedded\\ssl\\certs\\cacert.pem')

# tell chef to use rubygems mirror
new-item c:\chef\client.d -itemtype directory
Set-Content -Value "rubygems_url 'https://nexus.nednet.co.za/repository/repo-rubygems-proxy/'" -Path c:\chef\client.d\rubygems.rb

