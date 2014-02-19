Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG6Pz-0006tP-Rc
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 12:38:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 1/7] ath10k: remove DMA mapping wrappers
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-2-git-send-email-michal.kazior@tieto.com>
Date: Wed, 19 Feb 2014 14:37:57 +0200
In-Reply-To: <1392629563-31046-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 17 Feb 2014 10:32:37 +0100")
Message-ID: <8738jfz3a2.fsf@kamboji.qca.qualcomm.com>
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

> There's no real benefit from using them. DMA-API
> already provides debugging. Some skbuffs are
> already mapped directly with DMA-API since wrapper
> arguments were insufficient and extending them
> would be pointless.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1360,7 +1360,7 @@ static void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
>  	struct wmi_bcn_info *bcn_info;
>  	struct ath10k_vif *arvif;
>  	struct sk_buff *bcn;
> -	int vdev_id = 0;
> +	int err, vdev_id = 0;

We use ret, res and err as names for the status variable. We should try
to unify this and use ret everywhere.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
