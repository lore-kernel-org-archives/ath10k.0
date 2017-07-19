Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXtux-0000Py-Az
 for ath10k@lists.infradead.org; Wed, 19 Jul 2017 18:41:53 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k_htt_rx_amsdu_allowed(): use ath10k_dbg()
Date: Wed, 19 Jul 2017 18:41:27 +0000
Message-ID: <e41a39fd-87a1-7fc7-158d-cb298e46a754@qca.qualcomm.com>
References: <1500481605.25934.40.camel@perches.com>
 <20170719182454.11267-1-crazy@frugalware.org>
In-Reply-To: <20170719182454.11267-1-crazy@frugalware.org>
Content-Language: en-US
Content-ID: <78C732A787223342BC2C05C39710757C@qualcomm.com>
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
To: Gabriel Craciunescu <nix.or.die@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, "joe@perches.com" <joe@perches.com>

On 07/19/2017 11:24 AM, Gabriel Craciunescu wrote:

To make it consistent, maybe rename the patch title starting with ath10k:

> From: Gabriel Craciunescu <nix.or.die@gmail.com>
>
> 	Each time we get disconencted from AP we get flooded with messages like:
>
> 	...
> 	ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
> 	<until ratelimit kicks in>
> 	ath10k_warn: 155 callbacks suppressed
> 	...
>
> 	Use ath10k_dbg() here too.

You don't need an indentation on every line of the commit.

> Signed-off-by: Gabriel Craciunescu <nix.or.die@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 398dda978d6e..75d9b59b7e63 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -1514,7 +1514,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>  	 */
>  
>  	if (!rx_status->freq) {
> -		ath10k_warn(ar, "no channel configured; ignoring frame(s)!\n");
> +		ath10k_dbg(ar, ATH10K_DBG_HTT, "no channel configured; ignoring frame(s)!\n");
>  		return false;
>  	}
>  

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
