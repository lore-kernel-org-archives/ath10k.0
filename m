Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1clS-0008V5-CO
 for ath10k@lists.infradead.org; Tue, 01 Nov 2016 17:22:22 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 36F8940B146
 for <ath10k@lists.infradead.org>; Tue,  1 Nov 2016 10:21:38 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Question on 10.4 firmware and fetch-indication logic.
Message-ID: <9af68587-603e-2fa9-5ce9-1dc373238b71@candelatech.com>
Date: Tue, 1 Nov 2016 10:21:37 -0700
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

I am testing on modified 4.7 kernel and modified firmware with QCA9984 NIC
and lots of virtual station vdevs.

The issue I am looking at currently is that I am seeing floods of these messages
in some cases:

Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed to lookup txq for peer_id 56 tid 7
Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed to lookup txq for peer_id 56 tid 7
Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed to lookup txq for peer_id 56 tid 7
Nov 01 09:43:38 ath-9984 kernel: ath10k_pci 0000:05:00.0: fetch-ind: failed to lookup txq for peer_id 56 tid 7

 From this code in htt_rx.c:

static void ath10k_htt_rx_tx_fetch_ind(struct ath10k *ar, struct sk_buff *skb)
...

		/* It is okay to release the lock and use txq because RCU read
		 * lock is held.
		 */

		if (unlikely(!txq)) {
			if (net_ratelimit())
				ath10k_warn(ar, "fetch-ind: failed to lookup txq for peer_id %hu tid %hhu\n",
					    peer_id, tid);
			continue;
		}


I am getting these after the vdev in question (and its peers) have been removed.  I guess these
must be stale buffers that are finally transmitted or cleaned up by the firmware after
vdev has been deleted?

I am curious if anyone else sees something similar, and if this is expected behaviour.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
