Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apW2a-0005MD-Nd
 for ath10k@lists.infradead.org; Mon, 11 Apr 2016 07:13:45 +0000
Date: Mon, 11 Apr 2016 10:12:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: ath10k: implement updating shared htt txq state
Message-ID: <20160411071258.GA10739@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
To: michal.kazior@tieto.com
Cc: ath10k@lists.infradead.org

Hello Michal Kazior,

This is a semi-automatic email about new static checker warnings.

The patch c1a43d9720d8: "ath10k: implement updating shared htt txq 
state" from Mar 6, 2016, leads to the following Smatch complaint:

drivers/net/wireless/ath/ath10k/htt_tx.c:70 __ath10k_htt_tx_txq_recalc()
	 warn: variable dereferenced before check 'txq->sta' (see line 52)

drivers/net/wireless/ath/ath10k/htt_tx.c
    51		struct ath10k *ar = hw->priv;
    52		struct ath10k_sta *arsta = (void *)txq->sta->drv_priv;
                                                   ^^^^^^^^^^
New dererence.

    53		struct ath10k_vif *arvif = (void *)txq->vif->drv_priv;
    54		unsigned long frame_cnt;
    55		unsigned long byte_cnt;
    56		int idx;
    57		u32 bit;
    58		u16 peer_id;
    59		u8 tid;
    60		u8 count;
    61	
    62		lockdep_assert_held(&ar->htt.tx_lock);
    63	
    64		if (!ar->htt.tx_q_state.enabled)
    65			return;
    66	
    67		if (ar->htt.tx_q_state.mode != HTT_TX_MODE_SWITCH_PUSH_PULL)
    68			return;
    69	
    70		if (txq->sta)
                    ^^^^^^^^
New check.

    71			peer_id = arsta->peer_id;
    72		else

There are several new warnings.  See also:

drivers/net/wireless/ath/ath10k/txrx.c:86 ath10k_txrx_tx_unref() warn: variable dereferenced before check 'txq' (see line 84)
drivers/net/wireless/ath/ath10k/mac.c:3629 ath10k_mac_txq_init() warn: variable dereferenced before check 'txq' (see line 3627)
drivers/net/wireless/ath/ath10k/mac.c:3642 ath10k_mac_txq_unref() warn: variable dereferenced before check 'txq' (see line 3637)

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
