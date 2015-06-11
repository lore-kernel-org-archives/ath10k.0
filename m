Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3C3U-00061a-Gt
 for ath10k@lists.infradead.org; Thu, 11 Jun 2015 23:38:42 +0000
Message-ID: <557A1BE9.7070305@candelatech.com>
Date: Thu, 11 Jun 2015 16:38:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on beacon-miss offloading.
References: <5579F87F.4070601@candelatech.com>
In-Reply-To: <5579F87F.4070601@candelatech.com>
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

On 06/11/2015 02:07 PM, Ben Greear wrote:
> In my ath10k CT firmware, I am disabling the beacon-miss offloading
> to save space and because it will not work with lots of virtual
> stations.
> 
> But, it must be that I need some way to tell the stack that this
> feature is not enabled, because when suddenly kill my AP, then
> the ath10k station connected to it shows endless 'beacon loss' events
> in 'iw events' output, but it never actually loses connection.
> 
> Stock firmware works fine, so probably I just need to disable
> some feature flag when registering the ath10k hardware
> when using CT firmware.
> 
> With stock firmware, I see a quick dissassociation due to inactivity.
> 
> I am having poor luck finding how a driver tells the stack
> it has beacon miss offload or not, so, does anyone know how
> this is controlled?

I still am not sure why stock firmware works, but it appears
the reason mine is failing is that the ACK status for mgt frames
is always set to TRUE since the ath10k wmi-mgt-tx API is so
lame.  So, mac80211 does a probe, ath10k lies and says it was
acked, and mac80211 then things all is well for another few
seconds.

So, I think I'll try to come up with some way to report
proper tx-status for wmi-mgt-frames in my firmware....

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
