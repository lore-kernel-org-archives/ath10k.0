Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9ewz-0003zV-V2
 for ath10k@lists.infradead.org; Tue, 22 Jul 2014 18:38:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3] ath10k: fix Rx aggregation reordering
References: <1405505855-13741-1-git-send-email-michal.kazior@tieto.com>
 <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 22 Jul 2014 21:37:29 +0300
In-Reply-To: <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 16 Jul 2014 13:19:00 +0200")
Message-ID: <87r41dtf2u.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org, Denton Gentry <denton.gentry@gmail.com>

(dropping linux-wireless)

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware doesn't perform Rx reordering so it is
> left to the host driver to do that.
>
> Use mac80211 to perform reordering instead of
> re-inventing the wheel.
>
> This fixes TCP throughput issues in some
> environments.
>
> Reported-by: Denton Gentry <denton.gentry@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> This depends on:
>
>  * mac80211: fix Rx reordering with RX_FLAG_AMSDU_MORE
>  * mac80211: add support for Rx reordering offloading
>
> I'm still seeing some issues with TCP traffic.
> Apparently firmware/hardware sometimes stalls Rx
> for ~100ms and misses some aggregate frames. I
> wasn't able to pinpoint what the problem is. The
> more parallel TCP streams (iperf) the more often
> stalls happen. UDP doesn't seem to trigger the Rx
> stalls at all.

The mac80211 patches are in mac80211-next, but I can only apply this one
only once they are in wireless-next.

Also the other thing is that 3.17 merge window is very close. I might be
able to squeeze this in but there's the risk that this patch hasn't
received enough testing from being in ath.git. How safe (or risky) is
this patch? If we push this to 3.17, we could try to fix regressions in
-rc releases but that's always more difficult than waiting for 3.18.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
