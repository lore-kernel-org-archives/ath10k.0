Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hslXA-0001bB-Mb
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 10:08:37 +0000
MIME-Version: 1.0
Date: Wed, 31 Jul 2019 15:38:35 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv6 5/9] nl80211: Add netlink attribute to configure TID
 specific tx rate
In-Reply-To: <20190711125442.unlaqjl5nnqgsbod@bars>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
 <20190711125442.unlaqjl5nnqgsbod@bars>
Message-ID: <e306b921ab10228a40eb1958de8e6173@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-07-11 18:24, Sergey Matyukevich wrote:
>> Introduce NL80211_TID_ATTR_CONFIG_TX_RATES in nl80211_tid_attr_config
>> to accept data TID specific TX bitrate configuration
>> through NL80211_CMD_SET_TID_CONFIG command. TID for which the
>> this configuration is to be applied is passed in
>> NL80211_TID_ATTR_CONFIG_TID attribute. TX bitrate mask values passed
>> in NL80211_ATTR_TX_RATES attribute and 
>> NL80211_TID_ATTR_CONFIG_TX_RATES
>> attribute will have types of the TX rate should be applied.
>> When the user-space wants this configuration peer specific
>> rather than being applied for all the connected stations,
>> MAC address of the peer can be passed in NL80211_ATTR_MAC attribute.
>> 
>> Driver supporting this feature should advertise
>> NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK and supporting per-STA 
>> data TID
>> TX bitrate configuration should advertise
>> NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK.
>> 
>> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> 
> ...
> 
>>         if (info->attrs[NL80211_ATTR_TX_RATES]) {
>> -               err = nl80211_parse_tx_bitrate_mask(info, 
>> &params.beacon_rate);
>> +               err = nl80211_parse_tx_bitrate_mask(info, info->attrs,
>> +                                                   
>> NL80211_ATTR_TX_RATES,
>> +                                                   
>> &params.beacon_rate);
>>                 if (err)
>>                         return err;
>> 
> 
> Could you please clarify this change of nl80211_parse_tx_bitrate_mask 
> arguments.
> Unless I missing something, the appropriate change for
> nl80211_parse_tx_bitrate_mask
> is not included into this patch set.

Yeah. These arguments are missed in the function definition place:( I 
will fix this rebase issue in next version.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
