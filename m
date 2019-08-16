Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyZXA-0007XT-Rn
 for ath10k@lists.infradead.org; Fri, 16 Aug 2019 10:32:39 +0000
Subject: Re: [PATCH] ath10k: add cleanup in ath10k_sta_state()
References: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <d6fd2268-4f71-99d6-7503-f9c9166164c4@newmedia-net.de>
Date: Fri, 16 Aug 2019 12:31:36 +0200
MIME-Version: 1.0
In-Reply-To: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
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
To: ath10k@lists.infradead.org

this patch will kick our any peer each time you call for statistics.so 
it will not solve anything. it creates a massive bug. usually just kfree 
is enough here but even this will maybe just kill existing stats

Am 15.08.2019 um 23:04 schrieb Wenwen Wang:
> If 'sta->tdls' is false, no cleanup is executed, leading to memory/resource
> leaks, e.g., 'arsta->tx_stats'. To fix this issue, perform cleanup before
> go to the 'exit' label.
>
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 0606416..f99e6d2 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6548,8 +6548,12 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>   
>   		spin_unlock_bh(&ar->data_lock);
>   
> -		if (!sta->tdls)
> +		if (!sta->tdls) {
> +			ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
> +			ath10k_mac_dec_num_stations(arvif, sta);
> +			kfree(arsta->tx_stats);
>   			goto exit;
> +		}
>   
>   		ret = ath10k_wmi_update_fw_tdls_state(ar, arvif->vdev_id,
>   						      WMI_TDLS_ENABLE_ACTIVE);

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
