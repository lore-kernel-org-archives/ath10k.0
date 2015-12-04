Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4jb7-0001fJ-QG
 for ath10k@lists.infradead.org; Fri, 04 Dec 2015 06:12:02 +0000
Received: by wmww144 with SMTP id w144so48752750wmw.1
 for <ath10k@lists.infradead.org>; Thu, 03 Dec 2015 22:11:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALhHN=q7HebGUxgLznBhnNWjCMfmm1cx_5t8kh_Y-TbMVZBOdQ@mail.gmail.com>
References: <56609D8E.9010703@candelatech.com>
 <CALhHN=q7HebGUxgLznBhnNWjCMfmm1cx_5t8kh_Y-TbMVZBOdQ@mail.gmail.com>
Date: Fri, 4 Dec 2015 07:11:40 +0100
Message-ID: <CALhHN=p9e4T-UhdqJ2JajcvkAfi4Huz+Oexpfzk-FdrxSzkGfA@mail.gmail.com>
Subject: Re: Bugs in wake-queue logic.
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
Cc: ath10k <ath10k@lists.infradead.org>

On 4 December 2015 at 07:06, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
> On 3 December 2015 at 20:52, Ben Greear <greearb@candelatech.com> wrote:
>> So, after tweaking a firmware image to actually be able to use
>> all tx-buffers, then queues can actually be stopped on the host
>> now.
>>
>> I'm now getting splats related to tx-queue being
>> out of range.
>>
>> Why are we using vdev_id as the queue-id below?
>>
> This is comment in the code:
>
>         /* Using vdev_id as queue number will make it very easy to do per-vif
>          * tx queue locking. This shouldn't wrap due to interface combinations
>          * but do a modulo for correctness sake and prevent using offchannel tx
>          * queues for regular vif tx.
>          */
>
BTW, I think Michal will send soon "new" design for that because of
MU-MIMO implementation.


> BR
> Janusz
>
>> void ath10k_mac_vif_tx_unlock(struct ath10k_vif *arvif, int reason)
>> {
>>         struct ath10k *ar = arvif->ar;
>>
>>         lockdep_assert_held(&ar->htt.tx_lock);
>>
>>         WARN_ON(reason >= BITS_PER_LONG);
>>         arvif->tx_paused &= ~BIT(reason);
>>
>>         if (ar->tx_paused)
>>                 return;
>>
>>         if (arvif->tx_paused)
>>                 return;
>>
>>         ieee80211_wake_queue(ar->hw, arvif->vdev_id);
>> }
>>
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
