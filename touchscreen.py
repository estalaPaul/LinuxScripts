#!/usr/bin/env python
import subprocess
import re
props = str(subprocess.check_output(['xinput', 'list-props', 'ELAN Touchscreen']))
state = re.split('(Device Enabled)', props)
state = re.split('[(\\\\)t]', state[2])
if state[4]=='0':
    subprocess.run(['xinput','enable','ELAN Touchscreen'])
    subprocess.run(['notify-send','Touchscreen Enabled'])
elif state[4]=='1':
    subprocess.run(['xinput','disable','ELAN Touchscreen'])
    subprocess.run(['notify-send','Touchscreen Disabled'])
