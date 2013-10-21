Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY91d-0002jo-GB
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 06:31:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: extend number of AP interfaces for 10.X
 firmware
References: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
 <1382090878-22216-2-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 21 Oct 2013 09:31:08 +0300
In-Reply-To: <1382090878-22216-2-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Fri, 18 Oct 2013 12:07:58 +0200")
Message-ID: <87iowruocz.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> This firmware can support up to 8 AP interfaces.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index af046c4..dc65dcd 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3255,7 +3255,7 @@ static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
>  	.types	= BIT(NL80211_IFTYPE_STATION)
>  	},
>  	{
> -	.max	= 7,
> +	.max	= 8,
>  	.types	= BIT(NL80211_IFTYPE_AP)
>  	},
>  };

Why only with 10.x firmware branch? Doesn't the main branch support 8
interfaces?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
