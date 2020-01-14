from scapy.all import *
from scapy.layers.inet import * 
from scapy.sendrecv import sr, sr1
import pyfiglet
import socket
import sys
banner_ver = pyfiglet.figlet_format("SCRIPT DE VERIFICAR COXEXAO")
print(banner_ver)

host = sys.argv[1:]
if len(sys.argv)!=2:
    print("exemplo de uso pacote.py + ip")
    sys.exit(1)

banner_scan = pyfiglet.figlet_format("PORTSCAN")
print(banner_scan)

for ports in range(80,81):
    
                        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

                        if s.connect_ex((sys.argv[1], ports)) == 0:

                                   print ("porta aberta: ",ports)
                        else:
                                   print("porta fechada: ",ports)

                                   #s.close()



banner = pyfiglet.figlet_format("TRECEROUTE")
print(banner)
traceroute(host, maxttl=15)