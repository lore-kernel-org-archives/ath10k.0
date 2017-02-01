Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYzA3-00071z-TT
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 17:57:41 +0000
MIME-Version: 1.0
Date: Wed, 01 Feb 2017 23:27:18 +0530
From: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Subject: Re: [PATCH v2 1/2] cfg80211: Add support to set tx power for a
 station associated
In-Reply-To: <2b68dc12-44bf-f510-339a-3d987a88e8b5@candelatech.com>
References: <1485888101-23454-1-git-send-email-arnagara@qti.qualcomm.com>
 <12efc3d8-2274-a6e8-6d74-c06bf89762fb@candelatech.com>
 <14f6b3acb8b26d0eb806148c0ee47fb0@codeaurora.org>
 <2b68dc12-44bf-f510-339a-3d987a88e8b5@candelatech.com>
Message-ID: <1f3a3dec67fbe4f580750eb06f9b628b@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2017-02-01 23:06, Ben Greear wrote:
> On 02/01/2017 09:27 AM, Ashok Raj Nagarajan wrote:
> 
>>>> +static int nl80211_parse_sta_txpower_setting(struct genl_info 
>>>> *info,
>>>> +                         struct station_parameters *params)
>>>> +{
>>>> +    struct cfg80211_registered_device *rdev = info->user_ptr[0];
>>>> +    enum nl80211_tx_power_setting type;
>>>> +    int idx;
>>>> +
>>>> +    if (!rdev->ops->set_tx_power ||
>>>> +        !wiphy_ext_feature_isset(&rdev->wiphy,
>>>> +                     NL80211_EXT_FEATURE_STA_TX_PWR))
>>>> +        return -EOPNOTSUPP;
>>> 
>>> Maybe always let a user set to default value even if the driver does 
>>> not
>>> support setting specific values?
>>> 
>> 
>> IMHO, having some default value in place of non-valid values may not 
>> be the right way.
> 
> If a user or user-space script wants to always be able to initialize
> things to default
> values, it would be nice if it did not have to pay specific attention
> to whether the
> NIC supports STA_TX_PWR feature or not.  Since a NIC that does not
> support this feature will always
> have sta TX power set to default by definition, that is why I think
> you should let
> the call succeed in that case.
> 

I think it would be better/easier to handle the error cases in the 
user-space scripts than at the driver here, no? NIC that doesn't support 
this feature will set the tx power to the station depending on the rate 
algorithm in place. So the same NIC and same station will have different 
txpower depending on the environment? On the other hand, how do we 
decide what constant (?) default value to be sent to userspace?

Thanks,
Ashok

> Thanks,
> Ben

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
