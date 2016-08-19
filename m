Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1badP3-0004Fe-Tt
 for ath10k@lists.infradead.org; Fri, 19 Aug 2016 06:35:42 +0000
Date: Fri, 19 Aug 2016 12:05:11 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 3/3] ath10k:  Improve logging message.
Message-ID: <20160819063511.GA16230@atheros-ThinkPad-T61>
References: <1471569995-10028-1-git-send-email-greearb@candelatech.com>
 <1471569995-10028-3-git-send-email-greearb@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1471569995-10028-3-git-send-email-greearb@candelatech.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Ben,

On Thu, Aug 18, 2016 at 06:26:35PM -0700, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Helps to know the sta pointer.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index d96c06e..82bc0da 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6491,8 +6491,8 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>  		 * Existing station deletion.
>  		 */
>  		ath10k_dbg(ar, ATH10K_DBG_MAC,
> -			   "mac vdev %d peer delete %pM (sta gone)\n",
> -			   arvif->vdev_id, sta->addr);
> +			   "mac vdev %d peer delete %pM (sta gone) sta: %p\n",
> +			   arvif->vdev_id, sta->addr, sta);

good to rebase over Maharaja's change (%p to %pK) 
https://patchwork.kernel.org/patch/9263691/

>  
>  		ret = ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
>  		if (ret)
> -- 
> 2.4.11
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
