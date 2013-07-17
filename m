Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzZHe-0000Yd-TR
 for ath10k@lists.infradead.org; Wed, 17 Jul 2013 21:29:15 +0000
Received: from [192.168.100.226] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r6HLSruP009566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 17 Jul 2013 14:28:53 -0700
Message-ID: <51E70C95.9030909@candelatech.com>
Date: Wed, 17 Jul 2013 14:28:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k:  Firmware crash when adding second station.
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

I managed to get wlan2 to associate and get DHCP after
removing the VAP interface from the configuration
and rebooting.

I then added a second station (sta0), and firmware
crashed again.  Maybe same place as the crash related
to deleting the VAP, if I understand the dump output
properly...

sta0: authenticate with 80:01:02:03:04:05
ath10k: Failed to add peer: 80:01:02:03:04:05 for VDEV: 1
sta0: send auth to 80:01:02:03:04:05 (try 1/3)
ath10k: firmware crashed!
ath10k: hardware name qca988x hw2.0 version 0x4100016c
ath10k: firmware version: 1.0.0.636
ath10k: target register Dump Location: 0x00401930
ath10k: target Register Dump
ath10k: [00]: 0x4100016C 0x00000000 0x0098B7DA 0x00000000
ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098B7DA
ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: tx not flushed
wlan2: Failed to send nullfunc to AP 80:01:02:03:04:05 after 1000ms, disconnecting
ath10k: Failed to delete peer: 80:01:02:03:04:05 for VDEV: 0


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
