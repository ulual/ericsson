#!/usr/bin/env python
#This is a simple Python function that will open a text file and perform a find/replace, and save to a new text file.
#Created by: Christian Santos
#This scripts will take an input and save it into a file. The output will be a complete scripts in .mo format.

def replace_words(base_text, device_values):
    for key, val in device_values.items():
        base_text = base_text.replace(key, val)
    return base_text

# Here I’ll create an empty dictionary, and prompt the user to enter in the values

print ("#####################################################################")
print ("#            Scripting tool to RE-IP and LTE with DUL ver 01        #")
print ("#                Created by Victor Libunao                          #")
print ("#####################################################################")
print ("NOTE: This tool will create an output to RE-IP a LTE with DUL hardware.")

device = {}
device["$Site_name"] = input(" \nSite_name: ")
device["$Old_nmnet_default_gateway"] = input(" \nOld_nmnet_default_gateway: ")
device["$New_nmnet_default_gateway"] = input(" \nNew_nmnet_default_gateway: ")
device["$New_nmnet_IP"] = input(" \nNew_nmnet_IP: ")
device["$New_corenet_default_gateway"] = input(" \nNew_corenet_default_gateway: ")
device["$New_corenet_IP"] = input(" \nNew_corenet_IP: ")
device["$New_VLAN"] = input(" \nNew_VLAN: ")


# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh1 = open("L51_LLA02899D_Activate_Fallback_Timer.mo","r")
tempstr1 = fh1.read()
fh1.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr1, device)
outputfilename1 = "L51_" + device["$Site_name"] + "_Activate_Fallback_Timer.mo"
# Write out the new config file
fout = open(outputfilename1, "w")
fout.write(output)
fout.close()

# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh2 = open("L52_LLA02899D_NodeB_OAM_Cutover.mo","r")
tempstr2 = fh2.read()
fh2.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr2, device)
outputfilename2 = "L52_" + device["$Site_name"] + "_NodeB_OAM_Cutover.mo"
# Write out the new config file
fout = open(outputfilename2, "w")
fout.write(output)
fout.close()

# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh3 = open("L53_LLA02899D_CORENET_IPChange.mo","r")
tempstr3 = fh3.read()
fh3.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr3, device)
outputfilename3 = "L53_" + device["$Site_name"] + "_CORENET_IPChange.mo"
# Write out the new config file
fout = open(outputfilename3, "w")
fout.write(output)
fout.close()

# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh4 = open("L56_LLA02899D_DeActivate_FallBack_Timer.mo","r")
tempstr4 = fh4.read()
fh4.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr4, device)
outputfilename4 = "L56_" + device["$Site_name"] + "_Deactivate_FallBack_Timer.mo"
# Write out the new config file
fout = open(outputfilename4, "w")
fout.write(output)
fout.close()