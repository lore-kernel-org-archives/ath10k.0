Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCu3d-0002X0-QK
 for ath10k@lists.infradead.org; Thu, 31 Jul 2014 17:22:26 +0000
Message-ID: <53DA7B3A.7000403@candelatech.com>
Date: Thu, 31 Jul 2014 10:22:02 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : [PATCH] ath10k: fix aggregated 4addr Rx
References: <1406205374-24858-1-git-send-email-michal.kazior@tieto.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D805@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F15C1D805@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 07/31/2014 08:49 AM, Vu Hai NGUYEN wrote:
> Thank you for the patch. I applied it (manually not automatically, the patch is not based on ath-master branch?)
> The warning msg: br0: received packet on wlan0.sta1 with own address as source address disappeared on the console of my AP.
> But the performance of my bridged STA (using CT firmware) is still lower than non-bridged STA (10.1-467 firmware).
> (520 vs 550 Mbps)
> 
> The processor of my AP is not exhausted (about 15-20% idle) but perf top on my bridged STA show that there is this thread: br_fdb_update.
> I didn't see it on non-bridged STA, it takes 5% resource of the processor
> I look for it on google and this thread is related to the warning message br0:received packet on wlan0.sta1 with own address as source address
> Do you guy have any suggestion?

Is there any way at all to make the standard firmware do bridged mode?  I am curious if
the slow-down is due to my firmware or to bridging in general...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
