Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1akcen-0008VU-R8
 for ath10k@lists.infradead.org; Mon, 28 Mar 2016 19:16:58 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 701CB40EA14
 for <ath10k@lists.infradead.org>; Mon, 28 Mar 2016 12:01:38 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: hacked 4.4.6+, 10.4.3 firmware, Running out of ring-index for pipe-id
 3 (WMI).
Message-ID: <56F97F91.10007@candelatech.com>
Date: Mon, 28 Mar 2016 12:01:37 -0700
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

I'm seeing the ring-full messages below when running 35 stations on
modified 10.4.3 firmware.  I also have serial console logging enabled, so
things are running a bit slow...this seems to exacerbate the issue.

[   91.108923] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2 credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
[   91.108932] ath10k_pci 0000:05:00.0: could not request stats (type 128 ret -105)
[   91.108942] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f  write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
[   91.108944] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2 credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
[   91.108952] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret -105)
[   91.108953] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool: -105
[   91.109039] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f  write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
[   91.109041] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2 credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
[   91.109050] ath10k_pci 0000:05:00.0: could not request stats (type 128 ret -105)
[   91.109060] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f  write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
[   91.109062] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2 credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1
[   91.109070] ath10k_pci 0000:05:00.0: could not request stats (type 1 ret -105)
[   91.109072] ath10k_pci 0000:05:00.0: failed to get fw stats for ethtool: -105
[   91.109157] ath10k_pci 0000:05:00.0: hif-tx-sg, full, nentries_mask: 0x1f  write_idx: 2 sw-idx: 3  n_items: 1 pipe-id: 3
[   91.109160] ath10k_pci 0000:05:00.0: htc failed hif-tx-sq: -105 eid: 2 credits: 1 ep->tx_credits: 1  credit-flow-enabled: 1


I am struggling to understand how the pipe can be full since we have tx-credits logic
enabled for the WMI pipe.

Any suggestions on what sort of bugs could cause this?

And, should the ath10k_wmi_cmd_send retry when we get a -105 return
code in hopes it will free up shortly instead of just failing and leaving
the system in invalid state?


Debug message comes from the warning I added below:

static int ath10k_pci_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
				struct ath10k_hif_sg_item *items, int n_items)
{
	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
	struct ath10k_pci_pipe *pci_pipe = &ar_pci->pipe_info[pipe_id];
	struct ath10k_ce_pipe *ce_pipe = pci_pipe->ce_hdl;
	struct ath10k_ce_ring *src_ring = ce_pipe->src_ring;
	unsigned int nentries_mask;
	unsigned int sw_index;
	unsigned int write_index;
	int err, i = 0;

	spin_lock_bh(&ar_pci->ce_lock);

	nentries_mask = src_ring->nentries_mask;
	sw_index = src_ring->sw_index;
	write_index = src_ring->write_index;

	if (unlikely(CE_RING_DELTA(nentries_mask,
				   write_index, sw_index - 1) < n_items)) {
		ath10k_warn(ar, "hif-tx-sg, full, nentries_mask: 0x%x  write_idx: %d sw-idx: %d  n_items: %d pipe-id: %d\n",
			    nentries_mask, write_index, sw_index, n_items, pipe_id);
		err = -ENOBUFS;
		goto err;
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
