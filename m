Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKoP1-00044x-L0
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 17:47:36 +0000
MIME-Version: 1.0
Date: Thu, 08 Nov 2018 23:17:22 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCH 1/4] New netlink command for TID specific configuration
In-Reply-To: <20181107140552.zfuusbapgqjumoln@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <1540230918-27712-2-git-send-email-tamizhr@codeaurora.org>
 <20181107140552.zfuusbapgqjumoln@bars>
Message-ID: <0b75171a7777bd25e203240a3a119cb5@codeaurora.org>
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
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, ath10k@lists.infradead.org


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
>> +
>> +       if (info->attrs[NL80211_ATTR_MAC])
>> +               peer = nla_data(info->attrs[NL80211_ATTR_MAC]);
>> +
>> +       if (nla_get_flag(attrs[NL80211_ATTR_TID_RETRY_CONFIG])) {
> 
> Do we really need this additional flag to indicate retry data ?
> Maybe we can simply check retry attrs or even retry data, e.g.:

Yes, because this implementation gives provision to set default retry 
count for TID traffic type for a station.
Since we use single NL command for all TID configurations, this flag 
will be useful to notify the driver about
retry TID configuration change.
> 
> if (attrs[NL80211_ATTR_TID_RETRY_LONG] ||
>     attrs[NL80211_ATTR_TID_RETRY_SHORT]) {
>     ...
> 
> if ((retry_short > 0) || (retry_long > 0)) {
>     ...
> 
>> +               if (!wiphy_ext_feature_isset(
>> +                               &rdev->wiphy,
>> +                               
>> NL80211_EXT_FEATURE_PER_TID_RETRY_CONFIG))
>> +                       return -EOPNOTSUPP;
>> +
>> +               if (peer && !wiphy_ext_feature_isset(
>> +                               &rdev->wiphy,
>> +                               
>> NL80211_EXT_FEATURE_PER_STA_RETRY_CONFIG))
>> +                       return -EOPNOTSUPP;
>> +
>> +               if (!rdev->ops->set_data_retry_count ||
>> +                   !rdev->wiphy.max_data_retry_count)
>> +                       return -EOPNOTSUPP;
>> +
>> +               ret = rdev_set_data_retry_count(rdev, dev, peer, 
>> tid_no,
>> +                                               retry_short, 
>> retry_long);
>> +       }
>> +
>> +       return ret;
>> +}
> 
> Regards,
> Sergey

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
