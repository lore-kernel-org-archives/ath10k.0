Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS4SR-000491-GD
 for ath10k@lists.infradead.org; Tue, 05 Nov 2019 19:25:41 +0000
Received: by mail-ot1-x341.google.com with SMTP id 94so18624445oty.8
 for <ath10k@lists.infradead.org>; Tue, 05 Nov 2019 11:25:37 -0800 (PST)
MIME-Version: 1.0
From: Goran Sustek <gsustek@gmail.com>
Date: Tue, 5 Nov 2019 20:25:26 +0100
Message-ID: <CAFweJaPHmQORJARFTrONWE9-+eZ-9M8tXnw1oG9iu3-S46Pbgw@mail.gmail.com>
Subject: Unable to set Transmit Packet Steering "xps_cpus"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi, i have unusual issue setting Transmit Packet steering.


Hardware (NIC chipset, platform, etc)
NIC: Compex COMPEX WLE1216V5-20 5GHz
Platform: KANSUNG Model: K515G6
(https://bit.ly/2IOlSeQ 1)

system: ubuntu eaon latest update
driver: latest  ath10k , any firmware ,board-bin

root@gs-Default-string:/home/gs# ls -lrt
/sys/class/net/wlp6s0/queues/tx-0/xps_cpus
-rw-r--r-- 1 root root 4096 stu 4 17:03
/sys/class/net/wlp6s0/queues/tx-0/xps_cpus
root@gs-Default-string:/home/gs# cat /sys/class/net/wlp6s0/queues/tx-0/xps_cpus
cat: /sys/class/net/wlp6s0/queues/tx-0/xps_cpus: No such file or directory
root@gs-Default-string:/home/gs#

root@gs-Default-string:/home/gs# ls -lrt /sys/class/net/
total 0
lrwxrwxrwx 1 root root 0 stu 4 16:50 lo -> ../../devices/virtual/net/lo
lrwxrwxrwx 1 root root 0 stu 4 16:50 enp5s0 ->
../../devices/pci0000:00/0000:00:1c.4/0000:05:00.0/net/enp5s0
lrwxrwxrwx 1 root root 0 stu 4 16:50 enp4s0 ->
../../devices/pci0000:00/0000:00:1c.3/0000:04:00.0/net/enp4s0
lrwxrwxrwx 1 root root 0 stu 4 16:50 enp3s0 ->
../../devices/pci0000:00/0000:00:1c.2/0000:03:00.0/net/enp3s0
lrwxrwxrwx 1 root root 0 stu 4 16:50 enp2s0 ->
../../devices/pci0000:00/0000:00:1c.1/0000:02:00.0/net/enp2s0
lrwxrwxrwx 1 root root 0 stu 4 16:50 enp1s0 ->
../../devices/pci0000:00/0000:00:1c.0/0000:01:00.0/net/enp1s0
lrwxrwxrwx 1 root root 0 stu 4 16:50 wlp6s0 ->
../../devices/pci0000:00/0000:00:1d.0/0000:06:00.0/net/wlp6s0
root@gs-Default-string:/home/gs#


Regards,

Goran.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
