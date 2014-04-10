Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY7zb-0002X3-Jg
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 05:57:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: make sure to not use invalid beacon pointer
References: <1397037685-7485-1-git-send-email-michal.kazior@tieto.com>
 <1397037685-7485-3-git-send-email-michal.kazior@tieto.com>
Date: Thu, 10 Apr 2014 08:57:13 +0300
In-Reply-To: <1397037685-7485-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 9 Apr 2014 12:01:23 +0200")
Message-ID: <87wqexhgli.fsf@kamboji.qca.qualcomm.com>
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

> If DMA mapping of next beacon failed it was
> possible for next SWBA to access a pointer that
> was already unmapped and freed. This could cause
> memory corruption.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index d4b48ef..35c7d52 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1441,6 +1441,8 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
>  			dev_kfree_skb_any(arvif->beacon);
>  		}
>  
> +		arvif->beacon = NULL;

Why have this outside the "if (arvif->beacon)" check? If it's already
NULL, there's no need to set it to NULL again. And besides, at least for
me, it's more intuitive to reset the variable immeadiately after
dev_kfree_skb_any().

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
