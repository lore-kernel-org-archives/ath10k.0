Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx0a-00183b01.pphosted.com ([67.231.149.44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlYbP-0007v9-NE
 for ath10k@lists.infradead.org; Thu, 11 Jul 2019 12:55:16 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
Date: Thu, 11 Jul 2019 12:51:17 +0000
Message-ID: <20190711125111.vd4rfixmotyusuai@bars>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <0558E3923765CB498C7AE30F0AA63429@namprd05.prod.outlook.com>
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

> Add a new NL command, NL80211_CMD_SET_TID_CONFIG to support
> data TID specific configuration. This per TID configurations
> are passed in NL80211_ATTR_TID_CONFIG which is a nested
> attribute. This patch adds support to configure per TID
> noack policy through NL80211_TID_ATTR_CONFIG_NOACK attribute.
> Data TID value for this configuration will be passed through
> NL80211_TID_ATTR_CONFIG_TID attribute. When the user-space wants
> this configuration peer specific rather than being applied for
> all the connected stations, MAC address of the peer can be passed
> in NL80211_ATTR_MAC attribute. This patch introduced
> enum ieee80211_tid_conf_mask to notify the driver that which
> configuration modified.
> Driver supporting data TID specific noack policy configuration
> should be advertise through NL80211_EXT_FEATURE_PER_TID_NOACK_CONFIG
> and supporting per STA data TID noack policy configuration
> should be advertise through NL80211_EXT_FEATURE_PER_STA_NOACK_CONFIG
> 
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>

...

> +static int parse_tid_conf(struct cfg80211_registered_device *rdev,
> +                         struct nlattr *attrs[],
> +                         struct ieee80211_tid_cfg *tid_conf,
> +                         struct genl_info *info, const u8 *peer)
> +{

...


> +static int nl80211_set_tid_config(struct sk_buff *skb,
> +                                 struct genl_info *info)
> +{
> +       struct cfg80211_registered_device *rdev = info->user_ptr[0];
> +       struct nlattr *attrs[NL80211_TID_ATTR_CONFIG_MAX + 1];
> +       struct net_device *dev = info->user_ptr[1];
> +       struct ieee80211_tid_config *tid_config;
> +       struct nlattr *tid;
> +       int conf_idx = 0, rem_conf;
> +       int ret = -EINVAL;
> +       u32 num_conf = 0;
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
> +       tid_config = kzalloc(struct_size(tid_config, tid_conf, num_conf),
> +                            GFP_KERNEL);
> +       if (!tid_config)
> +               return -ENOMEM;
> +
> +       tid_config->n_tid_conf = num_conf;
> +
> +       if (info->attrs[NL80211_ATTR_MAC])
> +               tid_config->peer = nla_data(info->attrs[NL80211_ATTR_MAC]);
> +
> +       nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
> +                           rem_conf) {
> +               ret = nla_parse_nested_deprecated(attrs, NL80211_TID_ATTR_CONFIG_MAX,
> +                                                 tid, NULL, NULL);
> +
> +               if (ret)
> +                       goto bad_tid_conf;
> +
> +               if (!attrs[NL80211_TID_ATTR_CONFIG_TID]) {
> +                       ret = -EINVAL;
> +                       goto bad_tid_conf;
> +               }
> +
> +               ret = parse_tid_conf(rdev, attrs,
> +                                    &tid_config->tid_conf[conf_idx],
> +                                    tid_config->peer);


Argument 'info' is missing here from parse_tid_conf. IIUC, appropriate
fixup is included into patch #5. So it looks like rebase issue. But it
makes sense to fix it since this issue makes the patch set non-bisectable.

Regareds,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
