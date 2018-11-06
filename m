Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2nam01on0612.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::612]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJyPe-0001YK-UL
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 10:16:49 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
Date: Tue, 6 Nov 2018 10:16:11 +0000
Message-ID: <20181106101601.526ovvmabfqrr7sl@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <A2C02070ED8C72479989A08E6F5DDCF7@namprd05.prod.outlook.com>
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
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello Tamizh,

> Co-Developed-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> ---
>  include/net/cfg80211.h       |   14 +++++++
>  include/uapi/linux/nl80211.h |   69 +++++++++++++++++++++++++++++++++
>  net/wireless/nl80211.c       |   86 ++++++++++++++++++++++++++++++++++++++++++
>  net/wireless/rdev-ops.h      |   15 ++++++++
>  net/wireless/trace.h         |   27 +++++++++++++
>  5 files changed, 211 insertions(+)

...

> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
> index 5801d76..dd024da 100644
> --- a/include/net/cfg80211.h
> +++ b/include/net/cfg80211.h

...

>  /**
> @@ -4035,6 +4044,9 @@ struct wiphy_iftype_ext_capab {
>   * @txq_limit: configuration of internal TX queue frame limit
>   * @txq_memory_limit: configuration internal TX queue memory limit
>   * @txq_quantum: configuration of internal TX queue scheduler quantum
> + *
> + * @max_data_retry_count: Maximum limit can be configured as retry count
> + *     for a TID.
>   */
>  struct wiphy {
>         /* assign these fields before you register the wiphy */
> @@ -4171,6 +4183,8 @@ struct wiphy {
>         u32 txq_memory_limit;
>         u32 txq_quantum;
> 
> +       u8 max_data_retry_count;
> +
>         char priv[0] __aligned(NETDEV_ALIGN);
>  };

Could you please clarify why do you define max_data_retry_count instead of
making use of existing wiphy params: retry_short (dot11ShortRetryLimit)
and retry_long (dot11LongRetryLimit) ?

> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index d744388..d386ad7 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c

...

> +static int nl80211_set_tid_config(struct sk_buff *skb,
> +                                 struct genl_info *info)
> +{
> +       struct cfg80211_registered_device *rdev = info->user_ptr[0];
> +       struct nlattr *attrs[NL80211_ATTR_TID_MAX + 1];
> +       struct nlattr *tid;
> +       struct net_device *dev = info->user_ptr[1];
> +       const char *peer = NULL;
> +       u8 tid_no;
> +       int ret = -EINVAL, retry_short = -1, retry_long = -1;
> +
> +       tid = info->attrs[NL80211_ATTR_TID_CONFIG];
> +       if (!tid)
> +               return -EINVAL;
> +
> +       ret = nla_parse_nested(attrs, NL80211_ATTR_TID_MAX, tid,
> +                              nl80211_attr_tid_policy, info->extack);
> +       if (ret)
> +               return ret;
> +
> +       if (!attrs[NL80211_ATTR_TID])
> +               return -EINVAL;
> +
> +       if (attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
> +               retry_short = nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_SHORT]);
> +               if (!retry_short ||
> +                   retry_short > rdev->wiphy.max_data_retry_count)
> +                       return -EINVAL;
> +       }
> +
> +       if (attrs[NL80211_ATTR_TID_RETRY_LONG]) {
> +               retry_long = nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_LONG]);
> +               if (!retry_long ||
> +                   retry_long > rdev->wiphy.max_data_retry_count)
> +                       return -EINVAL;
> +       }
> +
> +       tid_no = nla_get_u8(attrs[NL80211_ATTR_TID]);
> +       if (tid_no >= IEEE80211_FIRST_TSPEC_TSID)
> +               return -EINVAL;

Not that important, but this tid_no check can be placed after
attrs[NL80211_ATTR_TID].

BTW, some special tid_no value (e.g. (u8)-1) could be used to notify driver
that retry settings should be applied for all the TIDs. IIUC the only
required change would be to modify this tid_no sanity check.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
