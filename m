Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4ZwD-0007Fr-Ib
 for ath10k@lists.infradead.org; Thu, 03 Dec 2015 19:53:09 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 55DA740A959
 for <ath10k@lists.infradead.org>; Thu,  3 Dec 2015 11:52:47 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: Bugs in wake-queue logic.
Message-ID: <56609D8E.9010703@candelatech.com>
Date: Thu, 3 Dec 2015 11:52:46 -0800
MIME-Version: 1.0
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
To: ath10k <ath10k@lists.infradead.org>

So, after tweaking a firmware image to actually be able to use
all tx-buffers, then queues can actually be stopped on the host
now.

I'm now getting splats related to tx-queue being
out of range.

Why are we using vdev_id as the queue-id below?

void ath10k_mac_vif_tx_unlock(struct ath10k_vif *arvif, int reason)
{
         struct ath10k *ar = arvif->ar;

         lockdep_assert_held(&ar->htt.tx_lock);

         WARN_ON(reason >= BITS_PER_LONG);
         arvif->tx_paused &= ~BIT(reason);

         if (ar->tx_paused)
                 return;

         if (arvif->tx_paused)
                 return;

         ieee80211_wake_queue(ar->hw, arvif->vdev_id);
}


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
