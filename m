Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlI0e-0003ov-Oj
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:17:13 +0000
Received: by mail-lb0-f178.google.com with SMTP id w7so1900424lbi.23
 for <ath10k@lists.infradead.org>; Fri, 16 May 2014 06:16:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53760CEA.1000500@candelatech.com>
References: <1400178894-26206-1-git-send-email-greearb@candelatech.com>
 <CALhHN=o6zrn_0rtEJzfZsaJp5b8JoGNew-qq_=LU6Uh-XJbJ6g@mail.gmail.com>
 <53760CEA.1000500@candelatech.com>
Date: Fri, 16 May 2014 15:16:50 +0200
Message-ID: <CALhHN=oriD4jGQEQ9XQ5Q0bzR31HkkW6F-tJ7xuRd8pAAs3fKA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix rssi reporting.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 16 May 2014 15:04, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 05/16/2014 05:18 AM, Janusz Dziedzic wrote:
>>
>> On 15 May 2014 20:34,  <greearb@candelatech.com> wrote:
>>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> When the driver cannot provide proper rssi, mark
>>> status with RX_FLAG_NO_SIGNAL_VAL so that stack
>>> properly ignores it.
>>>
>> I think we should skip this one while we know rssi/rates.
>> They are correct for all packets between START_VALID and END_VALID flags.
>
>
> Skip what, the patch?  With current code, you are sending packets up
> the tree without signal being set and yet without the flag set that says
> to ignore the (unset) signal value.
>
Didn't reproduce this yet, while we have this values saved when
START_VALID - rx status is an template in htt structure.

struct ieee80211_rx_status *rx_status = &htt->rx_status;

Are you sure you have all patches?
This could be passible if we will get first packet with only flag
END_VALID (not sure this is even possible). In case we get packets
with START valid before, we will use template correctly. In case we
will get packets with flags START and END valid we will also reports
this correctly.
Did you reproduce this with official firmware?

BTW
your patch break rates info based also on htt->rx_status template.

BR
Janusz


>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>> ---
>>>
>>> Patch is against my tree, hopefully will apply OK against upstream
>>> but have not tested that yet.
>>>
>>>   drivers/net/wireless/ath/ath10k/htt_rx.c | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> index 0c83ffb..d8ec8dd 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> @@ -1216,11 +1216,12 @@ static void ath10k_htt_rx_handler(struct
>>> ath10k_htt *htt,
>>>          mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
>>>
>>>          /* Fill this once, while this is per-ppdu */
>>> -       if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID) {
>>> -               memset(rx_status, 0, sizeof(*rx_status));
>>> +       memset(rx_status, 0, sizeof(*rx_status));
>>> +       if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID)
>>>                  rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR +
>>>                                       rx->ppdu.combined_rssi;
>>> -       }
>>> +       else
>>> +               rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
>>>
>>>          if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
>>>                  /* TSF available only in 32-bit */
>>> --
>>> 1.7.11.7
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
