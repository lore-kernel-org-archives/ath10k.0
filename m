Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0xzq-0005mz-Fl
 for ath10k@lists.infradead.org; Wed, 08 Jan 2014 18:36:55 +0000
Message-ID: <52CD9AAF.1040407@candelatech.com>
Date: Wed, 08 Jan 2014 10:36:31 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: How to make software re-calc received frames with bad FCS?
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: ath10k@lists.infradead.org

I'm back to trying to get multiple stations working to same AP
with WPA2 on ath10k.

I tried  doing 'nohwcrypt', but I had no luck with that.  I think
the firmware would require a fair bit of changes to make that happen.

So, a second plan is to just tell the firmware to use hardware crypt
for the VIFs.  This would have a good benefit of offloading the tx
path, at least.

This seems to work for transmit, but on receive, the hardware hash
collides since 2+ stations have same peer (ie, the AP).

I do receive packets, but they are flagged with FCS errors (and I think
there is no re-assembly of ampdu, but I'm not sure how much that matters).

My thought is to somehow flag these packets as needing to be decrypted
by software instead, similar to how the normal nohwcrypt logic works.

Any suggestions for how to go about attempting this?   Maybe
just force remove the CRC failure bit from the status before
passing up the stack?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
