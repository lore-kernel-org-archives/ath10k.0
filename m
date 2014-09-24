Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWwOB-0005IM-Bx
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 23:54:27 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id C494F40A1E9
 for <ath10k@lists.infradead.org>; Wed, 24 Sep 2014 16:54:01 -0700 (PDT)
Message-ID: <54235999.1020600@candelatech.com>
Date: Wed, 24 Sep 2014 16:54:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: More fun with firmware crashes.
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
To: ath10k <ath10k@lists.infradead.org>

Here's a fun case:  Firmware crashed before device could register,
so there is no debugfs to grab the binary crash dump...hope it
can be decoded from what is printed in the logs!

ath10k_pci 0000:04:00.0: firmware 10.1.467-ct-swcrypt-diet-012 booted
ath10k_pci 0000:04:00.0: firmware crashed! (uuid 31d718ad-2aec-4f41-bc2a-3d127a15d86d)
ath10k_pci 0000:04:00.0: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 10.1.467-ct-swcrypt-diet-012 api 2 htt 0.0
ath10k_pci 0000:04:00.0: debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
ath10k_pci 0000:04:00.0: firmware register dump:
ath10k_pci 0000:04:00.0: [00]: 0x4100016C 0x000015B3 0x009B4260 0x00955B31
ath10k_pci 0000:04:00.0: [04]: 0x009B4260 0x00060730 0x00000005 0x00000003
ath10k_pci 0000:04:00.0: [08]: 0x0044E6C4 0x00000E50 0x00000000 0x0044E5A4
ath10k_pci 0000:04:00.0: [12]: 0x00000009 0x00000000 0x00958360 0x0095836B
ath10k_pci 0000:04:00.0: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
ath10k_pci 0000:04:00.0: [20]: 0x409B4260 0x0040AC84 0x00000001 0x00000000
ath10k_pci 0000:04:00.0: [24]: 0x809AD621 0x0040ACE4 0x00000000 0xC09B4260
ath10k_pci 0000:04:00.0: [28]: 0x809897A2 0x0040AD24 0x0040AD44 0x0040F668
ath10k_pci 0000:04:00.0: [32]: 0x80988342 0x0040AD44 0x0040F668 0x0040F828
ath10k_pci 0000:04:00.0: [36]: 0x8098927D 0x0040AD74 0x0040F668 0x00000001
ath10k_pci 0000:04:00.0: [40]: 0x809AC99E 0x0040ADB4 0x0040F668 0x0000A000
ath10k_pci 0000:04:00.0: [44]: 0x809A8FFA 0x0040ADD4 0x00400000 0x0041578C
ath10k_pci 0000:04:00.0: [48]: 0x809A8783 0x0040AE24 0x0040AE48 0x00410ECC
ath10k_pci 0000:04:00.0: [52]: 0x809486FA 0x0040AE44 0x00000001 0x00000000
ath10k_pci 0000:04:00.0: [56]: 0x80948E2C 0x0040AEA4 0x0041D508 0x004115F4
ath10k_pci 0000:04:00.0: wmi unified ready event not received
ath10k_pci 0000:04:00.0: boot hif stop
ath10k_pci 0000:04:00.0: boot warm reset
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00047800
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00006000
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target reset state: 0x00000800
ath10k_pci 0000:04:00.0: boot warm reset complete
ath10k_pci 0000:04:00.0: could not init core (-110)
ath10k_pci 0000:04:00.0: boot hif power down
ath10k_pci 0000:04:00.0: boot warm reset
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target reset state: 0x00000800
ath10k_pci 0000:04:00.0: boot warm reset complete
ath10k_pci 0000:04:00.0: could not probe fw (-110)
ath10k_pci 0000:04:00.0: cannot restart a device that hasn't been started

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
