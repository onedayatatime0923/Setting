import usb1
from os import path
from subprocess import check_call, CalledProcessError

vendor_id = 0x044f
device_list = [
        [0xb67e, {'request_type':0x41, 'request':83, 'value':0x0001, 'index':0x0000, 'data':b''}, 0xb65d], 
        [0xb65d, {'request_type':0x41, 'request':83, 'value':0x0007, 'index':0x0000, 'data':b''}, 0xb67f]]
jscal = '6,1,0,32505,32505,16574,2049063,1,0,519,519,1036399,1067305,1,0,512,512,1050596,1054724,1,0,511,511,1050596,1048544,1,0,0,0,536854528,536854528,1,0,0,0,536854528,536854528'

# Send all control packets for initialization
_context = usb1.USBContext()

handle = _context.openByVendorIDAndProductID(vendor_id, device_list[-1][2])
if handle is None:
    for device in device_list:
        handle = _context.openByVendorIDAndProductID(vendor_id, device[0])
        #  print("id product: {}".format(device[0]))
        #  print(handle)
        #  input()
        handle.setAutoDetachKernelDriver(True)
        handle.claimInterface(0)

        # Send control packet that will switch modes
        try:
            handle.controlWrite(
                device[1]['request_type'],
                device[1]['request'],
                device[1]['value'],
                device[1]['index'],
                device[1]['data'],
            )
        except usb1.USBErrorIO: pass
        while True:
            handle = _context.openByVendorIDAndProductID(vendor_id, device[2])
            if handle is not None:
                break

dev_path = '/dev/input/by-id/usb-Thrustmaster_Thrustmaster_TMX_Racing_Wheel-joystick'
while not path.islink(dev_path): pass
check_call(['jscal', '-s', jscal, dev_path])



