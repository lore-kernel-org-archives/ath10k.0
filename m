Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam05on0605.outbound.protection.outlook.com
 ([2a01:111:f400:fe50::605]
 helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJyg4-0007VA-Gv
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 10:33:45 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 3/4] mac80211: Add api to support configuring TID specific
 configuration
Date: Tue, 6 Nov 2018 10:33:30 +0000
Message-ID: <20181106103325.5phrwo2pv2rc26pd@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-4-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-4-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <C9C6E930C710314EA5978A16A368A73E@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> ---
>  include/net/mac80211.h    |   40 +++++++++++++++++++++++++
>  net/mac80211/cfg.c        |   71 +++++++++++++++++++++++++++++++++++++++++++++
>  net/mac80211/driver-ops.h |   16 ++++++++++
>  net/mac80211/trace.h      |   34 ++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
> 
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index b6cc3e33..7fa7e25 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -1478,6 +1478,35 @@ struct ieee80211_channel_switch {
>         u8 count;
>  };
> 
> +/*
> + * enum ieee80211_tid_conf_change - TID change configuration notification flags
> + *
> + * These flags are used with the set_tid_conf() callback
> + * to indicate which TID configuration parameter changed.
> + *
> + * @TID_RETRY_CONF_CHANGED: retry configuration changed.
> + * @TID_AGGR_CONF_CHANGED: Aggregation config changed for the TID.
> + */
> +enum ieee80211_tid_conf_change {
> +       TID_RETRY_CONF_CHANGED          = BIT(0),
> +       TID_AGGR_CONF_CHANGED           = BIT(1),
> +};

Following your approach, AMSDU support can be added in addition to
AMPDU. So I would suggest to replace AGGR by AMPDU right away.

> +
> +/*
> + * struct ieee80211_tid_conf - holds the tid configiuration data
> + * The information provided in the structure is required for the driver
> + * to configure TID specific configuration.
> + * @tid: TID number
> + * @retry_short: retry count value
> + * @retry_long: retry count value
> + * @aggr: enable/disable aggregation
> + */
> +struct ieee80211_tid_conf {
> +       u8 tid;
> +       int retry_short;
> +       int retry_long;
> +       bool aggr;
> +};

ditto: aggr -> ampdu

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
