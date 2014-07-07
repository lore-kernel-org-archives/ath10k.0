Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4EYT-0006eX-Te
 for ath10k@lists.infradead.org; Mon, 07 Jul 2014 19:26:27 +0000
Received: by mail-ob0-f181.google.com with SMTP id wp4so5262925obc.12
 for <ath10k@lists.infradead.org>; Mon, 07 Jul 2014 12:26:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
References: <CABnBrYU3P5qXd7pE7LJ_K4JeNFLtbZnpsTgvqtpdMs07qz_gGA@mail.gmail.com>
 <CA+BoTQk_YtrHrR6Wi3mMAZxT6EHFBxdUAafp48GqfUcM=HwfZg@mail.gmail.com>
 <CABnBrYXn0T=bW45zR5VivFRhP4BqFswYY93hrjB7rx+azKX9uA@mail.gmail.com>
 <CABnBrYUTKdvUiDha3meiiu08BCqNVBuCgXb7M_Gr4DwhyON3qw@mail.gmail.com>
 <CAJ-Vmo=JKpnoU2p4swTiXeTM0Q2LYWo7-VW_-vnOLb4ufVSO5A@mail.gmail.com>
 <CALhHN=r9_3i3R45Exs59d02XRTa-07WWvBwmGY9pEKufZb3Byw@mail.gmail.com>
Date: Mon, 7 Jul 2014 12:26:03 -0700
Message-ID: <CABnBrYVANG1cwC8ixD0hGY5guaB3XTP=PAxsf4OfVuZw+iLMaA@mail.gmail.com>
Subject: Re: A-MSDU reception not working?
From: Denton Gentry <denton.gentry@gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

The initial results are not promising: a MacOS 802.11ac client gets
between 0-2 Mbps with this change, where it was getting about 8 Mbps
prior to this change and ~170 Mbps prior to the reordering fix. A pcap
from the receiving system shows a very large number of out of order
frames, likely due to TCP retransmission.

An 802.11n MacBook gets very good throughput, only the 802.11ac
MacBook shows the very poor result. I'm trying to figure out why.


One specific note (and probably not related to the throughput): I
believe ath10k_htt_rx_amsdu runs in the tasklet, which means it would
need to use GFP_ATOMIC instead of GFP_KERNEL. Do I understand it
correctly?


On Mon, Jul 7, 2014 at 1:30 AM, Janusz Dziedzic
<janusz.dziedzic@tieto.com> wrote:
> On 6 July 2014 04:27, Adrian Chadd <adrian@freebsd.org> wrote:
>> I think you may have to tell mac80211 that it's okay and not to drop the frames.
>>
>> The earlier atheros chips would just give you the AMSDU frames as
>> deaggregated A-MPDU sub-frames - you'd just pass the A-MSDU up to
>> net80211 and it'd ull it apart. But if the driver is doing it (or,
>> well, the chip is doing it) then mac80211 needs to know not to drop
>> those sub-frames.
>>
>> I wonder if you'll ever get notified before the complete A-MPDU has
>> been received. That happens on previous chips. eg, you have an A-MPDU
>> of 16 frames with 4 MSDUs in each MPDU. If you get notified and handle
>> half of one MPDU before you hit EOL, the next notification you process
>> will be the next MSDU in the same MPDU - and then you'll hit the
>> reordering hilarity again.
>>
>> So hm, i will face the same issue in FreeBSD at some point, so I'd
>> likely do what you're thinking of doing - pass up a chain of mbufs
>> representing the current MPDU and treat the whole lot as the frame(s)
>> to care about. Honestly though, I'm kind of wondering whether I should
>> mostly just do what the Atheros reference driver does and treat it as
>> ethernet payload frames (ie, it's already de-encapsulated and the
>> reordering is already done) and just tack on the wifi header bit via
>> another of the DMA rings.
>>
>> Ugh, I really should sit down and write the FreeBSD version of this.
>>
>>
>>
>> -a
>>
>> (I'm still having flashbacks from working on this firmware at QCA. Aiee.)
>>
>>
>> On 5 July 2014 06:55, Denton Gentry <denton.gentry@gmail.com> wrote:
>>> There are two issues in handling the dis-aggregated A-MSDU subframes
>>> in ieee80211_sta_manage_reorder_buf:
>>>
>>> 1. The out-of-date check:
>>>
>>>         /* frame with out of date sequence number */
>>>         if (ieee80211_sn_less(mpdu_seq_num, head_seq_num)) {
>>>                 dev_kfree_skb(skb);
>>>                 goto out;
>>>         }
>>>
>>> As all of the subframes carry the same sequence number, the first
>>> subframe will be delivered and increment head_seq_num and then all
>>> subsequent subframes will be discarded.
>>>
>>>
>>> 2. The duplicates check a bit later in the routine:
>>>
>>>         /* check if we already stored this frame */
>>>         if (tid_agg_rx->reorder_buf[index]) {
>>>                 dev_kfree_skb(skb);
>>>                 goto out;
>>>         }
>>>
>>> If there is enough packet loss that packets are queued in the reorder
>>> buffer and not immediately released, then only the first subframe will
>>> be stored. Subsequent subframes will be discarded as duplicates.
>>>
>>>
>>> An 802.11ac MacBook is able to get about 170 Mbps with iperf prior to
>>> the reordering buffer changes, and dropped to about 8 Mbps with the
>>> reorder buffer. Hacking around the out-of-date sequence number check
>>> to allow all subframes to egress restores it to 170 Mbps.
>>>
>>> In the area where I'm testing there isn't enough 5 GHz noise to make
>>> the duplicates-check issue happen very often. By adding a printk I can
>>> see that it does happen, but it doesn't impact the throughput and I
>>> can't report the impact of fixing it.
>>>
>>> ----
>>>
>>> I do wonder if both of these are symptoms of dis-aggregating the
>>> A-MSDU too early. mac80211 expects to be dealing with the whole MPDU
>>> at a time, and the ath10k A-MSDU case is sending it subframes instead.
>>> Trying to make the ath10k code send up all of the subframes as a chain
>>> of skbs didn't immediately work, but I do wonder if that would better
>>> match the mac80211 expectations.
>>>
>>>
>>>
>>> On Fri, Jul 4, 2014 at 11:58 AM, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>> Yes, after some more testing it does look like an unfortunate
>>>> interaction between the reorder buffer and A-MSDU. The disaggregated
>>>> subframes all carry the same sequence number. The first subframe is
>>>> released from the reorder buffer and increments the head_seq_num.
>>>> Subsequent subframes are all discarded as being out of date.
>>>>
>>>> [  308.514021] ieee80211_sta_manage_reorder_buf: out of date seq=0xb05
>>>> head=0xb06
>>>> [  308.520577] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0a
>>>> head=0xb0b
>>>> [  308.527198] ieee80211_sta_manage_reorder_buf: out of date seq=0xb0f
>>>> head=0xb10
>>>> [  308.533857] ieee80211_sta_manage_reorder_buf: out of date seq=0xb14
>>>> head=0xb15
>>>> [  308.540480] ieee80211_sta_manage_reorder_buf: out of date seq=0xb19
>>>> head=0xb1a
>>>> [  308.547730] ieee80211_sta_manage_reorder_buf: out of date seq=0xb1e
>>>> head=0xb1f
>>>> [  308.554069] ieee80211_sta_manage_reorder_buf: out of date seq=0xb23
>>>> head=0xb24
>>>>
>>>>
>>>> On Wed, Jul 2, 2014 at 9:49 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>>> On 30 June 2014 22:15, Denton Gentry <denton.gentry@gmail.com> wrote:
>>>>>> In iperf tests using a MacBook STA bridging through an ath10k AP to an
>>>>>> Ethernet server, I'm noticing very selective packet loss. The second
>>>>>> and subsequent frames in an A-MSDU packet appear to be dropped.
>>>>>>
>>>>>> The AP sets the A-MSDU size to 3839 bytes, and the MacBook frequently
>>>>>> sends A-MSDU packets containing two TCP frames. So far as I can tell,
>>>>>> the first TCP frame from an A-MSDU aggregate is delivered and the
>>>>>> second is consistently lost. The MacBook generally retransmits the
>>>>>> lost frame as a singleton with no aggregation, and the retransmitted
>>>>>> frame makes it through.
>>>>>>
>>>>>> This became more noticeable after the reordering fixes in
>>>>>> http://lists.infradead.org/pipermail/ath10k/2014-June/002552.html
>>>>>>
>>>>>> I see this A-MSDU packet loss behavior both with and without the
>>>>>> reordering fixes, the first packet in an A-MSDU is delivered while the
>>>>>> second is dropped. However, *without* the reordering fixes (and
>>>>>> therefore with packets delivered out of order) the MacBook sends
>>>>>> relatively few A-MSDU frames. *With* the reordering fixes, so all
>>>>>> packets are delivered in order, the MacBook keeps sending A-MSDU and
>>>>>> therefore has to deal with more packet loss. I suspect it is an
>>>>>> interaction with the MacOS TCP congestion window which I'm likely
>>>>>> never going to fully understand, its stuck in a region of the
>>>>>> congestion window where the Wifi driver keeps choosing to using
>>>>>> A-MSDU.
>>>>>
>>>>> I was actually worried about A-MSDU once A-MPDU re-ordering issue was raised.
>>>>>
>>>>> ath10k fw reports A-MSDU subframes separately. To avoid memory
>>>>> copying/allocation overhead each subframe is reported as a singly
>>>>> A-MSDU MSDU to mac80211 with an extra rx_flag AMSDU_MORE. Perhaps
>>>>> A-MPDU reordering intereferes with A-MSDU now?
>>>>>
> Denton could you try attached patch: report amsdu in one big frame.
> If help, we can add amsdu skb list support to mac80211/cfg80211 - to
> improve performance and reduce memcpy, while currently we have skb
> frames, put them in one big skb and next cfg80211 split them again
> into msdus and report to stack.
>
> BR
> Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
