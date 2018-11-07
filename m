Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam04on060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::60a]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKXfk-0003WF-SW
 for ath10k@lists.infradead.org; Wed, 07 Nov 2018 23:55:46 +0000
From: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
Subject: Re: [PATCH 3/4] mac80211: Add api to support configuring TID specific
 configuration
Date: Wed, 7 Nov 2018 23:55:29 +0000
Message-ID: <58a9731d-e7a7-282f-22f3-b697a93f7278@quantenna.com>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-4-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-4-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <8809182432A5464CA38A4C0D3C79823E@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 10/22/2018 10:55 AM, Tamizh chelvam wrote:
>   /**
>    * enum ieee80211_vif_flags - virtual interface flags
>    *
> @@ -1565,6 +1594,8 @@ struct ieee80211_vif {
> 
>          bool txqs_stopped[IEEE80211_NUM_ACS];
> 
> +       struct ieee80211_tid_conf tid_conf;
> +

Why is there only one TID config? If ieee80211_vif::tid_conf member is 
used only to pass data to driver through drv_set_tid_conf(), and driver 
will save it for a specific TID, why do we need to save it in struct 
ieee80211_vif too?
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
