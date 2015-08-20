Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSFPP-0001YC-Tr
 for ath10k@lists.infradead.org; Thu, 20 Aug 2015 02:16:53 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: CT firmware beta-15 now has better monitor mode.
Message-ID: <55D5387D.9000509@candelatech.com>
Date: Wed, 19 Aug 2015 19:16:29 -0700
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Here is the changelog note.  This particular improvement does not require
any driver patches as far as I know.  I tested this on my 4.0.4+ kernel.

Should be useful for anyone doing sniffing with ath10k.

   *  Allow monitor mode to receive 'Association Request', block-ack action frames,
      nodata frames, TYPE-CTL frames.  Previously, these were not delivered to
      the WMI interface, and the kernel driver is configured to drop mgmt frames in
      the normal RX htt datapath, so host never saw them.

      This makes sniffing with ath10k a lot more useful.  When no monitor devices are
      active, the firmware reverts to the previous behaviour.  I guess the idea is that
      this is an optimization and keeps some un-needed frames off the host.

http://www.candelatech.com/ath10k.php

I'd be curious to know if anyone finds any bugs with this.  It is possible
that my changes could cause duplicate frames to be received in monitor mode,
so please keep an eye out for that.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
