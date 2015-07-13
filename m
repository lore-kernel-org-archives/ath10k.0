Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEmo6-0000xk-Sk
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 23:06:43 +0000
Message-ID: <55A4446C.4090803@candelatech.com>
Date: Mon, 13 Jul 2015 16:06:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Don't enable PROMISC when adding AP to a bridge?
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

I notice some of my WLE900VX cards will lock up and not receive any packets
after a few seconds of being in PROMISC mode.  This happens on my own
CT firmware as well as stock firmware-2.bin.  This breaks monitor mode, of
course, but it also breaks bridged AP mode.

So, I found this patch from way back when:
http://lists.celinuxforum.org/pipermail/bridge/2008-June/005906.html

I hacked a similar thing into my 4.0.4 kernel, and now bridged mode
AP seems much more stable (and the radio does not go into PROMISC mode,
so it should be more efficient in a busy RF environment).

Maybe this feature could be revisited?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
