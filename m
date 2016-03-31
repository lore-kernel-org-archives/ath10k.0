Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aleZa-0007oK-Rv
 for ath10k@lists.infradead.org; Thu, 31 Mar 2016 15:31:53 +0000
Received: by mail-ig0-x22d.google.com with SMTP id ui10so60893524igc.1
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 08:31:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQm5-Yarw9TTLiN4jvuH2cdELxRBQvJ_+TFmthZkMBOVyg@mail.gmail.com>
References: <1459368643-13300-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQm5-Yarw9TTLiN4jvuH2cdELxRBQvJ_+TFmthZkMBOVyg@mail.gmail.com>
Date: Thu, 31 Mar 2016 08:31:29 -0700
Message-ID: <CAJ-VmonC=NaXmLbboyJwmQSOg6yt_1aQgU8WYQRZk65KViE14Q@mail.gmail.com>
Subject: Re: [PATCH] wmi: Retry if CE logic is out of buffers.
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 30 March 2016 at 23:55, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 30 March 2016 at 22:10,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> I believe the CE tx buffer reaping logic may be able to fall
>> behind in certain cases (lots of serial console logging, lots
>> of WMI messages).
>>
>> Dropping WMI messages is a very serious problem, so it is worth
>> waiting a bit in hopes the tx buffers become available again.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>
>> Probably the ath10k_err should be made dbg or rate-limited before
>> this goes upstream..in meantime, it might help shed some light on
>> this problem.
>>
>>  drivers/net/wireless/ath/ath10k/wmi.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>> index f042711..43d23fc 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -1819,6 +1819,7 @@ static void ath10k_wmi_op_ep_tx_credits(struct ath10k *ar)
>>  int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
>>  {
>>         int ret = -EOPNOTSUPP;
>> +       int retry = 1000;
>>
>>         might_sleep();
>>
>> @@ -1832,7 +1833,19 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
>>                 /* try to send pending beacons first. they take priority */
>>                 ath10k_wmi_tx_beacons_nowait(ar);
>>
>> -               ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
>> +               while (--retry) {
>> +                       ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
>> +                       if ((ret == -ENOBUFS) &&
>> +                           !test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
>> +                               /* CE transport logic is full, maybe we cannot reap entries fast
>> +                                * enough?
>> +                                */
>> +                               ath10k_err(ar, "CE transport is full, sleeping for 1ms\n");
>> +                               msleep(1);
>> +                               continue;
>> +                       }
>> +                       break;
>> +               }
>
> This looks like a workaround to me. This problem shouldn't be
> happening in the first place as far as design is concerned.
>
> If it does the only reason I can think of is if MSI-range support is exercised.
>
> Anyway, It'd be a lot more sane to instead poll WMI's CE Tx pipe when
> processing WMI's CE Rx pipe (but that's still -arguably- unnecessary)
> instead of retrying in WMI..

I think polling TX when processing WMI RX isn't a bad idea. If Ben's
doing a lot of WMI stuff then the interrupt latency or scheduling may
be getting in the way.

But I'd like to first verify that the problem isn't something silly
like you're not seeing the interrupt because it didn't fire in the
first place...


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
