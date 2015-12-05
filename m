Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5HRR-0008MK-TL
 for ath10k@lists.infradead.org; Sat, 05 Dec 2015 18:20:18 +0000
Message-ID: <56632ACA.3080909@candelatech.com>
Date: Sat, 05 Dec 2015 10:19:54 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Bugs in wake-queue logic.
References: <56609D8E.9010703@candelatech.com>	<CA+BoTQmPh4+CL0Mfchfvo6yY5V7O1GdOMOu68nD+Cg90EjV7ZA@mail.gmail.com>	<56630E47.8010809@candelatech.com>
 <CA+BoTQmLHsYnHQ4cGse=v-Yt7r8PekiYBo5VGe+aWwWLpJ+TiQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmLHsYnHQ4cGse=v-Yt7r8PekiYBo5VGe+aWwWLpJ+TiQ@mail.gmail.com>
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



On 12/05/2015 08:42 AM, Michal Kazior wrote:
> On 05/12/2015, Ben Greear <greearb@candelatech.com> wrote:
>> On 12/05/2015 05:42 AM, Michal Kazior wrote:
>>> On 04/12/2015, Ben Greear <greearb@candelatech.com> wrote:
>>>> So, after tweaking a firmware image to actually be able to use
>>>> all tx-buffers, then queues can actually be stopped on the host
>>>> now.
>>>>
>>>> I'm now getting splats related to tx-queue being
>>>> out of range.
>>>>
>>>> Why are we using vdev_id as the queue-id below?
>>>>
>>>> void ath10k_mac_vif_tx_unlock(struct ath10k_vif *arvif, int reason)
>>>> {
>>>>            struct ath10k *ar = arvif->ar;
>>>>
>>>>            lockdep_assert_held(&ar->htt.tx_lock);
>>>>
>>>>            WARN_ON(reason >= BITS_PER_LONG);
>>>>            arvif->tx_paused &= ~BIT(reason);
>>>>
>>>>            if (ar->tx_paused)
>>>>                    return;
>>>>
>>>>            if (arvif->tx_paused)
>>>>                    return;
>>>>
>>>>            ieee80211_wake_queue(ar->hw, arvif->vdev_id);
>>>
>>> I guess you could try replacing arvif->vdev_id with
>>> arvif->vif->cab_queue. This along with vif->hw_queue[] share the same
>>> queue number associated with vdev_id. Refer to the add_interface()
>>> implementation, please.
>>>
>>> You don't need to increase mac80211's max_queues unless you intend to
>>> support a similar host queue control via firmware events like qca6174.
>>
>> What about the comments about tx-locking?  Does that only apply to qca6174?
>
> The code applies the logic to all chips but only qca6174 generates the
> events that can stop queues per vif. The qca6174 doesn't have any
> iface combinations with 16 vdevs so the logic works fine in all cases
> as far as upstream is concerned.

So, for non qca6174, do we even need more than one tx-queue?

>> For host queue control, are firmware events really needed, or can we
>> just keep track of buffered pkts per peer and/or per vdev and use
>> that on the host?
>
> It's possible. However you probably have your 16+ vdev setup in mind.
> This in itself won't work as-is because of the modulo/overlap.
>
> You'll probably need to add some kind of mechanism to avoid waking up
> a queue when multiple vdevs share one.

Seems like fake hardware tx-queues might not be the way to do this...upper levels
could make the decisions needed on a per-peer (and maybe per-tid?) basis based on the
peer's tx-rate (my firmware can report this properly).  If the firmware
ever exhausts it's tx-buffers, stopping all TX is as good as anything
else I think...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
