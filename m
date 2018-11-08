Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKo80-0003zk-I6
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 17:30:02 +0000
MIME-Version: 1.0
Date: Thu, 08 Nov 2018 22:59:48 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
In-Reply-To: <20181106101601.526ovvmabfqrr7sl@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
 <20181106101601.526ovvmabfqrr7sl@bars>
Message-ID: <7a8662ce7744bee6d9e695c67d7e9643@codeaurora.org>
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
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, johannes@sipsolutions.net, linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, ath10k@lists.infradead.org

On 2018-11-06 15:46, Sergey Matyukevich wrote:
> Hello Tamizh,
> 
>> Co-Developed-by: Tamizh Chelvam <tamizhr@codeaurora.org>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
>> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
>> ---
>>  include/net/cfg80211.h       |   14 +++++++
>>  include/uapi/linux/nl80211.h |   69 +++++++++++++++++++++++++++++++++
>>  net/wireless/nl80211.c       |   86 
>> ++++++++++++++++++++++++++++++++++++++++++
>>  net/wireless/rdev-ops.h      |   15 ++++++++
>>  net/wireless/trace.h         |   27 +++++++++++++
>>  5 files changed, 211 insertions(+)
> 
> ...
> 
>> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
>> index 5801d76..dd024da 100644
>> --- a/include/net/cfg80211.h
>> +++ b/include/net/cfg80211.h
> 
> ...
> 
>>  /**
>> @@ -4035,6 +4044,9 @@ struct wiphy_iftype_ext_capab {
>>   * @txq_limit: configuration of internal TX queue frame limit
>>   * @txq_memory_limit: configuration internal TX queue memory limit
>>   * @txq_quantum: configuration of internal TX queue scheduler quantum
>> + *
>> + * @max_data_retry_count: Maximum limit can be configured as retry 
>> count
>> + *     for a TID.
>>   */
>>  struct wiphy {
>>         /* assign these fields before you register the wiphy */
>> @@ -4171,6 +4183,8 @@ struct wiphy {
>>         u32 txq_memory_limit;
>>         u32 txq_quantum;
>> 
>> +       u8 max_data_retry_count;
>> +
>>         char priv[0] __aligned(NETDEV_ALIGN);
>>  };
> 
> Could you please clarify why do you define max_data_retry_count instead 
> of
> making use of existing wiphy params: retry_short (dot11ShortRetryLimit)
> and retry_long (dot11LongRetryLimit) ?

max_data_retry_count added to validate the max limit for the retry count 
supported by the driver.
existing wiphy parames: retry_short and retry_long can be modified 
through user command.
So, I've added this param for validation purpose. Correct me If I'm 
wrong.
> 
>> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
>> index d744388..d386ad7 100644
>> --- a/net/wireless/nl80211.c
>> +++ b/net/wireless/nl80211.c
> 
> ...
> 
>> +static int nl80211_set_tid_config(struct sk_buff *skb,
>> +                                 struct genl_info *info)
>> +{
>> +       struct cfg80211_registered_device *rdev = info->user_ptr[0];
>> +       struct nlattr *attrs[NL80211_ATTR_TID_MAX + 1];
>> +       struct nlattr *tid;
>> +       struct net_device *dev = info->user_ptr[1];
>> +       const char *peer = NULL;
>> +       u8 tid_no;
>> +       int ret = -EINVAL, retry_short = -1, retry_long = -1;
>> +
>> +       tid = info->attrs[NL80211_ATTR_TID_CONFIG];
>> +       if (!tid)
>> +               return -EINVAL;
>> +
>> +       ret = nla_parse_nested(attrs, NL80211_ATTR_TID_MAX, tid,
>> +                              nl80211_attr_tid_policy, info->extack);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (!attrs[NL80211_ATTR_TID])
>> +               return -EINVAL;
>> +
>> +       if (attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
>> +               retry_short = 
>> nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_SHORT]);
>> +               if (!retry_short ||
>> +                   retry_short > rdev->wiphy.max_data_retry_count)
>> +                       return -EINVAL;
>> +       }
>> +
>> +       if (attrs[NL80211_ATTR_TID_RETRY_LONG]) {
>> +               retry_long = 
>> nla_get_u8(attrs[NL80211_ATTR_TID_RETRY_LONG]);
>> +               if (!retry_long ||
>> +                   retry_long > rdev->wiphy.max_data_retry_count)
>> +                       return -EINVAL;
>> +       }
>> +
>> +       tid_no = nla_get_u8(attrs[NL80211_ATTR_TID]);
>> +       if (tid_no >= IEEE80211_FIRST_TSPEC_TSID)
>> +               return -EINVAL;
> 
> Not that important, but this tid_no check can be placed after
> attrs[NL80211_ATTR_TID].
> 
> BTW, some special tid_no value (e.g. (u8)-1) could be used to notify 
> driver
> that retry settings should be applied for all the TIDs. IIUC the only
> required change would be to modify this tid_no sanity check.

Sure, we can use that.
> 
> Regards,
> Sergey

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
