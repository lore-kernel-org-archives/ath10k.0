Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEDMO-0002F4-Na
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 07:06:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 4/4] ath10k: fix issues on non-preemptible systems
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-5-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Aug 2013 10:06:13 +0300
In-Reply-To: <1377507205-5386-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 26 Aug 2013 10:53:25 +0200")
Message-ID: <87ioyrmx3u.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Workers may not call into a sleepable function
> (e.g. mutex_lock). Since ath10k workers can run
> for a very long time it is necessary to explicitly
> allow process rescheduling in case there's no
> preemption.
>
> This fixes some issues with system freezes, hangs,
> watchdogs being triggered, userspace being
> unresponsive on slow host machines under heavy
> load.

I consider this more as a workaround as a real fix. Would NAPI be a
proper fix for issues like this?

NAPI support was removed from mac80211 six months ago, but I guess we
could try to get it back if we have a good reason:

http://marc.info/?l=linux-wireless&m=136204135907491

> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1229,6 +1229,10 @@ static void ath10k_htt_rx_work(struct work_struct *work)
>  			break;
>  
>  		ath10k_htt_rx_process_skb(htt->ar, skb);
> +
> +#ifndef CONFIG_PREEMPT
> +		cond_resched();
> +#endif

Why the #ifndef? Why should we not call cond_resched() when PREEMPT is
enabled? Does something negative happen then?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
