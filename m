Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQ0ZA-00072R-Ea
 for ath10k@lists.infradead.org; Fri, 05 Sep 2014 20:57:09 +0000
Received: by mail-lb0-f174.google.com with SMTP id n15so4532857lbi.5
 for <ath10k@lists.infradead.org>; Fri, 05 Sep 2014 13:56:45 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 5 Sep 2014 13:56:45 -0700
Message-ID: <CABnBrYV4Lh7EF9xaEK6zkPk0HhU=iP283WhH+wA9=i7XfHroGg@mail.gmail.com>
Subject: Firmware crash w/ 10.2 diagnosis?
From: Denton Gentry <denton.gentry@gmail.com>
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

Can anyone tell me what this firmware crash means?
I don't have steps to reproduce it, it seems to happen randomly. The
clients are mostly idle.

[Fri Sep  5 11:37:08 2014] ath10k: firmware crashed!
[Fri Sep  5 11:37:08 2014] ath10k: hardware name qca988x hw2.0 version
0x4100016c
[Fri Sep  5 11:37:08 2014] ath10k: firmware version: 10.2-00082-4-2
[Fri Sep  5 11:37:08 2014] ath10k: target register Dump Location: 0x0040AA34
[Fri Sep  5 11:37:08 2014] ath10k: target Register Dump
[Fri Sep  5 11:37:08 2014] ath10k: [00]: 0x4100016C 0x00000000
0x00949FF9 0x803044BE
[Fri Sep  5 11:37:08 2014] ath10k: [04]: 0x00949FF9 0x00060730
0x00000015 0x00000002
[Fri Sep  5 11:37:08 2014] ath10k: [08]: 0x00425BD0 0x803044BE
0x00000000 0x00000000
[Fri Sep  5 11:37:08 2014] ath10k: [12]: 0x00000009 0xFFFFFFFF
0x00958360 0x0095836B
[Fri Sep  5 11:37:08 2014] ath10k: [16]: 0x00958080 0x009BD000
0x00000000 0x00000000
[Fri Sep  5 11:37:08 2014] ath10k: [20]: 0x40949FF9 0x0040AB44
0x00000000 0x0043AC74
[Fri Sep  5 11:37:08 2014] ath10k: [24]: 0x8099519C 0x0040ABA4
0x00000F40 0xC0949FF9
[Fri Sep  5 11:37:08 2014] ath10k: [28]: 0x8099861D 0x0040ABC4
0x00424B2C 0x00439E64
[Fri Sep  5 11:37:08 2014] ath10k: [32]: 0x80998802 0x0040AD14
0x00000000 0x0042DD18
[Fri Sep  5 11:37:08 2014] ath10k: [36]: 0x80998704 0x0040AD44
0x0042DD18 0x00000002
[Fri Sep  5 11:37:08 2014] ath10k: [40]: 0x80998830 0x0040AD74
0x00439EC4 0x0042DD18
[Fri Sep  5 11:37:08 2014] ath10k: [44]: 0x809970B2 0x0040AD94
0x00439EC4 0x00000002
[Fri Sep  5 11:37:08 2014] ath10k: [48]: 0x80998EF5 0x0040ADB4
0x0041FA54 0x00425760
[Fri Sep  5 11:37:08 2014] ath10k: [52]: 0x809BCF0D 0x0040AEE4
0x004245FC 0x00000002
[Fri Sep  5 11:37:08 2014] ath10k: [56]: 0x80940F18 0x0040AF14
0x00000005 0x004039E4
[Fri Sep  5 11:37:13 2014] ath10k: failed to synchronise monitor vdev 1: -110
[Fri Sep  5 11:37:13 2014] ath10k: failed to stop monitor vdev: -110
[Fri Sep  5 11:37:16 2014] ath10k: failed to request wmi monitor vdev
1 removal: -11
[Fri Sep  5 11:37:16 2014] ath10k: failed to delete monitor vdev: -11
[Fri Sep  5 11:37:19 2014] ath10k_wmi_vdev_start_restart: dtim_period=0
[Fri Sep  5 11:37:19 2014] ath10k: peer 88:dc:96:XX:XX:XX on vdev 0
already exists
[Fri Sep  5 11:37:19 2014] ath10k: failed to add peer
88:dc:96:XX:XX:XX for vdev 0 when changing bssid: -22
[Fri Sep  5 11:37:19 2014] ath10k_wmi_vdev_start_restart: dtim_period=0
[Fri Sep  5 11:37:20 2014] ath10k: device successfully recovered

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
