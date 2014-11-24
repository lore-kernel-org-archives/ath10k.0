Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsqaw-0008T4-RI
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 10:10:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: re-config ht_caps when chainmask is modified.
References: <1411576506-11815-1-git-send-email-greearb@candelatech.com>
 <1411576506-11815-2-git-send-email-greearb@candelatech.com>
Date: Mon, 24 Nov 2014 12:09:42 +0200
In-Reply-To: <1411576506-11815-2-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 24 Sep 2014 09:35:06
 -0700")
Message-ID: <87ioi47vvd.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

something to clarify about mac80211 behaviour:

greearb@candelatech.com writes:

> This lets the mac80211 stack use the proper ht-caps when
> negotiating with the peer.  Note that all vdevs are guaranteed
> to be down when antenna changes, so we can set the ht_caps
> without worrying about messing up existing stations.

[...]

> @@ -2537,6 +2560,17 @@ static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>  	ar->cfg_tx_chainmask = tx_ant;
>  	ar->cfg_rx_chainmask = rx_ant;
>  
> +	ht_cap = ath10k_get_ht_cap(ar, true);
> +	vht_cap = ath10k_create_vht_cap(ar, true);
> +
> +	if (ar->phy_capability & WHAL_WLAN_11G_CAPABILITY)
> +		ar->mac.sbands[IEEE80211_BAND_2GHZ].ht_cap = ht_cap;
> +
> +	if (ar->phy_capability & WHAL_WLAN_11A_CAPABILITY) {
> +		ar->mac.sbands[IEEE80211_BAND_5GHZ].ht_cap = ht_cap;
> +		ar->mac.sbands[IEEE80211_BAND_5GHZ].vht_cap = vht_cap;
> +	}

So this modifies stryct wiphy::bands after we have called
ieee80211_register_hw(). Is this something which both cfg80211 and
mac80211 support? I didn't find the documentation mentioning anything
about this so I got a bit worried.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
