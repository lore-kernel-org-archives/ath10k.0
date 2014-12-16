Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0yCq-00064f-Ov
 for ath10k@lists.infradead.org; Tue, 16 Dec 2014 19:54:53 +0000
Message-ID: <1418759663.1943.7.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: notify NSS changed when IBSS and HT
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 16 Dec 2014 20:54:23 +0100
In-Reply-To: <1418720165-19810-1-git-send-email-janusz.dziedzic@tieto.com>
 (sfid-20141216_095709_865462_C6672725)
References: <1418720165-19810-1-git-send-email-janusz.dziedzic@tieto.com>
 (sfid-20141216_095709_865462_C6672725)
Mime-Version: 1.0
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

On Tue, 2014-12-16 at 09:56 +0100, Janusz Dziedzic wrote:

>  			drv_sta_rc_update(local, sdata, &sta->sta,
>  					  IEEE80211_RC_SUPP_RATES_CHANGED);
> +			/* Force rx_nss recalculation */
> +			sta->sta.rx_nss = 0;
>  			rate_control_rate_init(sta);
> +			if (rx_nss != sta->sta.rx_nss)
> +				drv_sta_rc_update(local, sdata, &sta->sta,
> +						  IEEE80211_RC_NSS_CHANGED);

Seems to me you should consolidate those two drv_sta_rc_update() calls
and just make the flags dependent on the NSS change?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
