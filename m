Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anokP-0008Us-RR
 for ath10k@lists.infradead.org; Wed, 06 Apr 2016 14:47:59 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k: prefer ether_addr_equal() or
 ether_addr_equal_unaligned() over memcmp()
Date: Wed, 6 Apr 2016 14:47:22 +0000
Message-ID: <8737qyaj5z.fsf@kamboji.qca.qualcomm.com>
References: <20160324142217.15808.22638.stgit@potku.adurom.net>
 <20160324142352.15808.33417.stgit@potku.adurom.net>
In-Reply-To: <20160324142352.15808.33417.stgit@potku.adurom.net> (Kalle Valo's
 message of "Thu, 24 Mar 2016 16:23:52 +0200")
Content-Language: en-US
Content-ID: <5BA6AE17717B1E47AB9FB19977E45379@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Fixes checkpatch warnings:
>
> drivers/net/wireless/ath/ath10k/mac.c:452: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
> drivers/net/wireless/ath/ath10k/mac.c:455: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
> drivers/net/wireless/ath/ath10k/txrx.c:133: Prefer ether_addr_equal() or ether_addr_equal_unaligned() over memcmp()
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c  |    4 ++--
>  drivers/net/wireless/ath/ath10k/txrx.c |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 74a0e25183d0..c89f711a796b 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -449,10 +449,10 @@ static int ath10k_mac_vif_update_wep_key(struct ath10k_vif *arvif,
>  	lockdep_assert_held(&ar->conf_mutex);
>  
>  	list_for_each_entry(peer, &ar->peers, list) {
> -		if (!memcmp(peer->addr, arvif->vif->addr, ETH_ALEN))
> +		if (!ether_addr_equal(peer->addr, arvif->vif->addr))
>  			continue;
>  
> -		if (!memcmp(peer->addr, arvif->bssid, ETH_ALEN))
> +		if (!ether_addr_equal(peer->addr, arvif->bssid))
>  			continue;
>  
>  		if (peer->keys[key->keyidx] == key)
> diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
> index 31335c510f1e..17a493b3333e 100644
> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> @@ -130,7 +130,7 @@ struct ath10k_peer *ath10k_peer_find(struct ath10k *ar, int vdev_id,
>  	list_for_each_entry(peer, &ar->peers, list) {
>  		if (peer->vdev_id != vdev_id)
>  			continue;
> -		if (memcmp(peer->addr, addr, ETH_ALEN))
> +		if (ether_addr_equal(peer->addr, addr))
>  			continue;

A brown paperbag bug, I got the tests reversed. Will send v2.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
