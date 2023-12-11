# File: client.py
# Author: Amey More

# Description: This python script runs as mqtt client to send sensor

# Reference:
# https://github.com/eclipse/paho.mqtt.python
# https://github.com/cu-ecen-aeld/buildroot-assignments-base/blob/9648e6530170935479d6e8cd86a845a177529c0f/base_external/rootfs_overlay/bin/MQTT/Client-Publisher.py

#Importing Modules
try:
	import paho
	import sys
	import paho.mqtt.client as mqtt
#Error checking for module import
except Exception as e:
	print(e)

#port is the network port of the server host to connect to.
Port=1883
# Maximum period in seconds between communications with the broker.
Keepalive=60
try:
	print("Health Monitoring System Client")
	# Client Constructor
	client = mqtt.Client()

	#IP address of the remote broker accepting 
	#from command line argument.
	sensor_str =  sys.argv[-1] 
	IP_Address = "192.168.45.51"

	#Connect to a remote broker.
	client.connect(IP_Address,Port,Keepalive)

	#Publish a message on a topic.
	#This causes a message to be sent to the broker
	client.publish("topic/healthmonitoringsystem",sensor_str);
	
#Error Checking for script. 
except Exception as e:
	print(e)

