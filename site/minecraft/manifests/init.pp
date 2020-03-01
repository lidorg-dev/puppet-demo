class minecraft {
 file {'/opt/minecraft':
   ensure => directory
   }
   package {'wget':
   ensure => present,
   }
   exec {'wget http://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar -o /opt/minecraft/minecraft_server.jar':
       path     => '/usr/bin:/usr/sbin:/bin',
       provider => shell,
     }
     
   package {'java-1.8.0-openjdk':
     ensure => present,
     }
     
   file {'/opt/minecraft/eula.txt':
     ensure => file,
     content => 'eula=true'
   }  
   
   file {'/etc/systemd/system/minecraft.service':
      ensure => file,
      source => 'puppet:///modules/minecraft/minecraft.service',
      mode => 777,
      }
      
   service {'minecraft':
     ensure => running,
     enable => true,
     }
}
