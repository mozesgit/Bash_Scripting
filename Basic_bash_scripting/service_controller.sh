#!/bin/bash
#:'
#   AUTHOR :  MOSES CHIOKO
#   DATE :    29 JUNE 2022
#   PURPOSE : THIS PROGRAM IS USED TO CHECK AND CHANGE THE STATUS OF A SPECIFIED SERVICE
#             IF THE SERVICE IS NOT AVAILABLE THE USER HAS THE OPTION TO INSTALL THE PACKAGE(S)
#             FOR THE SERVICE VIA FIREFOX OR TERMINAL
#:'
function service_control()
{
    service_name=$1
    #Checking the status of the service
    check_service_status=$(systemctl status $service_name | sed -n '/Active/p'| awk '{print $2}')

    if [ $check_service_status == "active" ];then
          clear
          echo "**********************************************************"
          echo "The $service_name service is active that is up and running"
          echo "**********************************************************"
          sleep 3
          clear

          read -p "Do you want to stop or restart the $service_name [y/n[confirm]]:" agree

          if [ $agree == "y" ];then
              clear 
              
              echo "Select the option"
              select option in "stop" "restart"
              do
                case $option in
                   
                  "stop")
                    #Stopping the service
                    systemctl stop $service_name
                    clear
                    echo "The $service_name service has been stopped"
                    sleep 3
                    clear
                    break
                    ;;

                  "restart")
                    #Restarting the service
                    systemctl restart $service_name
                    clear
                    echo "The $service_name has been restarted"
                    sleep 3
                    clear
                    break
                    ;;
                  *)
                    echo "The option does not exit"
                esac
              done
            fi
            
            if [ $agree == "n" ];then
              clear
              echo "Thank you Bye!"
              sleep 3
              clear
            fi

     elif [ $check_service_status == "inactive" ];then
          clear
          echo "***************************************"
          echo "The $service_name service is not active"
          echo "***************************************"
          sleep 3
          clear
          read -p "Do you want to start the service[y/n[confirm]]:" confirm
          
          if [ $confirm == "y" ];then
              clear
              echo "*************************************************************"
              echo "The $service_name service has been started now....wait for 3s"
              echo "*************************************************************"
              sleep 3
              clear

               #starting and checking the status for the service
               systemctl start $service_name
               systemctl status $service_name
               sleep 3
               clear

               echo " ********************************************************"
               echo " Thanks for checking the status of $service_name service"
               echo " ********************************************************"
               sleep 4 
               clear
         fi

         if [ $confirm == "n" ];then
          clear
          echo "Thank you Bye!"
          sleep 3
          clear
         fi
     else

         echo "*************************************************************************************"
         echo " Please install the package for $service_name service not available."
         echo "**************************************************************************************"
         sleep 10 
         clear
         
         #This prompts the user to choose the linux distro running on the machine
         #Creating an array
       
         declare -a distros
         distros=("DEBIAN" "CENTOS" "FEDORA" "SUSE")
         
         echo "Select the linux distro running on your machine"

         select distro in ${distros[@]}
         do
             sleep 0
             clear
             case $distro in
               "DEBIAN")
                 echo "Install the package using:"
                 select tool in "FIREFOX" "TERMINAL"
                 do
                   case $tool in
                     "FIREFOX")
                       firefox
                       clear
                       break
                       ;;
                      "TERMINAL")
                        echo "wait for the command to be chipped in"
                        sleep 5
                        clear
                        break
                        ;;
                    esac
                 done
                break
                ;;

                "CENTOS")
                    echo "Install the package using:"
                    select tool in "FIREFOX" "TERMINAL"
                    do
                       case $tool in
                          "FIREFOX")
                            firefox
                            clear
                            break
                            ;;
                          "TERMINAL")
                            echo "wait for the command to be chipped in"
                            sleep 5
                            clear
                            break
                            ;;
                        esac
                   done
                   break
                   ;;
                   
                   "FEDORA")
                    echo "Install the package using:"
                    select tool in "FIREFOX" "TERMINAL"
                    do
                       case $tool in
                          "FIREFOX")
                            firefox
                            clear
                            break
                            ;;
                          "TERMINAL")
                            echo "wait for the command to be chipped in"
                            sleep 5
                            clear
                            break
                            ;;
                        esac
                   done
                   break
                   ;;
                   
                   "SUSE")
                    echo "Install the package using:"
                    select tool in "FIREFOX" "TERMINAL"
                    do
                       case $tool in
                          "FIREFOX")
                            firefox
                            clear
                            break
                            ;;
                          "TERMINAL")
                            echo "wait for the command to be chipped in"
                            sleep 5
                            clear
                            break
                            ;;
                        esac
                   done
                   break
                   ;;
               esac
         done
   fi

}
#Invoking the function
read -p "Enter the service name to check the status:" srv_name
service_control $srv_name
