Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEent-0005tk-5V
 for ath10k@lists.infradead.org; Mon, 13 Jul 2015 14:33:57 +0000
Message-ID: <55A3CC3E.20502@candelatech.com>
Date: Mon, 13 Jul 2015 07:33:34 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Making 10.1.467 based CT firmware do mgt-over-htt
References: <55A34044.1060009@candelatech.com>
 <CA+BoTQnyaZYkhq4waqEsHcoupBO4ppsub7BqU-XXY+a5qEApQQ@mail.gmail.com>
In-Reply-To: <CA+BoTQnyaZYkhq4waqEsHcoupBO4ppsub7BqU-XXY+a5qEApQQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 07/12/2015 11:04 PM, Michal Kazior wrote:
> On 13 July 2015 at 06:36, Ben Greear <greearb@candelatech.com> wrote:
>> I have been working on making my CT firmware able to do mgt frames
>> over the normal HTT transport instead of over wmi.  This should
>> significantly
>> improve APs that are trying to deal with stations going out of range.
>>
>> A fairly trivial change in the firmware lets ath10k in station mode
>> associate in both
>> OPEN and WPA2 (I did not test further at this time).
>>
>> But, on the AP side, this same change ends up with probe responses going
>> out with 10 bytes missing from the end of the frame.  If I simply do a
>> skb_put(foo, 10)
>> before sending to firmware, then AP mode works (OPEN, against ath9k AP).
>>
>> But, this skb_put() breaks the station (OS crashed and rebooted).
>>
>> I can probably find a particular set of logic that puts or does not put
>> the 10 extra bytes accordingly, but I am curious if anyone knows any reason
>> that AP mode frames are different.  I did find some code
>> in firmware that basically subtracts 10 bytes from length:
>> len -= (sizeof(struct ieee80211_frame) - WAL_DE_ETHR_HDR_LEN))
>>
>> This happens for all native wifi pkts though.  Is there some reason why a
>> probe response (and maybe other mgt frames?) would not be built for native
>> wifi?
>>
>> use_frags in htt_tx.c will be TRUE in my case, because htt version is 2.2 in
>> my firmware.
>
> Perhaps that is the problem right there? HTT 3.0 doesn't use tx frags
> for mgmt frames. I didn't investigate the reason but I recall someone
> saying that there are some issues with tx frags for mgmt frames..

Yeah, but I am not sure what that would be at this point.  Possibly this was
just laziness on part of firmware or some other hack.  If someone does know
this reason, I'm interested in learning it.

>> My driver patch looks like this currently:
>>
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h
>> b/drivers/net/wireless/ath/ath10k/core.h
>> index c2c1f2d..d291121 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -570,6 +570,7 @@ struct ath10k {
>>          DECLARE_BITMAP(fw_features, ATH10K_FW_FEATURE_COUNT);
>>
>>          bool p2p;
>> +       bool all_pkts_htt; /* target has no separate mgmt tx command? */
>
> I don't like this idea.
>
> Perhaps we should instead introduce a new IE to explicitly describe
> what command should be used for mgmt tx? We'd have at least 3 values
> to express: wmi_mgmt_tx, htt_mgmt_tx, htt_tx.

I think it is better to calculate these booleans once instead of doing the
work each time in the hot path.  I would assume this would be more efficient,
and also it keeps the hacks to determine the booleans out of the
generic code.


>>          struct {
>>                  enum ath10k_bus bus;
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> index 815f7fc..a07ce92 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> @@ -1932,6 +1932,15 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar,
>> struct sk_buff *skb)
>>          case HTT_T2H_MSG_TYPE_VERSION_CONF: {
>>                  htt->target_version_major = resp->ver_resp.major;
>>                  htt->target_version_minor = resp->ver_resp.minor;
>> +
>> +               if ((htt->target_version_major >= 3) ||
>> +                   /* CT firmware with HTT-MGT */
>> +                   (htt->target_version_major == 2 &&
>> +                    htt->target_version_minor == 2))
>> +                       ar->all_pkts_htt = true;
>> +               else
>> +                       ar->all_pkts_htt = false;
>> +
>
> I wouldn't rely on HTT versioning...

The code is already doing similar things.  Adding IEs are just as risky for me
because CT firmware hacks will not be accepted upstream and IEs tend to collide
since I cannot reserve enums.

Either way, I suspect there will not be upstream support for my firmware, but
if I can get any related code upstream that makes my patches smaller, then I
consider that a gain.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
