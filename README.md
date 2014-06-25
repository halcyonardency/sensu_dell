# sensu_dell

This is a Sensu check (dell_check.rb) designed to verify status of several components of a dell server.  
This removes the need to have NRPE (Nagios) installedi and wrapping a Perl script which wraps openmanage. Yo dawg, I heard you like wrapping..

## Requirements

This requires Dell Openmanage is installed. The command omreport must be in your path, or you can set a default binary path within a json blob.  
Example: /etc/sensu/conf.d/dell_check.json
> { "dell_check": { "binpath":"/path/to/openmanage"} }

## Installation

Copy dell_check.rb to a friendly Sensu check execution path on all target assets.

<pre>
mkdir -p /etc/sensu/plugins/hardware/
cp dell_check.rb /etc/sensu/plugins/hardware/dell_check.rb
chmod 755 /etc/sensu/plugins/hardware/dell_check.rb
</pre>

## Check Example

For instance, create check /etc/sensu/conf.d/checks/dell_memory_check.json  

<pre>
 {
  "checks": {
    "dell_memory_check": {
     "command": "/etc/sensu/plugins/hardware/dell_check.rb --memory",
      "subscribers": [
        "linuxhost"
      ],
      "interval": 15
    }
  }
 }
</pre>

## Plugin details

This initial stab at a plugin using the periodic check method that is common in Nagios and Sensu.  We will eventually replace this for a local daemon that runs on an asset, and will send alarms directly through the client Sensu socket.  The framework for this daemon is forthcoming, but we'd like a local alarmbot that will listen to things like hardware events or syslog messages, and fire off notification on-demand rather than on a periodic schedule (push instead of poll).  We can add double-verification by including concurrent periodic polling as a point of parity with the push notifications.

### Items Verified

* storage, check the storage subsystem
* memory, check system memory (dimms)
* fans, check fan status
* power, check power supplies
* temperature, check chassis temperature sensors
* cpu, check processors 
* voltage, check chassis/systemboard voltage sensors
* batteries, check battery probes
* amperage, check power consumption
* intrusion, check for intrusion detection
* sdcard, check removable flash media (SD cards)
* alertlog, check alert log
* esmlog, check the ESM log (hardware log)
* esmhealth, check the ESM log overall health
* servicetag, check that the service tag is sane

#### Example Alarms

* Battery Warning
* Battery Failure
* Chassis Intrusion
* Current Probe Warning
* Current Probe Failure
* Fan Warning
* Fan Failure
* Memory Pre-failure
* Memory Failure
* System Power Probe Warning
* System Power Probe Detects A Failure
* Power Supply Warning
* Power Supply Failure
* Degraded Redundancy
* Lost Redundancy
* Temperature Warning
* Temperature Failure
* Voltage Warning
* Voltage Failure
* Processor Warning
* Processor Failure
* Hardware Log Warning
* Hardware Log Full
* Watchdog Asr
* Storage System Warning
* Storage System Failure
* Storage Controller Warning
* Storage Controller Failure
* Physical Disk Warning
* Physical Disk Failure
* Virtual Disk Warning
* Virtual Disk Failure
* Enclosure Warning
* Enclosure Failure
* Storage Controller Battery Warning
* Storage Controller Battery Failure

# License
   sensu_dell is released under the MIT license, [License](LICENSE.txt)  

