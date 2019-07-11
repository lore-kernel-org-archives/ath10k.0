Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx0b-00183b01.pphosted.com ([67.231.157.42]
 helo=mx0a-00183b01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlYta-0006UZ-3w
 for ath10k@lists.infradead.org; Thu, 11 Jul 2019 13:14:00 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
Date: Thu, 11 Jul 2019 13:13:37 +0000
Message-ID: <20190711131331.gyjvsbxipgfk5cmn@bars>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <50EC6CBCF34F09408055F389348E0D87@namprd05.prod.outlook.com>
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

> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
> index ff760ba..4881bfb6 100644
> --- a/net/wireless/nl80211.c
> +++ b/net/wireless/nl80211.c
> @@ -281,6 +281,13 @@ static int validate_ie_attr(const struct nlattr *attr,
>                 NLA_POLICY_NESTED_ARRAY(nl80211_psmr_peer_attr_policy),
>  };
> 
> +static const struct nla_policy
> +nl80211_tid_attr_config_policy[NL80211_TID_ATTR_CONFIG_MAX + 1] = {
> +       [NL80211_TID_ATTR_CONFIG_TID] = { .type = NLA_U8 },
> +       [NL80211_TID_ATTR_CONFIG_NOACK] =
> +                       NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
> +};
> +

IIUC, in the current version of the patch set no specific value of
NL80211_TID_ATTR_CONFIG_TID attribute is reserved for 'apply to all tids'
command. It could be left up to drivers. But we need some convention for
userspace tools (e.g. iw) anyway.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
