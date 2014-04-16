Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaMfT-0007mq-Ip
 for ath10k@lists.infradead.org; Wed, 16 Apr 2014 10:02:11 +0000
Received: by mail-vc0-f169.google.com with SMTP id ik5so10819047vcb.0
 for <ath10k@lists.infradead.org>; Wed, 16 Apr 2014 03:01:49 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Apr 2014 18:01:49 +0800
Message-ID: <CAEFj987O5CJtdO37FZOsYDgja9YrCEt-Uxka2FYHAx86WPbwbQ@mail.gmail.com>
Subject: Firmware 636 crashed with 4addr
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, all

Anyone knows the reason of the following firmware crashed whenever the
managed interface is set with 4addr on and bridged to a bridge
interface.

ifconfig br-lan up
iw wlan0 set 4addr on
brctl addif br-lan wlan0
[   78.130000] device wlan0 entered promiscuous mode
[   78.130000] br-lan: port 1(wlan0) entered forwarding state
[   78.140000] br-lan: port 1(wlan0) entered forwarding state
[   79.140000] ath10k: firmware crashed!
[   79.150000] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[   79.150000] ath10k: firmware version: 999.999.0.636
[   79.160000] ath10k: target register Dump Location: 0x0040AC14
[   79.170000] ath10k: target Register Dump
[   79.170000] ath10k: [00]: 0x4100016C 0x00000000 0x009C4521 0x00000000
[   79.180000] ath10k: [04]: 0x009C4521 0x00060530 0x00000019 0x00955A00
[   79.180000] ath10k: [08]: 0x00014855 0x00000000 0x0040CC94 0x00000020
[   79.190000] ath10k: [12]: 0x00000000 0x00000000 0x00958360 0x0095836B
[   79.200000] ath10k: [16]: 0x80991091 0x0040AD94 0x0042EADC 0x00000000
[   79.200000] ath10k: [20]: 0x0000FFFF 0x00000000 0x00000045 0x004340C0
[   79.210000] ath10k: [24]: 0x809A0978 0x0040AD94 0x00439304 0x052157C7
[   79.220000] ath10k: [28]: 0x809AD1A2 0x0040ADE4 0x00439304 0x0043F8BC
[   79.220000] ath10k: [32]: 0x00000001 0x00000018 0x00000000 0x0042F664
[   79.230000] ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
[   79.230000] ath10k: [40]: 0x00000000 0x00000000 0x00000045 0x00412700
[   79.240000] ath10k: [44]: 0x00439C00 0x00000000 0x00000000 0x00400000
[   79.250000] ath10k: [48]: 0x809AE0B4 0x0040AE04 0x00400000 0x0043F8BC
[   79.250000] ath10k: [52]: 0x00000001 0x00000000 0x004231F0 0x00400000
[   79.260000] ath10k: [56]: 0x809AE17E 0x0040AE44 0x0040FE6C 0x0040D310
[   82.270000] ath10k: failed to to request monitor vdev 1 stop: -11
[   87.270000] ath10k: failed to synchronise monitor vdev 1: -145
[   87.270000] ath10k: failed to stop monitor vdev: -145
[   90.280000] ath10k: failed to request wmi monitor vdev 1 removal: -11
[   90.280000] ath10k: failed to delete monitor vdev: -11

Further investigation shows that this is not happening to firmware
10.1.467.2-1.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
