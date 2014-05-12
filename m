Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjt2u-0000PJ-Hz
 for ath10k@lists.infradead.org; Mon, 12 May 2014 16:25:44 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id AA69D40A032
 for <ath10k@lists.infradead.org>; Mon, 12 May 2014 09:25:23 -0700 (PDT)
Message-ID: <5370F5F3.3030508@candelatech.com>
Date: Mon, 12 May 2014 09:25:23 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: tx flush bugs, at least in my firmware.
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

Just FYI, I have no idea if this problem is with my patches, my
firwmare, or what.  At any rate, it is unlikely to be reproducible on
upstream firmware due to its limitations in numbers of VIFS supported.

Here is the problem:

Previous to today, I was using wpa_supplicant that had sharing of scan results
mostly disabled.  It would only associate a single station VIF at a time, and
mostly things were working up to 36 stations (yeah, I managed to eke out another
4 stations :)).

But today, I started fixing the scan result sharing to work like it used to work
back when I mostly tested ath9k systems.

Now, after 20-25 or so stations vifs are associated (and most of the first 20 would
be associating concurrently as possible), I get the errors below and ath10k is
effectively hung:

ath10k: failed to flush transmit queue (skip 0 ar-state 1): 0

This is very repeatable.

My kernel does not have the latest two series of patches that Michal
posted that deal with reset issues, so maybe they hold the key.

So, I'm going to dig into this, but thought I'd throw this out in case
anyone else is seeing something similar.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
