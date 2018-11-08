Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKjQh-0007pD-JL
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 12:29:01 +0000
MIME-Version: 1.0
Date: Thu, 08 Nov 2018 17:58:45 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCH 2/4] nl80211: Add netlink attribute for AMPDU aggregation
 enable/disable
In-Reply-To: <20181106102051.7erib7owjms64knl@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-3-git-send-email-tamizhr@codeaurora.org>
 <20181106102051.7erib7owjms64knl@bars>
Message-ID: <8a8444300c7fc772b0fb219e08c88498@codeaurora.org>
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
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Sergey,

> Hello Tamizh,
> 
>> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
>> ---
>>  include/net/cfg80211.h       |    6 ++++++
>>  include/uapi/linux/nl80211.h |   21 +++++++++++++++++++++
>>  net/wireless/nl80211.c       |   17 +++++++++++++++++
>>  net/wireless/rdev-ops.h      |   15 +++++++++++++++
>>  net/wireless/trace.h         |   23 +++++++++++++++++++++++
>>  5 files changed, 82 insertions(+)
> ...
> 
>> diff --git a/include/uapi/linux/nl80211.h 
>> b/include/uapi/linux/nl80211.h
>> index 9dfcf0a6..7ba0fb7 100644
>> --- a/include/uapi/linux/nl80211.h
>> +++ b/include/uapi/linux/nl80211.h
>> @@ -4449,6 +4449,20 @@ enum nl80211_ps_state {
>>   *     the max value should be advertised by the driver through
>>   *     max_data_retry_count. when this attribute is not present, the 
>> driver
>>   *     would use the default configuration.
>> + * @NL80211_ATTR_TID_AMPDU_AGGR_CTRL: Enable/Disable aggregation for 
>> the TID
>> + *     specified in %%NL80211_ATTR_TID. Its type is u8, if the peer 
>> MAC address
>> + *     is passed in %NL80211_ATTR_MAC, the aggregation configuration 
>> is applied
>> + *     to the data frame for the tid to that connected station.
>> + *     Station specific aggregation configuration is valid only for 
>> STA's
>> + *     current connection. i.e. the configuration will be reset to 
>> default when
>> + *     the station connects back after disconnection/roaming.
>> + *     when user-space does not include %NL80211_ATTR_MAC, this 
>> configuration
>> + *     should be treated as per-netdev configuration. This 
>> configuration will
>> + *     be cleared when the interface goes down and on the 
>> disconnection from a
>> + *     BSS. Driver supporting this feature should advertise
>> + *     NL80211_EXT_FEATURE_PER_STA_AMPDU_AGGR_CTRL and supporting per 
>> station
> 
> typo: should be NL80211_EXT_FEATURE_PER_TID_AMPDU_AGGR_CTRL
Sure, I'll update in the next version.
> 
>> + *     aggregation configuration should advertise
>> + *     NL80211_EXT_FEATURE_PER_STA_AMPDU_AGGR_CTRL.
>>   */
> 
> Regards,
> Sergey

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
