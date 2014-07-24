Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XADHr-00016k-Q5
 for ath10k@lists.infradead.org; Thu, 24 Jul 2014 07:18:01 +0000
Received: by mail-la0-f41.google.com with SMTP id s18so1593995lam.0
 for <ath10k@lists.infradead.org>; Thu, 24 Jul 2014 00:17:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87egxdv0u2.fsf@kamboji.qca.qualcomm.com>
References: <1405672472-16302-1-git-send-email-janusz.dziedzic@tieto.com>
 <87egxdv0u2.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 24 Jul 2014 09:17:29 +0200
Message-ID: <CALhHN=oOWgAhWL4B15OduHuL-qrLs3DaSMnpYJDa1xqmK=aZ6Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: extend debug code for RX path
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 22 July 2014 18:02, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Print sequence number, AMSDU_MORE flag and AC when additional
>> debug enabled in RX path. This is usefull for debugging purpose.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/htt_rx.c |   32 ++++++++++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> index 6db0e49..04140e3 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> @@ -819,19 +819,46 @@ static bool ath10k_htt_rx_h_channel(struct ath10k *ar,
>>       return true;
>>  }
>>
>> +static char *tid_to_ac[] = {
>
> static const?
>
>> +     "BE(0)",
>> +     "BK(1)",
>> +     "BK(2)",
>> +     "BE(3)",
>> +     "VI(4)",
>> +     "VI(5)",
>> +     "VO(6)",
>> +     "VO(7)",
>> +     "tid(8)",
>> +     "tid(9)",
>> +     "tid(10)",
>> +     "tid(11)",
>> +     "tid(12)",
>> +     "tid(13)",
>> +     "tid(14)",
>> +     "tid(15)",
>> +};
>
> I don't see much point of adding tid number to the string when you could
> print it with "%i". Also about the string format, maybe this would be
> clearer:
>
> "rx skb %p len %u peer %pM tid %i (%s) sn %u"
>
> For example "...tid 4 (VI)..." and for tid > 7 we don't print "(VI)"
> part at all, just the number.
>
tid don't need to be always present (eg sta with disabled qos).
So I can use:
- table as above
- buffer[] + snprintf() + %i
Depends what you prefer here.

>>  static void ath10k_process_rx(struct ath10k *ar,
>>                             struct ieee80211_rx_status *rx_status,
>>                             struct sk_buff *skb)
>>  {
>>       struct ieee80211_rx_status *status;
>> +     struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>>
>>       status = IEEE80211_SKB_RXCB(skb);
>>       *status = *rx_status;
>>
>>       ath10k_dbg(ATH10K_DBG_DATA,
>> -                "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %imic-err %i\n",
>> +                "rx skb %p len %u peer %pM %s sn %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
>>                  skb,
>>                  skb->len,
>> +                ieee80211_get_SA(hdr),
>
> This looks ok.
>
>> +                ieee80211_is_data_qos(hdr->frame_control) ?
>> +                     (tid_to_ac[*(ieee80211_get_qos_ctl(hdr)) &
>> +                                IEEE80211_QOS_CTL_TID_MASK]) :
>> +                     (is_multicast_ether_addr(ieee80211_get_DA(hdr)) ?
>> +                             "mcast" : "ucast"),
>> +                (__le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4,
>
> But this is hard to read. Is it possible to have a helper function for
> this?
Sure I can put this in the function.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
