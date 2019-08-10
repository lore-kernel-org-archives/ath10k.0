Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwQfR-0003dN-TL
 for ath10k@lists.infradead.org; Sat, 10 Aug 2019 12:40:19 +0000
MIME-Version: 1.0
Date: Sat, 10 Aug 2019 18:10:17 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
In-Reply-To: <ea1f9969b52fed2da8b0e88ed8b06527bfc272aa.camel@sipsolutions.net>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
 <ea1f9969b52fed2da8b0e88ed8b06527bfc272aa.camel@sipsolutions.net>
Message-ID: <be096df17632b1a71441a23a373682bf@codeaurora.org>
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

On 2019-07-31 14:55, Johannes Berg wrote:
> On Tue, 2019-06-18 at 10:57 +0530, Tamizh chelvam wrote:
>> 
>>  /**
>> + * enum nl80211_tid_config - TID config state
>> + * @NL80211_TID_CONFIG_DEFAULT: Default config for the TID
>> + * @NL80211_TID_CONFIG_ENABLE: Enable config for the TID
>> + * NL80211_TID_CONFIG_DISABLE: Disable config for the TID
>> + */
>> +enum nl80211_tid_config {
>> +	NL80211_TID_CONFIG_DEFAULT,
>> +	NL80211_TID_CONFIG_ENABLE,
>> +	NL80211_TID_CONFIG_DISABLE,
>> +};
> 
> Hmm. Looking at this in more detail in patch 3, I don't understand.
> 
> How is DEFAULT different from "attribute not present", i.e. "no
> changes"?
> 
This DEFAULT is used to notify the driver to use default configuration 
value of driver/vif.
This will be used when the attribute is not present.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
