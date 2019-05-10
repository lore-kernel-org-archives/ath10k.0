Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP68I-0001Em-5D
 for ath10k@lists.infradead.org; Fri, 10 May 2019 14:04:19 +0000
Subject: Re: [PATCH] mac80211: remove warning message
References: <1557471662-1355-1-git-send-email-yiboz@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <7119f24f-5b88-629a-d507-73776b841f65@candelatech.com>
Date: Fri, 10 May 2019 07:04:16 -0700
MIME-Version: 1.0
In-Reply-To: <1557471662-1355-1-git-send-email-yiboz@codeaurora.org>
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: Zhi Chen <zhichen@codeaurora.org>, ath10k@lists.infradead.org



On 05/10/2019 12:01 AM, Yibo Zhao wrote:
> In multiple SSID cases, it takes time to prepare every AP interface
> to be ready in initializing phase. If a sta already knows everything it
> needs to join one of the APs and sends authentication to the AP which
> is not fully prepared at this point of time, AP's channel context
> could be NULL. As a result, warning message occurs.
>
> Even worse, if the AP is under attack via tools such as MDK3 and massive
> authentication requests are received in a very short time, console will
> be hung due to kernel warning messages.

Since it is a WARN_ON_ONCE, how it the console hang due to warnings?  You should
get no more than once per boot?

I have no problem with removing it though.  Seems a harmless splat and I removed
it from my tree some time back as well.

Thanks,
Ben

>
> If this case can be hit during normal functionality, there should be no
> WARN_ON(). Those should be reserved to cases that are not supposed to be
> hit at all or some other more specific cases like indicating obsolete
> interface.
>
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
> ---
>  net/mac80211/ieee80211_i.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
> index 2ae0364..f39c289 100644
> --- a/net/mac80211/ieee80211_i.h
> +++ b/net/mac80211/ieee80211_i.h
> @@ -1435,7 +1435,7 @@ struct ieee80211_local {
>  	rcu_read_lock();
>  	chanctx_conf = rcu_dereference(sdata->vif.chanctx_conf);
>
> -	if (WARN_ON_ONCE(!chanctx_conf)) {
> +	if (!chanctx_conf) {
>  		rcu_read_unlock();
>  		return NULL;
>  	}
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
