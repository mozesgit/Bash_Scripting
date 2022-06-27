#!/bin/bash

# THIS PROGRAM IS USED TO CHECK AND THE STATUS OF A SPECIFIED SERVICE
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
    
          read -p "Do you want to stop the $service_name [y/n[confirm]]:" agree

          if [ $agree == "y" ];then

              #Stopping the service
              systemctl stop $service_name
              clear
              echo "The $service_name service has been stopped"
          fi
          
     elif [ $check_service_status == "inactive" ];then
          
          echo "***************************************"
          echo "The $service_name service is not active"
          echo "***************************************"

          read -p "Do you want to start the service[y/n[confirm]]:" confirm

          if [ $confirm == "y" ];then
              
              echo "*************************************************************"
              echo "The $service_name service has been started now....wait for 5s"
              echo "*************************************************************"
              sleep 5
              clear

               #starting and checking the status for the service
               systemctl start $service_name
               systemctl status $service_name

               sleep 5
               clear

          else
            
            echo " ********************************************************"
            echo " Thanks for checking the status of $service_name service"
            echo " ********************************************************"
            systemctl status $service_name
            sleep 5 
            clear
         fi

       else

         echo "************************************************************"
         echo " Please install the package if the service is not available."
         echo "************************************************************"
   fi

}

#Invoki ng the function
read -p "Enter the service name to check the status:" name
service_control $name
