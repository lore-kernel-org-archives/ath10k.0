Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yld58-0004oU-68
 for ath10k@lists.infradead.org; Fri, 24 Apr 2015 12:51:48 +0000
Received: by iget9 with SMTP id t9so28239638ige.1
 for <ath10k@lists.infradead.org>; Fri, 24 Apr 2015 05:51:23 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by mx.google.com with ESMTPSA id o15sm1447319igw.11.2015.04.24.05.51.21
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Fri, 24 Apr 2015 05:51:22 -0700 (PDT)
Received: from bob by hash with local (Exim 4.80)
 (envelope-from <me@bobcopeland.com>) id 1Yld4J-0002C1-H5
 for ath10k@lists.infradead.org; Fri, 24 Apr 2015 08:50:55 -0400
Date: Fri, 24 Apr 2015 08:50:55 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: attempting mesh on ath10k
Message-ID: <20150424125055.GA27722@localhost>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi all,

I have played around a little bit with the raw mode patches trying to
get mesh working on ath10k.  I've hacked the driver slightly to use an
AP vif in the firmware in "mesh" mode, which seems to produce proper looking
beacons over the air.

However, when I bring up a second mesh node, the ath10k device crashes
upon trying to send the first mesh peering action frame.  Here's what
dmesg looks like:

[   43.860000] ath10k_pci 0000:01:00.0: wmi event debug mesg len 140
[   44.310000] XXX trying to create peer 00:03:7f:10:4e:2d
[   44.310000] ath10k_pci 0000:01:00.0: wmi peer create vdev_id 0 peer_addr 00:03:7f:10:4e:2d
[   44.320000] XXX sending WMI cmd 36892
[   44.320000] XXX sending WMI cmd nowait 36892
[   44.330000] XXX waiting for peer create 00:03:7f:10:4e:2d
[   44.330000] XXX peer 00:03:7f:10:4e:2d added
[   44.340000] ath10k_pci 0000:01:00.0: wmi peer assoc vdev 0 addr 00:03:7f:10:4e:2d (new)
[   44.350000] XXX sending WMI cmd 36896
[   44.350000] XXX sending WMI cmd nowait 36896
[   44.350000] ath10k_pci 0000:01:00.0: received event id 36891 not implemented
[   44.360000] mesh: sending popen to 00:03:7f:10:4e:2d
[   44.380000] ath10k_pci 0000:01:00.0: wmi mgmt tx skb 86fb4e40 len 84 ftype 00 stype d0
[   44.390000] XXX sending WMI cmd 36905
[   44.390000] XXX sending WMI cmd nowait 36905
[   44.390000] ath10k_pci 0000:01:00.0: firmware crashed! (uuid 839037ff-ad03-4442-9114-f99e03204c
[   44.400000] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.2-00082-4-2 a
[   44.410000] ath10k_pci 0000:01:00.0: debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
[   44.420000] ath10k_pci 0000:01:00.0: firmware register dump:
[   44.430000] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3 0x009A98BE 0x00955B31
[   44.440000] ath10k_pci 0000:01:00.0: [04]: 0x009A98BE 0x00060330 0x0000001E 0x00000B00
[   44.440000] ath10k_pci 0000:01:00.0: [08]: 0x00447730 0x009C3014 0x00446970 0x00000078
[   44.450000] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00958360 0x0095836B
[   44.460000] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x009A6CCF 0x00000000 0x00000000
[   44.470000] ath10k_pci 0000:01:00.0: [20]: 0x409A98BE 0x0040AB14 0x0040FAA8 0x0043E677
[   44.480000] ath10k_pci 0000:01:00.0: [24]: 0x809A9958 0x0040AB74 0x0043E7CC 0xC09A98BE
[   44.480000] ath10k_pci 0000:01:00.0: [28]: 0x8099F2E9 0x0040AB94 0x009C3014 0x0040AD04
[   44.490000] ath10k_pci 0000:01:00.0: [32]: 0x8098933F 0x0040ABB4 0x0043D0D8 0x0040AD04
[   44.500000] ath10k_pci 0000:01:00.0: [36]: 0x809B38C0 0x0040ABD4 0x009C3014 0x0043D0D8
[   44.510000] ath10k_pci 0000:01:00.0: [40]: 0x809AFD68 0x0040AD94 0x00400000 0x00416688
[   44.520000] ath10k_pci 0000:01:00.0: [44]: 0x809BDA75 0x0040ADE4 0x0040AE08 0x00411D44
[   44.520000] ath10k_pci 0000:01:00.0: [48]: 0x809486FA 0x0040AE04 0x00000001 0x00000000
[   44.530000] ath10k_pci 0000:01:00.0: [52]: 0x80948E2C 0x0040AEA4 0x0041E424 0x00412350
[   44.540000] ath10k_pci 0000:01:00.0: [56]: 0x809BCF0D 0x0040AEC4 0x0041E424 0x00000001

My hacky compat-wireless snapshot is over here, any suggestions on what to
try next to debug further are welcome:

    https://github.com/bcopeland/ath10k-mesh

[Also I tried skipping the mgmt tx datapath and use normal datapath,
as seen in the final patch, but that doesn't change things, it crashes
either way.]

Maybe I'm not setting up peers correctly or something like that?

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
