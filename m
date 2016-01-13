Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJM7e-00036c-UQ
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 14:10:04 +0000
Received: by mail-io0-x242.google.com with SMTP id q21so30758934iod.3
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 06:09:41 -0800 (PST)
Received: from [192.168.2.80] (71-13-242-29.dhcp.ftbg.wi.charter.com.
 [71.13.242.29])
 by smtp.gmail.com with ESMTPSA id 90sm953363iot.41.2016.01.13.06.09.40
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 13 Jan 2016 06:09:40 -0800 (PST)
From: John Detter <john@detter.com>
Subject: [ath10K] QCA6174 firmware
Message-ID: <56965AA3.2020708@detter.com>
Date: Wed, 13 Jan 2016 08:09:39 -0600
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello everyone,

I recently bought a laptop (Samsung) that has a Qualcomm Atheros QCA6174 
card. I have tried using the firmware from both kvalo's repo and the 
official linux-firmware repo and neither of them have worked. I am 
running a fresh Ubuntu 15.10 installation (Linux 4.2.0). I have also 
tried installing Ubuntu Gnome 15.10 with the mainline kernel build 
(Linux 4.4.0) and that didn't work either. The laptop I'm using does 
have a button on the keyboard to enable/disable the wifi and I'm not 
sure if it's causing an issue or not. I have checked rfkill list and 
there is neither a hard nor soft block on the wlan. I'm not really sure 
where to go from here, any help would be much appreciated!

Thanks for your time,

- John

Directory structure when I tried firmware from linux-firmware:

root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# pwd
/lib/firmware/ath10k/QCA6174/hw3.0
root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# ls -al
total 744
drwxr-xr-x 4 root root   4096 Jan 13 07:41 .
drwxr-xr-x 4 root root   4096 Jan 13 07:39 ..
-rw-r--r-- 1 root root   8124 Jan 13 07:38 board.bin
lrwxrwxrwx 1 root root     11 Jan 13 07:41 
board-pci-168c:003e:144d:412f.bin -> ./board.bin
-rw-r--r-- 1 root root 733784 Jan 13 07:39 firmware-4.bin
lrwxrwxrwx 1 root root     16 Jan 13 07:40 firmware-5.bin -> 
./firmware-4.bin

Directory structure when I tried kvalo's firmware:

root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0# pwd
/lib/firmware/ath10k/QCA6174/hw3.0
root@Ubuntu-15:/lib/firmware/ath10k/QCA6174/hw3.0/new# ls -al
total 844
drwxr-xr-x 2 root root   4096 Jan 13 07:31 .
drwxr-xr-x 4 root root   4096 Jan 13 07:41 ..
-rw-r--r-- 1 root root  24692 Jan 13 07:17 board-2.bin
-rw-r--r-- 1 root root   8124 Jan 13 07:17 board.bin
lrwxrwxrwx 1 root root     11 Jan 13 07:17 
board-pci-168c:003e:144d:412f.bin -> ./board.bin
-rw-r--r-- 1 root root 733784 Jan 13 07:17 
firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1
lrwxrwxrwx 1 root root     44 Jan 13 07:18 firmware-5.bin -> 
firmware-4.bin_WLAN.RM.2.0-00180-QCARMSWPZ-1
-rw-r--r-- 1 root root  79801 Jan 13 07:17 
notice.txt_WLAN.RM.2.0-00180-QCARMSWPZ-1


Here is the relevant part of my dmesg log:

jdetter@Ubuntu-15:~$ dmesg | grep ath10
[    6.789911] ath10k_pci 0000:3b:00.0: enabling device (0000 -> 0002)
[    6.791752] ath10k_pci 0000:3b:00.0: pci irq msi-x interrupts 8 
irq_mode 0 reset_mode 0
[    7.009504] ath10k_pci 0000:3b:00.0: Direct firmware load for 
ath10k/cal-pci-0000:3b:00.0.bin failed with error -2
[    9.145690] ath10k_pci 0000:3b:00.0: qca6174 hw3.2 (0x05030000, 
0x00340aff, 168c:003e:144d:412f) fw WLAN.RM.2.0-00180-QCARMSWPZ-1 api 5 
htt 3.26 wmi 4 cal otp max_sta 32
[    9.145694] ath10k_pci 0000:3b:00.0: debug 0 debugfs 1 tracing 1 dfs 
0 testmode 0
[   10.144947] ath10k_pci 0000:3b:00.0: suspend timed out - target pause 
event never came
[   13.219455] ath10k_pci 0000:3b:00.0 wlp59s0: renamed from wlan0
[   18.479782] ath10k_pci 0000:3b:00.0: failed to enable dynamic BW: -11
[   21.479376] ath10k_pci 0000:3b:00.0: could not suspend target (-11)
[   29.770121] ath10k_pci 0000:3b:00.0: failed to enable dynamic BW: -11
[   32.769665] ath10k_pci 0000:3b:00.0: could not suspend target (-11)

Here is my lspci and lshw output:

jdetter@Ubuntu-15:~$ lspci | grep QCA
3b:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless 
Network Adapter (rev 32)

root@Ubuntu-15:~# lshw
...
         *-pci:2
              description: PCI bridge
              product: Sunrise Point-H PCI Express Root Port #9
              vendor: Intel Corporation
              physical id: 1d
              bus info: pci@0000:00:1d.0
              version: f1
              width: 32 bits
              clock: 33MHz
              capabilities: pci pciexpress msi pm normal_decode 
bus_master cap_list
              configuration: driver=pcieport
              resources: irq:16 memory:ed200000-ed3fffff
            *-network DISABLED
                 description: Wireless interface
                 product: QCA6174 802.11ac Wireless Network Adapter
                 vendor: Qualcomm Atheros
                 physical id: 0
                 bus info: pci@0000:3b:00.0
                 logical name: wlp59s0
                 version: 32
                 serial: b8:86:87:c7:2d:a9
                 width: 64 bits
                 clock: 33MHz
                 capabilities: pm msi pciexpress bus_master cap_list 
ethernet physical wireless
                 configuration: broadcast=yes driver=ath10k_pci 
driverversion=4.2.0-23-generic firmware=WLAN.RM.2.0-00180-QCARMSWPZ-1 
latency=0 link=no multicast=yes wireless=IEEE 802.11abgn
                 resources: irq:319 memory:ed200000-ed3fffff
...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
