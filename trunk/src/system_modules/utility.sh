#
# Utility Functions Module
#
# Author: Leg3nd @ https://leg3nd.me
#

# Cleanup Function
trap 'cleanup' 2
function cleanup(){
  echo -e "\n\e[01;34m[>]\e[00m Cleaning up..."
  
  # Remove Files
  rm /tmp/injectme.txt > /dev/null 2>&1
  rm /tmp/deauth* > /dev/null 2>&1
  rm /tmp/msfrc > /dev/null 2>&1
  rm /tmp/x86.powershell.alnum > /dev/null 2>&1
  rm /tmp/x64.powershell.alnum > /dev/null 2>&1
  rm -rf ${java_www} > /dev/null 2>&1
  rm -rf ${javaapplet_www} > /dev/null 2>&1
  rm -rf ${fakeupdate_www} > /dev/null 2>&1
  rm -rf ${clickjack_www} > /dev/null 2>&1
  rm /tmp/jasagerpwn_modules.tmp > /dev/null 2>&1
  
  # Kill Processes and Services
  xterm -geometry 75x10+464+446 -bg black -fg green -T "[JasagerPwn] v${version}" -e "kill -9 ${pid_mdk3} > /dev/null 2>&1" > /dev/null 2>&1
  xterm -geometry 75x10+464+446 -bg black -fg green -T "[JasagerPwn] v${version}" -e "killall -9 aireplay-ng > /dev/null 2>&1 ; kill -9 ${pid_deauth} > /dev/null 2>&1" > /dev/null 2>&1
  service apache2 stop > /dev/null 2>&1
  
  # Clear our IPtables
  iptables -F ; iptables -X  ; iptables -F -t nat ; iptables -X -t nat
  
  echo -e "\e[01;34m[>]\e[00m Exiting Gracefully.."
  exit 1
}

# Print help
function help(){
 
 echo "
 JasagerPwn[Reborn] Pineapple Attack Vector Script
      - Version ${version} - Revision ${rev} -
      
 (C)opyright 2013 Leg3nd @ www.https://leg3nd.me

  Usage: bash jasagerPwn 

  Options:
   -? / -h    :  Help Screen and Switches. More Information In top of script.
   -i         :  Pineapple Interface [EG: wlan0]
   -m         :  Mac Payload (.pkg) [For Fake Update]
   -w         :  Windows Payload (.exe) [ For Fake Update / Java Injection]
"
   exit 1
}

# Run command on remote pineapple
function pineapple_command(){
  echo -e "\n\e[01;34m[>]\e[00m Running Command on Pineapple: ${command}"
#   xterm -hold -geometry 75x8+100+0 -T "Pineapple Command" -e "sshpass -p ${pineapple_password} ssh -o StrictHostKeyChecking=no root@${pineapple_ip} '${command}'"  
  xterm -geometry 75x8+100+0 -T "Pineapple Command" -e "sshpass -p ${pineapple_password} ssh -o StrictHostKeyChecking=no root@${pineapple_ip} '${command}'"
}