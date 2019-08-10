Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwQgN-0003j5-Uf
 for ath10k@lists.infradead.org; Sat, 10 Aug 2019 12:41:17 +0000
MIME-Version: 1.0
Date: Sat, 10 Aug 2019 18:11:14 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv6 3/9] nl80211: Add netlink attribute for AMPDU
 aggregation enable/disable
In-Reply-To: <1077c62701b31cfcb4436e6b13be64ade6b1ae1b.camel@sipsolutions.net>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-4-git-send-email-tamizhr@codeaurora.org>
 <1077c62701b31cfcb4436e6b13be64ade6b1ae1b.camel@sipsolutions.net>
Message-ID: <e704b7dd39c86c2596b6c0861a376117@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-07-31 14:58, Johannes Berg wrote:
> On Tue, 2019-06-18 at 10:57 +0530, Tamizh chelvam wrote:
>> 
>> +		if (!wiphy_ext_feature_isset(&rdev->wiphy,
>> +				NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL)) {
>> +			NL_SET_ERR_MSG_ATTR(extack,
>> +					    attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
>> +					    "TID specific configuration not "
>> +					    "supported");
>> +			return -ENOTSUPP;
>> +		}
>> +
>> +		if (peer && !wiphy_ext_feature_isset(&rdev->wiphy,
>> +				NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL)) {
>> +			NL_SET_ERR_MSG_ATTR(extack,
>> +					    attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
>> +					    "peer specfic TID configuration not "
>> +					    "supported");
>> +			return -ENOTSUPP;
>> +		}
> 
> I think you should probably make this be a function to which you pass
> the attribute pointer and feature flags.
> 
> err = nl80211_check_tid_config_supported(extack,
> 					 attrs[NL80211_TID_ATTR_CONFIG_AMPDU_CTRL],
> 					 NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL,
> 					 NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL);
> 
> since you have this code a lot?
> 
Sure, I will make that change in the next version of patchset.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
