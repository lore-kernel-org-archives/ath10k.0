Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS1LY-0000kV-Dc
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 09:39:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 8/8] ath10k: finally kill htt_rx_info
References: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395394341-3958-9-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 24 Mar 2014 11:38:40 +0200
In-Reply-To: <1395394341-3958-9-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 21 Mar 2014 10:32:21 +0100")
Message-ID: <87r45s6in3.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Struct htt_rx_info is not needed anymore while
> we will use ieee80211_rx_status structure as
> as template.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

[...]

> -static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
> +static void ath10k_process_rx(struct ath10k *ar,
> +			      struct ieee80211_rx_status *rx_status,
> +			      struct sk_buff *skb)
>  {
>  	struct ieee80211_rx_status *status;
>  
> -	status = IEEE80211_SKB_RXCB(info->skb);
> -	memcpy(status, &info->rx_status, sizeof(*status));
> +	status = IEEE80211_SKB_RXCB(skb);
> +	memcpy(status, rx_status, sizeof(*status));

I guess you saw this suggestion from the buildbot:

>> drivers/net/wireless/ath/ath10k/htt_rx.c:803:1-7: Replace memcpy with struct assignment

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
