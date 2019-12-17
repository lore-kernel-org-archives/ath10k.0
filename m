Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFd6-0002Rt-Gr
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 16:23:26 +0000
Received: by mail-ot1-x343.google.com with SMTP id h20so14368387otn.5
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 08:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20191216220747.887-1-greearb@candelatech.com>
 <a2af03e9-8b53-b297-467b-d0f07b8a002b@newmedia-net.de>
 <b5d63d96-4ba6-bbab-bf1c-a61c6c437f37@newmedia-net.de>
 <80700614-679a-336e-bd9a-e88622e75c9a@candelatech.com>
 <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
In-Reply-To: <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
From: Justin Capella <justincapella@gmail.com>
Date: Tue, 17 Dec 2019 08:23:10 -0800
Message-ID: <CAMrEMU-vGB8uR-JZbD2vj4vXgWNHfFqcbsqB=gOqBBDZWGkzQA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

I believe someone recently submitted a patch that defined noise floors
per band (2/5).

Can't say I'm a fan of the hacky code, in particular the if/else for
min/max // maybe abs(a-b)?

if (e40 != 0x80) { // whats this case about?

Are there reasons to not use log?




On Tue, Dec 17, 2019 at 7:59 AM Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:
>
>
> >> currently debugging in your code, but i already have seen that the
> >> values are wrong now for this chipset
> >
> > Thanks for testing.  I'll add a check for 0 and ignore that value
> > too.  That seem OK?
> i tested already the 0 check and it works
> >
> > Were the per-chain values OK?
> on 9984 i see no disadvantage so far. seem to work and the values look
> sane. i will do a side by side comparisation later this day on 9984
> >
> > Thanks,
> > Ben
> >
> >>>
> >>> Am 16.12.2019 um 23:07 schrieb greearb@candelatech.com:
> >>>> From: Ben Greear <greearb@candelatech.com>
> >>>>
> >>>> This makes per-chain RSSI be more consistent between HT20, HT40, HT80.
> >>>> Instead of doing precise log math for adding dbm, I did a rough
> >>>> estimate,
> >>>> it seems to work good enough.
> >>>>
> >>>> Tested on ath10k-ct 9984 firmware.
> >>>>
> >>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> >>>> ---
> >>>>   drivers/net/wireless/ath/ath10k/htt_rx.c  | 64
> >>>> ++++++++++++++++++++---
> >>>>   drivers/net/wireless/ath/ath10k/rx_desc.h |  3 +-
> >>>>   2 files changed, 60 insertions(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c
> >>>> b/drivers/net/wireless/ath/ath10k/htt_rx.c
> >>>> index 13f652b622df..034d4ace228d 100644
> >>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> >>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> >>>> @@ -1167,6 +1167,44 @@ static bool ath10k_htt_rx_h_channel(struct
> >>>> ath10k *ar,
> >>>>       return true;
> >>>>   }
> >>>>   +static int ath10k_sum_sigs_2(int a, int b) {
> >>>> +    int diff;
> >>>> +
> >>>> +    if (b == 0x80)
> >>>> +        return a;
> >>>> +
> >>>> +    if (a >= b) {
> >>>> +        diff = a - b;
> >>>> +        if (diff == 0)
> >>>> +            return a + 3;
> >>>> +        else if (diff == 1)
> >>>> +            return a + 2;
> >>>> +        else if (diff == 2)
> >>>> +            return a + 1;
> >>>> +        return a;
> >>>> +    }
> >>>> +    else {
> >>>> +        diff = b - a;
> >>>> +        if (diff == 0)
> >>>> +            return b + 3;
> >>>> +        else if (diff == 1)
> >>>> +            return b + 2;
> >>>> +        else if (diff == 2)
> >>>> +            return b + 1;
> >>>> +        return b;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +static int ath10k_sum_sigs(int p20, int e20, int e40, int e80) {
> >>>> +    /* Hacky attempt at summing dbm without resorting to log(10)
> >>>> business */
> >>>> +    if (e40 != 0x80) {
> >>>> +        return ath10k_sum_sigs_2(ath10k_sum_sigs_2(p20, e20),
> >>>> ath10k_sum_sigs_2(e40, e80));
> >>>> +    }
> >>>> +    else {
> >>>> +        return ath10k_sum_sigs_2(p20, e20);
> >>>> +    }
> >>>> +}
> >>>> +
> >>>>   static void ath10k_htt_rx_h_signal(struct ath10k *ar,
> >>>>                      struct ieee80211_rx_status *status,
> >>>>                      struct htt_rx_desc *rxd)
> >>>> @@ -1177,18 +1215,32 @@ static void ath10k_htt_rx_h_signal(struct
> >>>> ath10k *ar,
> >>>>           status->chains &= ~BIT(i);
> >>>>             if (rxd->ppdu_start.rssi_chains[i].pri20_mhz != 0x80) {
> >>>> -            status->chain_signal[i] = ATH10K_DEFAULT_NOISE_FLOOR +
> >>>> - rxd->ppdu_start.rssi_chains[i].pri20_mhz;
> >>>> +            status->chain_signal[i] = ATH10K_DEFAULT_NOISE_FLOOR
> >>>> +                +
> >>>> ath10k_sum_sigs(rxd->ppdu_start.rssi_chains[i].pri20_mhz,
> >>>> + rxd->ppdu_start.rssi_chains[i].ext20_mhz,
> >>>> + rxd->ppdu_start.rssi_chains[i].ext40_mhz,
> >>>> + rxd->ppdu_start.rssi_chains[i].ext80_mhz);
> >>>> +            //ath10k_warn(ar, "rx-h-sig, chain[%i] pri20: %d
> >>>> ext20: %d  ext40: %d  ext80: %d\n",
> >>>> +            //        i, rxd->ppdu_start.rssi_chains[i].pri20_mhz,
> >>>> rxd->ppdu_start.rssi_chains[i].ext20_mhz,
> >>>> +            // rxd->ppdu_start.rssi_chains[i].ext40_mhz,
> >>>> rxd->ppdu_start.rssi_chains[i].ext80_mhz);
> >>>>                 status->chains |= BIT(i);
> >>>>           }
> >>>>       }
> >>>>         /* FIXME: Get real NF */
> >>>> -    status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
> >>>> -             rxd->ppdu_start.rssi_comb;
> >>>> -    /* ath10k_warn(ar, "rx-h-sig, signal: %d  chains: 0x%x
> >>>> chain[0]: %d  chain[1]: %d  chan[2]: %d\n",
> >>>> -                       status->signal, status->chains,
> >>>> status->chain_signal[0], status->chain_signal[1],
> >>>> status->chain_signal[2]); */
> >>>> +    if (rxd->ppdu_start.rssi_comb_ht != 0x80) {
> >>>> +        status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
> >>>> +            rxd->ppdu_start.rssi_comb_ht;
> >>>> +    }
> >>>> +    else {
> >>>> +        status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
> >>>> +            rxd->ppdu_start.rssi_comb;
> >>>> +    }
> >>>> +
> >>>> +    //ath10k_warn(ar, "rx-h-sig, signal: %d  chains: 0x%x
> >>>> chain[0]: %d  chain[1]: %d  chain[2]: %d chain[3]: %d\n",
> >>>> +    //        status->signal, status->chains,
> >>>> status->chain_signal[0],
> >>>> +    //        status->chain_signal[1], status->chain_signal[2],
> >>>> status->chain_signal[3]);
> >>>>       status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
> >>>>   }
> >>>>   diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h
> >>>> b/drivers/net/wireless/ath/ath10k/rx_desc.h
> >>>> index dec1582005b9..6b44677474dd 100644
> >>>> --- a/drivers/net/wireless/ath/ath10k/rx_desc.h
> >>>> +++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
> >>>> @@ -726,7 +726,8 @@ struct rx_ppdu_start {
> >>>>           u8 ext80_mhz;
> >>>>       } rssi_chains[4];
> >>>>       u8 rssi_comb;
> >>>> -    __le16 rsvd0;
> >>>> +    u8 rsvd0; /* first two bits are bandwidth, other 6 are
> >>>> reserved */
> >>>> +    u8 rssi_comb_ht;
> >>>>       u8 info0; /* %RX_PPDU_START_INFO0_ */
> >>>>       __le32 info1; /* %RX_PPDU_START_INFO1_ */
> >>>>       __le32 info2; /* %RX_PPDU_START_INFO2_ */
> >>>
> >>> _______________________________________________
> >>> ath10k mailing list
> >>> ath10k@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/ath10k
> >>>
> >>
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
