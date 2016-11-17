#! /usr/bin/env bash

echo Please provide the following details on your lab environment.
echo
echo "What is the address of your Mantl Control Server?  "
echo "eg: control.mantl.internet.com"
read control_address
echo
echo "What is the username for your Mantl account?  "
read mantl_user
echo
echo "What is the password for your Mantl account?  "
read -s mantl_password
echo
echo "What is the Lab Application Domain?  "
read mantl_domain
echo


echo " "
echo "***************************************************"
echo "Installing the app as chronic-ucs-esx-analyzer"
curl -k -X POST -u $mantl_user:$mantl_password https://$control_address:8080/v2/apps \
-H "Content-type: application/json" \
-d @chronic_ucs_esx_analyzer.json \
| python -m json.tool

echo "***************************************************"
echo

echo Installed

echo "Wait 2-3 minutes for the service to deploy. "
echo "Then you can visit your application at:  "
echo
echo "http://imapex-chronic-ucs-esx-analyzer.$mantl_domain/"
echo
echo
echo "You can also watch the progress from the GUI at: "
echo
echo "https://$control_address/marathon"
echo


