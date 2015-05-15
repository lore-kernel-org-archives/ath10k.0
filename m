Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtCX3-0001oV-20
 for ath10k@lists.infradead.org; Fri, 15 May 2015 10:07:54 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 84FD925A3DCF
 for <ath10k@lists.infradead.org>; Fri, 15 May 2015 12:07:17 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lp5513KQgz5vMp
 for <ath10k@lists.infradead.org>; Fri, 15 May 2015 12:07:14 +0200 (CEST)
Message-ID: <5555C551.5090508@posteo.org>
Date: Fri, 15 May 2015 12:07:13 +0200
From: Brummfax <brummfax@posteo.org>
MIME-Version: 1.0
Subject: ath20k blocks other devices
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

Hi everybody,

I bought a new Acer Aspire VN7-571G for my parents. As the new QCA6174
Qualcomm Atheros Wifi/bluetooth (also known as QCNFA344) device is in
use, I could not use Wifi with the usual Ubuntu 15.04 installation.
Following
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1383184/comments/115 I
compiled the new kernel with the ath10k driver and everything worked
nicely at home with my Fritzbox 7490 router using the 5GHz band. At my
parents place with a Fritzbox 3170 router I encounter the following
problem. As soon as Ubuntu is connected to Wifi (using the 2,4 GHz band
as there is no 5GHz band), other devices cannot connect to Wifi anymore.
The ath10k driver blocks all other devices (Smartphones running Android,
iPads) except for my personal laptop with a standard Ubuntu 14.10 system
which can connect to Wifi for a couple of minutes before being
disconnected as well. I can connect again but  will loose the connection
after a couple of minutes. I've also installed Windows 8.1 on the Acer
Aspire, and if I connect to Wifi using Windows, these problems
disappear, i.e. all other devices can also connect to Wifi without any
problems. I've also not seen these problems at home which could be
related to the fact that the Acer Aspire was using the 5GHz band while
the other devices where using the 2,4GHz band.


Running "cat /var/log/syslog | grep ath10k" after installation, I got 3
errors because of missing firmware:
/lib/firmware/ath10k/QCA6174/hw2.1/board-pci-168c:003e:105b:e08e.bin
/lib/firmware/ath10k/QCA6174/hw2.1/firmware-5.bin
lib/firmware/ath10k/cal-pci-0000:03:00.0.bin

The first two messages disappeared after running
sudo cp board.bin  board-pci-168c:003e:105b:e08e.bin
sudo cp firmware-4.bin firmware-5.bin
in the /lib/firmware/ath10k/QCA6174/hw2.1-directory. I could even delete
board.bin and firmware-4.bin without loosing Wifi connectivity. At the
moment these files are still there, but seem to be useless. Nevertheless
"modinfo ath10k_pci" shows that only board.bin and firmware-4.bin from
the hw2.1-directory are used. Very strange! I use the firmware extracted
from my Windows installation using firmware provided by Acer's support
page.


Any help would be appreciated!
Best wishes,
Sven


PS: Bluetooth is still not working even though its turned on and shown
as active. But I can't send or receive files.
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
