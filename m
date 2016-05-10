Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b01qX-0006Yl-AT
 for ath10k@lists.infradead.org; Tue, 10 May 2016 07:12:45 +0000
Date: Tue, 10 May 2016 12:42:14 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH v2 3/5] ath10k: Add WARN_ON if we over-write peer-map
 pointer.
Message-ID: <20160510071214.GD25626@atheros-ThinkPad-T61>
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
 <1459545132-11295-3-git-send-email-greearb@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1459545132-11295-3-git-send-email-greearb@candelatech.com>
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

On Fri, Apr 01, 2016 at 02:12:10PM -0700, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Not sure this can happen, but seems like a reasonable sanity
> check.

[shafi] possibly if the peer is removed and the bit is not cleared in the driver
? when the new peer occupies the slot

> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>  drivers/net/wireless/ath/ath10k/txrx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
> index a779a4e..2edef8a 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -309,6 +309,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
>  	ath10k_warn(ar, /*ATH10K_DBG_HTT,*/ "htt peer map vdev %d peer %pM id %d\n",
>  		   ev->vdev_id, ev->addr, ev->peer_id);
>  
> +	WARN_ON(ar->peer_map[ev->peer_id] && (ar->peer_map[ev->peer_id] != peer));
>  	ar->peer_map[ev->peer_id] = peer;
>  	set_bit(ev->peer_id, peer->peer_ids);
>  exit:
> -- 
> 2.4.3

regards,
shafi

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
