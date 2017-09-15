Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dseBr-0005Zz-A5
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 00:09:05 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5A7B3409E08
 for <ath10k@lists.infradead.org>; Thu, 14 Sep 2017 17:08:42 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Failed to wake device (9984)
Message-ID: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
Date: Thu, 14 Sep 2017 17:08:42 -0700
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
To: ath10k <ath10k@lists.infradead.org>

This is with our hacked 4.9 kernel, hacked firmware, and hacked driver (yah me!).

Sometimes on reboots, in at least some systems, the device is not woken up correctly,
and of course it never recovers.

Any idea if there is some way to retry this a few times to see if the device
can be recovered?

1177 Sep 14 17:00:09 ct524 kernel: ath10k driver, optimized for CT firmware, probing pci device: 0x46.
1178 Sep 14 17:00:09 ct524 systemd[1]: Reached target Swap.
1179 Sep 14 17:00:09 ct524 kernel: ath10k_pci 0000:04:00.0: failed to wake up device : -110
1180 Sep 14 17:00:09 ct524 kernel: ath10k_pci: probe of 0000:04:00.0 failed with error -110


Thanks,
Ben
-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
