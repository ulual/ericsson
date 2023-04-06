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
print ("#            Scripting tool to RE-IP and LTE with BB ver 01        #")
print ("#                Created by Victor Libunao                          #")
print ("#####################################################################")
print ("NOTE: This tool will create an output to RE-IP a LTE with BB hardware.")

device = {}
device["$Site_name"] = input(" \nSite_name: ")
device["$New_nmnet_default_gateway"] = input(" \nNew_nmnet_default_gateway: ")
device["$New_nmnet_IP"] = input(" \nNew_nmnet_IP: ")
device["$New_corenet_default_gateway"] = input(" \nNew_corenet_default_gateway: ")
device["$New_corenet_IP"] = input(" \nNew_corenet_IP: ")
device["$Old_VLAN"] = input(" \nOld_VLAN: ")
device["$New_VLAN"] = input(" \nNew_VLAN: ")


# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh1 = open("L01_LIE24895B_Corenet_Change_runx.mo","r")
tempstr1 = fh1.read()
fh1.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr1, device)
outputfilename1 = "L01_" + device["$Site_name"] + "_Corenet_Change_runx.mo"
# Write out the new config file
fout = open(outputfilename1, "w")
fout.write(output)
fout.close()

# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh2 = open("L02_LIE24895B_OAM_Change_run1.mo","r")
tempstr2 = fh2.read()
fh2.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr2, device)
outputfilename2 = "L02_" + device["$Site_name"] + "_OAM_Change_run1.mo"
# Write out the new config file
fout = open(outputfilename2, "w")
fout.write(output)
fout.close()

# Open your desired file as ‘t’ and read the lines into string ‘tempstr’
fh3 = open("L03_LIE24895B_Deactivate_Fallback_runx.mo","r")
tempstr3 = fh3.read()
fh3.close()
# Using the "replace_words" function, we’ll pass in our tempstr to be used as the base,
# and our device_values to be used as replacement.
output = replace_words(tempstr3, device)
outputfilename3 = "L03_" + device["$Site_name"] + "_Deactivate_Fallback_runx.mo"
# Write out the new config file
fout = open(outputfilename3, "w")
fout.write(output)
fout.close()