Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzZA1-0000Np-Tj
 for ath10k@lists.infradead.org; Wed, 17 Jul 2013 21:21:22 +0000
Received: from [192.168.100.226] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r6HLKqWg008929
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 17 Jul 2013 14:20:52 -0700
Message-ID: <51E70AB4.7080307@candelatech.com>
Date: Wed, 17 Jul 2013 14:20:52 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k:  Firmware crash after removing VAP
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

I had vap1 on an ath10k NIC, and wlan2 also existed.  I deleted
the vap1, and very shortly afterwords, the firmware crashed:

ath10k: firmware crashed!
ath10k: hardware name qca988x hw2.0 version 0x4100016c
ath10k: firmware version: 1.0.0.636
ath10k: target register Dump Location: 0x00401930
ath10k: target Register Dump
ath10k: [00]: 0x4100016C 0x00000000 0x0098EEF0 0x00000000
ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098EEF0
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

Kernel is 3.11.0-rc1+


Is there any way short of reboot to recover from firmware
crash currently?


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
