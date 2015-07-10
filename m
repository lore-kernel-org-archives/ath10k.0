Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDW86-0002tg-1D
 for ath10k@lists.infradead.org; Fri, 10 Jul 2015 11:06:06 +0000
Date: Fri, 10 Jul 2015 19:05:23 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:pending 103/106]
 drivers/net/wireless/ath/ath10k/htt_tx.c:547:52: sparse: incorrect type in
 assignment (different base types)
Message-ID: <201507101921.R3vdET4K%fengguang.wu@intel.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: "Kalle Valo <kvalo@adurom.com> Kalle Valo" <kvalo@adurom.com>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   git://github.com/kvalo/ath pending
head:   ffa9360e591071b5c97fb8f764f4a07ffe2a3418
commit: 5fbf48040b661c9ee65b7a4bbf12012fa85be4cc [103/106] ath10k: update tx path to support QCA99X0
reproduce:
  # apt-get install sparse
  git checkout 5fbf48040b661c9ee65b7a4bbf12012fa85be4cc
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath10k/htt_tx.c:547:52: sparse: incorrect type in assignment (different base types)
   drivers/net/wireless/ath/ath10k/htt_tx.c:547:52:    expected restricted __le16 [usertype] len_16
   drivers/net/wireless/ath/ath10k/htt_tx.c:547:52:    got restricted __le32 [usertype] <noident>

vim +547 drivers/net/wireless/ath/ath10k/htt_tx.c

   531					       DMA_TO_DEVICE);
   532		res = dma_mapping_error(dev, skb_cb->paddr);
   533		if (res)
   534			goto err_free_txbuf;
   535	
   536		switch (skb_cb->txmode) {
   537		case ATH10K_HW_TXRX_RAW:
   538		case ATH10K_HW_TXRX_NATIVE_WIFI:
   539			flags0 |= HTT_DATA_TX_DESC_FLAGS0_MAC_HDR_PRESENT;
   540			/* pass through */
   541		case ATH10K_HW_TXRX_ETHERNET:
   542			if (ar->hw_params.continuous_frag_desc) {
   543				frags = (struct htt_data_tx_desc_frag *)
   544					&htt->frag_desc.vaddr[msdu_id].frags;
   545				frags[0].tword_addr.paddr_lo = __cpu_to_le32(skb_cb->paddr);
   546				frags[0].tword_addr.paddr_hi = 0;
 > 547				frags[0].tword_addr.len_16 = __cpu_to_le32(msdu->len);
   548				frags[1].tword_addr.paddr_lo = 0;
   549				frags[1].tword_addr.paddr_hi = 0;
   550	
   551				frags_paddr =  htt->frag_desc.paddr +
   552					(sizeof(struct htt_msdu_ext_desc) * msdu_id);
   553			} else {
   554				frags = skb_cb->htt.txbuf->frags;
   555				frags[0].dword_addr.paddr = __cpu_to_le32(skb_cb->paddr);

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
