#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess as sub
import re


acpi = sub.getoutput("acpi")

status = str(re.findall("(\w+), (\d+)", acpi)[0][0])
percent = int(re.findall("(\w+), (\d+)", acpi)[0][1])
full_text = (str(percent) + "%")

#if status == 'Discharging':
#    full_text += ' DIS'
#elif status == 'Charging':
#    full_text += ' CHR'

#if status == 'Discharging':
#    full_text += ' '
#elif status == 'Charging':
#    full_text += ' '

short_text = full_text

if re.findall("\d\d:\d\d", acpi):
    full_text += " " + re.findall("\d\d:\d\d", acpi)[0]

if percent <= 5:
    short_text += "   "
elif percent <= 25:
    short_text += "   "
elif percent <= 50:
    short_text += "   "
elif percent <= 75:
    short_text += "   "
elif percent <= 100:
    short_text += "   "

# print text
#print (full_text)
print (short_text)

