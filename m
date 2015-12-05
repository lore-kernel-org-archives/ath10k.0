Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5D6i-0006lj-7Q
 for ath10k@lists.infradead.org; Sat, 05 Dec 2015 13:42:37 +0000
Received: by wmvv187 with SMTP id v187so110364057wmv.1
 for <ath10k@lists.infradead.org>; Sat, 05 Dec 2015 05:42:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56609D8E.9010703@candelatech.com>
References: <56609D8E.9010703@candelatech.com>
Date: Sat, 5 Dec 2015 19:12:08 +0530
Message-ID: <CA+BoTQmPh4+CL0Mfchfvo6yY5V7O1GdOMOu68nD+Cg90EjV7ZA@mail.gmail.com>
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

On 04/12/2015, Ben Greear <greearb@candelatech.com> wrote:
> So, after tweaking a firmware image to actually be able to use
> all tx-buffers, then queues can actually be stopped on the host
> now.
>
> I'm now getting splats related to tx-queue being
> out of range.
>
> Why are we using vdev_id as the queue-id below?
>
> void ath10k_mac_vif_tx_unlock(struct ath10k_vif *arvif, int reason)
> {
>          struct ath10k *ar = arvif->ar;
>
>          lockdep_assert_held(&ar->htt.tx_lock);
>
>          WARN_ON(reason >= BITS_PER_LONG);
>          arvif->tx_paused &= ~BIT(reason);
>
>          if (ar->tx_paused)
>                  return;
>
>          if (arvif->tx_paused)
>                  return;
>
>          ieee80211_wake_queue(ar->hw, arvif->vdev_id);

I guess you could try replacing arvif->vdev_id with
arvif->vif->cab_queue. This along with vif->hw_queue[] share the same
queue number associated with vdev_id. Refer to the add_interface()
implementation, please.

You don't need to increase mac80211's max_queues unless you intend to
support a similar host queue control via firmware events like qca6174.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
