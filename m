Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z39hF-0001zx-RQ
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 21:07:34 +0000
Message-ID: <5579F87F.4070601@candelatech.com>
Date: Thu, 11 Jun 2015 14:07:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on beacon-miss offloading.
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

In my ath10k CT firmware, I am disabling the beacon-miss offloading
to save space and because it will not work with lots of virtual
stations.

But, it must be that I need some way to tell the stack that this
feature is not enabled, because when suddenly kill my AP, then
the ath10k station connected to it shows endless 'beacon loss' events
in 'iw events' output, but it never actually loses connection.

Stock firmware works fine, so probably I just need to disable
some feature flag when registering the ath10k hardware
when using CT firmware.

With stock firmware, I see a quick dissassociation due to inactivity.

I am having poor luck finding how a driver tells the stack
it has beacon miss offload or not, so, does anyone know how
this is controlled?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
