Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4ypR-0000AL-Gq
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 21:55:34 +0000
Message-ID: <55809B3E.10300@candelatech.com>
Date: Tue, 16 Jun 2015 14:55:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on beacon-miss offloading.
References: <5579F87F.4070601@candelatech.com>
 <557A1BE9.7070305@candelatech.com>
 <CA+BoTQkLyaP-2sHiu7Wn-ZzGj2JnZs4qzQKGu7PiTtUy4d9xLQ@mail.gmail.com>
 <557AFC9D.3020109@candelatech.com>
 <CA+BoTQkn+Ro1+=PPe=1aHT519jW3BtF+Mmspy+kQftufpUiTPA@mail.gmail.com>
 <557EF0B0.7070008@candelatech.com> <557F2B43.8060409@candelatech.com>
 <CA+BoTQ=jYu2BV1rkaLwF_d5ZdDgsiws0TrWE7NGXmRsz8hMFVA@mail.gmail.com>
In-Reply-To: <CA+BoTQ=jYu2BV1rkaLwF_d5ZdDgsiws0TrWE7NGXmRsz8hMFVA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 06/15/2015 10:29 PM, Michal Kazior wrote:

>> This patch below (with firmware fix to make it actually pay attention
>> to this special TID in station mode), fixes the null-func to be non-qos
>> frames and get immediate ack.  This in turn seems to fix the disconnect
>> issue I was facing, though I need to test some more to be sure.
>>
>> This seem reasonable, maybe even for upstream?
>>
>> [greearb@ben-dt2 ath10k]$ git diff
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 6ca48e3..610447e 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -2213,6 +2213,9 @@ static u8 ath10k_tx_h_get_tid(struct ieee80211_hdr *hdr)
>>         if (ieee80211_is_mgmt(hdr->frame_control))
>>                 return HTT_DATA_TX_EXT_TID_MGMT;
>>
>> +       if (ieee80211_is_nullfunc(hdr->frame_control))
>> +               return HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;
>> +
> 
> That's weird.. QoS NullFunc frames are already converted to non-QoS
> frames, see ath10k_tx_h_nwifi():

True, but the 4.0.4 kernel sends down non-qos null-func frames as far
as I can tell, at least when doing connection probing.

In my case, my kernel was sending non-qos nullfunc frame to firmware, but then
firmware stuck it on BE queue and made it QoS.

>         /* Some firmware revisions don't handle sending QoS NullFunc well.
>          * These frames are mainly used for CQM purposes so it doesn't really
>          * matter whether QoS NullFunc or NullFunc are sent.
>          */
>         hdr = (void *)skb->data;
>         if (ieee80211_is_qos_nullfunc(hdr->frame_control))
>                 cb->htt.tid = HTT_DATA_TX_EXT_TID_NON_QOS_MCAST_BCAST;
> 
> Or is it that ath10k_tx_h_get_tid() has a bug that ends up assigning
> an invalid tid for non-QoS NullFunc frames? If so I guess your patch
> would be okay with some comments/commit-log explaining why/what was
> wrong.

I tried very recent upstream ath kernel, and stock firmware-2.bin, and it
seems to generate null-func frames fine.  I'll go back at look at my
recent FW and kernel changes in more detail now that I understand the problem
better and see if I can figure out what is going on...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
