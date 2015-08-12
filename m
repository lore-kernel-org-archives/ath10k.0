Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPfGm-0006M4-IQ
 for ath10k@lists.infradead.org; Wed, 12 Aug 2015 23:17:16 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 53F7E40AEC4
 for <ath10k@lists.infradead.org>; Wed, 12 Aug 2015 16:16:55 -0700 (PDT)
Message-ID: <55CBD3E6.9050202@candelatech.com>
Date: Wed, 12 Aug 2015 16:16:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Out of DMA space?
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

I've been reloading the ath10k modules all afternoon, debugging issues
in my CT firmware.  I've been unloading firmware with pkts queued
in the TX logic, and they could easily not be flushable at this piont.

I just saw this...and machine hung.

DMA: Out of SW-IOMMU space for 1984 bytes at device 0000:05:00.0
ath10k_pci 0000:05:00.0: failed to refill htt rx ring: -12
DMA: Out of SW-IOMMU space for 1984 bytes at device 0000:06:00.0
ath10k_pci 0000:06:00.0: failed to refill htt rx ring: -12
DMA: Out of SW-IOMMU space for 2048 bytes at device 0000:07:00.0
DMA: Out of SW-IOMMU space for 16 bytes at device 0000:07:00.0

Just FYI really...I haven't seen this before.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
