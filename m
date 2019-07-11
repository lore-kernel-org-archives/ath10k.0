Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx0b-00183b01.pphosted.com ([67.231.157.42]
 helo=mx0a-00183b01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlYbO-0008I3-1G
 for ath10k@lists.infradead.org; Thu, 11 Jul 2019 12:55:12 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCHv6 5/9] nl80211: Add netlink attribute to configure TID
 specific tx rate
Date: Thu, 11 Jul 2019 12:54:48 +0000
Message-ID: <20190711125442.unlaqjl5nnqgsbod@bars>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <1C243749BB147E41A5268EBD4E997466@namprd05.prod.outlook.com>
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

> Introduce NL80211_TID_ATTR_CONFIG_TX_RATES in nl80211_tid_attr_config
> to accept data TID specific TX bitrate configuration
> through NL80211_CMD_SET_TID_CONFIG command. TID for which the
> this configuration is to be applied is passed in
> NL80211_TID_ATTR_CONFIG_TID attribute. TX bitrate mask values passed
> in NL80211_ATTR_TX_RATES attribute and NL80211_TID_ATTR_CONFIG_TX_RATES
> attribute will have types of the TX rate should be applied.
> When the user-space wants this configuration peer specific
> rather than being applied for all the connected stations,
> MAC address of the peer can be passed in NL80211_ATTR_MAC attribute.
> 
> Driver supporting this feature should advertise
> NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK and supporting per-STA data TID
> TX bitrate configuration should advertise
> NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK.
> 
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>

...

>         if (info->attrs[NL80211_ATTR_TX_RATES]) {
> -               err = nl80211_parse_tx_bitrate_mask(info, &params.beacon_rate);
> +               err = nl80211_parse_tx_bitrate_mask(info, info->attrs,
> +                                                   NL80211_ATTR_TX_RATES,
> +                                                   &params.beacon_rate);
>                 if (err)
>                         return err;
> 

Could you please clarify this change of nl80211_parse_tx_bitrate_mask arguments.
Unless I missing something, the appropriate change for nl80211_parse_tx_bitrate_mask
is not included into this patch set.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
