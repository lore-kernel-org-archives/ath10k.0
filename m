Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam04on060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::60d]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybtK-0000zX-RR
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 12:31:24 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCHv2 1/9] nl80211: New netlink command for TID specific
 configuration
Date: Tue, 26 Feb 2019 12:29:07 +0000
Message-ID: <20190226122901.focow4odsbkmv7jn@bars>
References: <1550813554-11581-1-git-send-email-tamizhr@codeaurora.org>
 <1550813554-11581-2-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1550813554-11581-2-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <50A2951F0876774DB91A1D0A779F8A48@namprd05.prod.outlook.com>
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


Hello Tamizh,

> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> ---
>  include/net/cfg80211.h       |  35 +++++++++++++++
>  include/uapi/linux/nl80211.h |  51 ++++++++++++++++++++++
>  net/wireless/nl80211.c       | 102 +++++++++++++++++++++++++++++++++++++++++++
>  net/wireless/rdev-ops.h      |  11 +++++
>  net/wireless/trace.h         |  18 ++++++++
>  5 files changed, 217 insertions(+)

...

> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index 82d5e1e..352eb4a2 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -280,6 +280,13 @@ static int validate_ie_attr(const struct nlattr *attr,
>                 NLA_POLICY_NESTED_ARRAY(nl80211_psmr_peer_attr_policy),
>  };
> 
> +static const struct nla_policy
> +nl80211_attr_tid_config_policy[NL80211_ATTR_TID_CONFIG_MAX + 1] = {
> +       [NL80211_ATTR_TID_CONFIG_TID] = NLA_POLICY_MAX(NLA_U8, 7),

Such a policy permits configuration of per-TID settings, either
for per-STA or for all the STAs. However it is not possible to
perform configuration for all TIDs at once, e.g. passing -1 value
to driver.

Maybe simplify policy and use .type = NLA_U8 ?

Sanity check, if needed, can be performed by driver or even by firmware.

> +       [NL80211_ATTR_TID_CONFIG_NOACK] =
> +                       NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
> +};
> +
>  const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
>         [NL80211_ATTR_WIPHY] = { .type = NLA_U32 },
>         [NL80211_ATTR_WIPHY_NAME] = { .type = NLA_NUL_STRING,
> @@ -541,6 +548,8 @@ static int validate_ie_attr(const struct nlattr *attr,
>         [NL80211_ATTR_PEER_MEASUREMENTS] =
>                 NLA_POLICY_NESTED(nl80211_pmsr_attr_policy),
>         [NL80211_ATTR_AIRTIME_WEIGHT] = NLA_POLICY_MIN(NLA_U16, 1),
> +       [NL80211_ATTR_TID_CONFIG] =
> +                       NLA_POLICY_NESTED(nl80211_attr_tid_config_policy),
>  };

...

> +static int nl80211_set_tid_config(struct sk_buff *skb,
> +                                 struct genl_info *info)
> +{
> +       struct cfg80211_registered_device *rdev = info->user_ptr[0];
> +       struct nlattr *attrs[NL80211_ATTR_TID_CONFIG_MAX + 1];
> +       struct net_device *dev = info->user_ptr[1];
> +       struct ieee80211_tid_config *tid_conf;
> +       struct nlattr *tid;
> +       int conf_idx = 0, rem_conf;
> +       u32 num_conf = 0, size_of_conf;
> +       int ret = -EINVAL;
> +
> +       if (!info->attrs[NL80211_ATTR_TID_CONFIG])
> +               return -EINVAL;
> +
> +       if (!rdev->ops->set_tid_config)
> +               return -EOPNOTSUPP;
> +
> +       nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
> +                           rem_conf)
> +               num_conf++;
> +
> +       size_of_conf = sizeof(struct ieee80211_tid_config) +
> +               num_conf * sizeof(struct ieee80211_tid_cfg);
> +
> +       tid_conf = kzalloc(size_of_conf, GFP_KERNEL);
> +       if (!tid_conf)
> +               return -ENOMEM;
> +
> +       tid_conf->n_tid_conf = num_conf;
> +
> +       if (info->attrs[NL80211_ATTR_MAC])
> +               tid_conf->peer = nla_data(info->attrs[NL80211_ATTR_MAC]);
> +       else
> +               tid_conf->peer = NULL;
> +
> +       nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
> +                           rem_conf) {
> +               ret = nla_parse_nested(attrs, NL80211_ATTR_TID_CONFIG_MAX, tid,
> +                                      NULL, NULL);
> +
> +               if (ret)
> +                       return ret;
> +
> +               if (!attrs[NL80211_ATTR_TID_CONFIG_TID])
> +                       return -EINVAL;
> +
> +               ret = parse_tid_conf(rdev, attrs, &tid_conf->tid_conf[conf_idx],
> +                                    tid_conf->peer);
> +               if (ret)
> +                       goto bad_tid_conf;
> +
> +               conf_idx++;
> +       }
> +
> +       return rdev_set_tid_config(rdev, dev, tid_conf);

What is the ownership rule for tid_conf ? In other words, who is
responsible for freeing this structure ?

Unless I am missing something, in the suggested patches there is no
kfree for this structure and all the nested structures (see Tx bitrate
patch), neither in cfg80211/mac80211 nor in ath10k.

As far as I understand, we have two options here. One option is to
explicitly specify that ownership is passed to the caller, similar
to nl80211_set_reg. Another option is to release memory in this
function after driver makes copies of all necessary fields,
e.g. see nl80211_set_mac_acl.

> +
> +bad_tid_conf:
> +       kfree(tid_conf);
> +       return ret;
> +}

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
