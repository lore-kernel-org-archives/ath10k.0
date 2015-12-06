Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5Qzy-0004ZB-LB
 for ath10k@lists.infradead.org; Sun, 06 Dec 2015 04:32:36 +0000
Received: by wmec201 with SMTP id c201so111539647wme.1
 for <ath10k@lists.infradead.org>; Sat, 05 Dec 2015 20:32:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56632ACA.3080909@candelatech.com>
References: <56609D8E.9010703@candelatech.com>
 <CA+BoTQmPh4+CL0Mfchfvo6yY5V7O1GdOMOu68nD+Cg90EjV7ZA@mail.gmail.com>
 <56630E47.8010809@candelatech.com>
 <CA+BoTQmLHsYnHQ4cGse=v-Yt7r8PekiYBo5VGe+aWwWLpJ+TiQ@mail.gmail.com>
 <56632ACA.3080909@candelatech.com>
Date: Sun, 6 Dec 2015 10:02:09 +0530
Message-ID: <CA+BoTQ=_ioMaogmej=T0sv40mEL1AX4_CqpRiHk2Gt2LaA+Qpw@mail.gmail.com>
Subject: Re: Bugs in wake-queue logic.
From: Michal Kazior <michal.kazior@tieto.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 05/12/2015, Ben Greear <greearb@candelatech.com> wrote:
> On 12/05/2015 08:42 AM, Michal Kazior wrote:
>> On 05/12/2015, Ben Greear <greearb@candelatech.com> wrote:
>>> On 12/05/2015 05:42 AM, Michal Kazior wrote:
>>>> On 04/12/2015, Ben Greear <greearb@candelatech.com> wrote:
>>>>> So, after tweaking a firmware image to actually be able to use
>>>>> all tx-buffers, then queues can actually be stopped on the host
>>>>> now.
>>>>>
>>>>> I'm now getting splats related to tx-queue being
>>>>> out of range.
>>>>>
>>>>> Why are we using vdev_id as the queue-id below?
>>>>>
>>>>> void ath10k_mac_vif_tx_unlock(struct ath10k_vif *arvif, int reason)
>>>>> {
>>>>>            struct ath10k *ar = arvif->ar;
>>>>>
>>>>>            lockdep_assert_held(&ar->htt.tx_lock);
>>>>>
>>>>>            WARN_ON(reason >= BITS_PER_LONG);
>>>>>            arvif->tx_paused &= ~BIT(reason);
>>>>>
>>>>>            if (ar->tx_paused)
>>>>>                    return;
>>>>>
>>>>>            if (arvif->tx_paused)
>>>>>                    return;
>>>>>
>>>>>            ieee80211_wake_queue(ar->hw, arvif->vdev_id);
>>>>
>>>> I guess you could try replacing arvif->vdev_id with
>>>> arvif->vif->cab_queue. This along with vif->hw_queue[] share the same
>>>> queue number associated with vdev_id. Refer to the add_interface()
>>>> implementation, please.
>>>>
>>>> You don't need to increase mac80211's max_queues unless you intend to
>>>> support a similar host queue control via firmware events like qca6174.
>>>
>>> What about the comments about tx-locking?  Does that only apply to
>>> qca6174?
>>
>> The code applies the logic to all chips but only qca6174 generates the
>> events that can stop queues per vif. The qca6174 doesn't have any
>> iface combinations with 16 vdevs so the logic works fine in all cases
>> as far as upstream is concerned.
>
> So, for non qca6174, do we even need more than one tx-queue?
>
>>> For host queue control, are firmware events really needed, or can we
>>> just keep track of buffered pkts per peer and/or per vdev and use
>>> that on the host?
>>
>> It's possible. However you probably have your 16+ vdev setup in mind.
>> This in itself won't work as-is because of the modulo/overlap.
>>
>> You'll probably need to add some kind of mechanism to avoid waking up
>> a queue when multiple vdevs share one.
>
> Seems like fake hardware tx-queues might not be the way to do this...upper
> levels
> could make the decisions needed on a per-peer (and maybe per-tid?) basis
> based on the
> peer's tx-rate (my firmware can report this properly).  If the firmware
> ever exhausts it's tx-buffers, stopping all TX is as good as anything
> else I think...

There's not enough data for upper layers to do this in multi-channel
case. It's not just about rate control. It's also about channel
scheduling which isn't known to the driver. Relying on HTT chan-change
(assuming it even works on wmi-tlv firmware) won't be straightforward
because it's an after-the-fact which is a problem because firmware
takes care of powersaving which itself is considered for channel
scheduling in firmware.

If you switch channel and clog up all HTT tx descriptors with traffic
to a vdev which sits on a different channel you'll just waste time.
All in all you'd end up with suboptimal performance.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
