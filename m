Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMFZ5-0002NY-SV
 for ath10k@lists.infradead.org; Thu, 02 May 2019 17:32:13 +0000
Date: Fri, 3 May 2019 01:31:53 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 45/111]
 drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <201905030152.Bl4Qm68k%lkp@intel.com>
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9cacba94c6118dd96276ffe745dbad51dd4fe6b4
commit: 2d0fbbf73a7789991f685dc25fc25011af3e04ef [45/111] ath11k: add htt rx filter support
reproduce:
        # apt-get install sparse
        git checkout 2d0fbbf73a7789991f685dc25fc25011af3e04ef
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath11k/dp_tx.c:644:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:646:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:649:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:833:23: sparse: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/dp_tx.c:835:23: sparse: sparse: dubious: x & !y
>> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [usertype] pkt_type_en_flags0 @@    got restrunsigned int [usertype] pkt_type_en_flags0 @@
>> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: sparse:    expected unsigned int [usertype] pkt_type_en_flags0
>> drivers/net/wireless/ath/ath11k/dp_tx.c:840:33: sparse:    got restricted __le32 [usertype]
>> drivers/net/wireless/ath/ath11k/dp_tx.c:841:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [usertype] pkt_type_en_flags1 @@    got restrunsigned int [usertype] pkt_type_en_flags1 @@
>> drivers/net/wireless/ath/ath11k/dp_tx.c:841:33: sparse:    expected unsigned int [usertype] pkt_type_en_flags1
   drivers/net/wireless/ath/ath11k/dp_tx.c:841:33: sparse:    got restricted __le32 [usertype]
>> drivers/net/wireless/ath/ath11k/dp_tx.c:842:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [usertype] pkt_type_en_flags2 @@    got restrunsigned int [usertype] pkt_type_en_flags2 @@
>> drivers/net/wireless/ath/ath11k/dp_tx.c:842:33: sparse:    expected unsigned int [usertype] pkt_type_en_flags2
   drivers/net/wireless/ath/ath11k/dp_tx.c:842:33: sparse:    got restricted __le32 [usertype]
>> drivers/net/wireless/ath/ath11k/dp_tx.c:843:33: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [usertype] pkt_type_en_flags3 @@    got restrunsigned int [usertype] pkt_type_en_flags3 @@
>> drivers/net/wireless/ath/ath11k/dp_tx.c:843:33: sparse:    expected unsigned int [usertype] pkt_type_en_flags3
   drivers/net/wireless/ath/ath11k/dp_tx.c:843:33: sparse:    got restricted __le32 [usertype]
>> drivers/net/wireless/ath/ath11k/dp_tx.c:844:28: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [usertype] rx_filter_tlv @@    got restrunsigned int [usertype] rx_filter_tlv @@
>> drivers/net/wireless/ath/ath11k/dp_tx.c:844:28: sparse:    expected unsigned int [usertype] rx_filter_tlv
   drivers/net/wireless/ath/ath11k/dp_tx.c:844:28: sparse:    got restricted __le32 [usertype]

vim +840 drivers/net/wireless/ath/ath11k/dp_tx.c

   548	
   549	int ath11k_dp_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
   550				     int mac_id, enum hal_ring_type ring_type)
   551	{
   552		struct htt_srng_setup_cmd *cmd;
   553		struct hal_srng *srng = &ab->hal.srng_list[ring_id];
   554		struct hal_srng_params params;
   555		struct sk_buff *skb;
   556		u32 ring_entry_sz;
   557		int len = sizeof(*cmd);
   558		dma_addr_t hp_addr, tp_addr;
   559		int lmac_ring_id_offset;
   560		enum htt_srng_ring_type htt_ring_type;
   561		enum htt_srng_ring_id htt_ring_id;
   562		int ret;
   563	
   564		skb = ath11k_htc_alloc_skb(ab, len);
   565		if (!skb)
   566			return -ENOMEM;
   567	
   568		memset(&params, 0, sizeof(params));
   569		ath11k_hal_srng_get_params(ab, srng, &params);
   570	
   571		hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
   572		tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
   573	
   574		switch (ring_type) {
   575		case HAL_RXDMA_BUF:
   576			lmac_ring_id_offset = mac_id * HAL_SRNG_RINGS_PER_LMAC;
   577			if (!(ring_id == (HAL_SRNG_RING_ID_WMAC1_SW2RXDMA0_BUF +
   578					  lmac_ring_id_offset) ||
   579			    ring_id == (HAL_SRNG_RING_ID_WMAC1_SW2RXDMA1_BUF +
   580					lmac_ring_id_offset))) {
   581				ret = -EINVAL;
   582				goto err_free;
   583			}
   584	
   585			htt_ring_id = HTT_RXDMA_HOST_BUF_RING;
   586			htt_ring_type = HTT_SW_TO_HW_RING;
   587			break;
   588		case HAL_RXDMA_DST:
   589			htt_ring_id = HTT_RXDMA_NON_MONITOR_DEST_RING;
   590			htt_ring_type = HTT_HW_TO_SW_RING;
   591			break;
   592		case HAL_RXDMA_MONITOR_BUF:
   593			htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
   594			htt_ring_type = HTT_SW_TO_HW_RING;
   595			break;
   596		case HAL_RXDMA_MONITOR_STATUS:
   597			htt_ring_id = HTT_RXDMA_MONITOR_STATUS_RING;
   598			htt_ring_type = HTT_SW_TO_HW_RING;
   599			break;
   600		case HAL_RXDMA_MONITOR_DST:
   601			htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
   602			htt_ring_type = HTT_HW_TO_SW_RING;
   603			break;
   604		case HAL_RXDMA_MONITOR_DESC:
   605			htt_ring_id = HTT_RXDMA_MONITOR_DESC_RING;
   606			htt_ring_type = HTT_SW_TO_HW_RING;
   607			break;
   608		default:
   609			ath11k_warn(ab, "Unsupported ring type in DP :%d\n", ring_type);
   610			ret = -EINVAL;
   611			goto err_free;
   612		}
   613	
   614		skb_put(skb, len);
   615		cmd = (struct htt_srng_setup_cmd *)skb->data;
   616		cmd->info0 = FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_MSG_TYPE,
   617					HTT_H2T_MSG_TYPE_SRING_SETUP);
   618		if (htt_ring_type == HTT_SW_TO_HW_RING ||
   619		    htt_ring_type == HTT_HW_TO_SW_RING)
   620			cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID,
   621						 DP_SW2HW_MACID(mac_id));
   622		else
   623			cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID,
   624						 mac_id);
   625		cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_RING_TYPE,
   626					 htt_ring_type);
   627		cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_RING_ID, htt_ring_id);
   628	
   629		cmd->ring_base_addr_lo = params.ring_base_paddr &
   630					 HAL_ADDR_LSB_REG_MASK;
   631	
   632		cmd->ring_base_addr_hi = (u64)params.ring_base_paddr >>
   633					 HAL_ADDR_MSB_REG_SHIFT;
   634	
   635		ring_entry_sz = ath11k_hal_srng_get_entrysize(ring_type);
   636		if (ring_entry_sz < 0)
   637			return -EINVAL;
   638	
   639		ring_entry_sz >>= 2;
   640		cmd->info1 = FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_ENTRY_SIZE,
   641					ring_entry_sz);
   642		cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_SIZE,
   643					 params.num_entries * ring_entry_sz);
 > 644		cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP,
   645					 !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));
   646		cmd->info1 |= FIELD_PREP(
   647				HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_TLV_SWAP,
   648				!!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP));
 > 649		cmd->info1 |= FIELD_PREP(
   650				HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_HOST_FW_SWAP,
   651				!!(params.flags & HAL_SRNG_FLAGS_RING_PTR_SWAP));
   652		if (htt_ring_type == HTT_SW_TO_HW_RING)
   653			cmd->info1 |= HTT_SRNG_SETUP_CMD_INFO1_RING_LOOP_CNT_DIS;
   654	
   655		cmd->ring_head_off32_remote_addr_lo = hp_addr & HAL_ADDR_LSB_REG_MASK;
   656		cmd->ring_head_off32_remote_addr_hi = (u64)hp_addr >>
   657						      HAL_ADDR_MSB_REG_SHIFT;
   658	
   659		cmd->ring_tail_off32_remote_addr_lo = tp_addr & HAL_ADDR_LSB_REG_MASK;
   660		cmd->ring_tail_off32_remote_addr_hi = (u64)tp_addr >>
   661						      HAL_ADDR_MSB_REG_SHIFT;
   662	
   663		cmd->ring_msi_addr_lo = 0;
   664		cmd->ring_msi_addr_hi = 0;
   665		cmd->msi_data = 0;
   666	
   667		cmd->intr_info = FIELD_PREP(
   668				HTT_SRNG_SETUP_CMD_INTR_INFO_BATCH_COUNTER_THRESH,
   669				params.intr_batch_cntr_thres_entries * ring_entry_sz);
   670		cmd->intr_info |= FIELD_PREP(
   671				HTT_SRNG_SETUP_CMD_INTR_INFO_INTR_TIMER_THRESH,
   672				params.intr_timer_thres_us >> 3);
   673	
   674		cmd->info2 = 0;
   675		if (params.flags & HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN) {
   676			cmd->info2 = FIELD_PREP(
   677					HTT_SRNG_SETUP_CMD_INFO2_INTR_LOW_THRESH,
   678					params.low_threshold);
   679		}
   680	
   681		ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);
   682		if (ret)
   683			goto err_free;
   684	
   685		return 0;
   686	
   687	err_free:
   688		dev_kfree_skb_any(skb);
   689	
   690		return ret;
   691	}
   692	
   693	#define HTT_TARGET_VERSION_TIMEOUT_HZ (3 * HZ)
   694	
   695	int ath11k_dp_htt_h2t_ver_req_msg(struct ath11k_base *ab)
   696	{
   697		struct ath11k_dp *dp = &ab->dp;
   698		struct sk_buff *skb;
   699		struct htt_ver_req_cmd *cmd;
   700		int len = sizeof(*cmd);
   701		int ret;
   702	
   703		init_completion(&dp->htt_tgt_version_received);
   704	
   705		skb = ath11k_htc_alloc_skb(ab, len);
   706		if (!skb)
   707			return -ENOMEM;
   708	
   709		skb_put(skb, len);
   710		cmd = (struct htt_ver_req_cmd *)skb->data;
   711		cmd->ver_reg_info = FIELD_PREP(HTT_VER_REQ_INFO_MSG_ID,
   712					       HTT_H2T_MSG_TYPE_VERSION_REQ);
   713	
   714		ret = ath11k_htc_send(&ab->htc, dp->eid, skb);
   715		if (ret) {
   716			dev_kfree_skb_any(skb);
   717			return ret;
   718		}
   719	
   720		ret = wait_for_completion_timeout(&dp->htt_tgt_version_received,
   721						  HTT_TARGET_VERSION_TIMEOUT_HZ);
   722		if (ret == 0) {
   723			ath11k_warn(ab, "htt target version request timed out\n");
   724			return -ETIMEDOUT;
   725		}
   726	
   727		if (dp->htt_tgt_ver_major != HTT_TARGET_VERSION_MAJOR) {
   728			ath11k_err(ab, "unsupported htt major version %d supported version is %d\n",
   729				   dp->htt_tgt_ver_major, HTT_TARGET_VERSION_MAJOR);
   730			return -ENOTSUPP;
   731		}
   732	
   733		return 0;
   734	}
   735	
   736	int ath11k_dp_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
   737	{
   738		struct ath11k_base *ab = ar->ab;
   739		struct ath11k_dp *dp = &ab->dp;
   740		struct sk_buff *skb;
   741		struct htt_ppdu_stats_cfg_cmd *cmd;
   742		int len = sizeof(*cmd);
   743		u8 pdev_mask;
   744		int ret;
   745	
   746		skb = ath11k_htc_alloc_skb(ab, len);
   747		if (!skb)
   748			return -ENOMEM;
   749	
   750		skb_put(skb, len);
   751		cmd = (struct htt_ppdu_stats_cfg_cmd *)skb->data;
   752		cmd->msg = FIELD_PREP(HTT_PPDU_STATS_CFG_MSG_TYPE,
   753				      HTT_H2T_MSG_TYPE_PPDU_STATS_CFG);
   754	
   755		pdev_mask = DP_SW2HW_MACID(ar->pdev_idx);
   756		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_PDEV_ID, pdev_mask);
   757		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK, mask);
   758	
   759		ret = ath11k_htc_send(&ab->htc, dp->eid, skb);
   760		if (ret) {
   761			dev_kfree_skb_any(skb);
   762			return ret;
   763		}
   764	
   765		return 0;
   766	}
   767	
   768	int ath11k_dp_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
   769					  int mac_id, enum hal_ring_type ring_type,
   770					  int rx_buf_size,
   771					  struct htt_rx_ring_tlv_filter *tlv_filter)
   772	{
   773		struct htt_rx_ring_selection_cfg_cmd *cmd;
   774		struct hal_srng *srng = &ab->hal.srng_list[ring_id];
   775		struct hal_srng_params params;
   776		struct sk_buff *skb;
   777		int len = sizeof(*cmd);
   778		enum htt_srng_ring_type htt_ring_type;
   779		enum htt_srng_ring_id htt_ring_id;
   780		int ret;
   781	
   782		skb = ath11k_htc_alloc_skb(ab, len);
   783		if (!skb)
   784			return -ENOMEM;
   785	
   786		memset(&params, 0, sizeof(params));
   787		ath11k_hal_srng_get_params(ab, srng, &params);
   788	
   789		switch (ring_type) {
   790		case HAL_RXDMA_BUF:
   791			htt_ring_id = HTT_RXDMA_HOST_BUF_RING;
   792			htt_ring_type = HTT_SW_TO_HW_RING;
   793			break;
   794		case HAL_RXDMA_DST:
   795			htt_ring_id = HTT_RXDMA_NON_MONITOR_DEST_RING;
   796			htt_ring_type = HTT_HW_TO_SW_RING;
   797			break;
   798		case HAL_RXDMA_MONITOR_BUF:
   799			htt_ring_id = HTT_RXDMA_MONITOR_BUF_RING;
   800			htt_ring_type = HTT_SW_TO_HW_RING;
   801			break;
   802		case HAL_RXDMA_MONITOR_STATUS:
   803			htt_ring_id = HTT_RXDMA_MONITOR_STATUS_RING;
   804			htt_ring_type = HTT_SW_TO_HW_RING;
   805			break;
   806		case HAL_RXDMA_MONITOR_DST:
   807			htt_ring_id = HTT_RXDMA_MONITOR_DEST_RING;
   808			htt_ring_type = HTT_HW_TO_SW_RING;
   809			break;
   810		case HAL_RXDMA_MONITOR_DESC:
   811			htt_ring_id = HTT_RXDMA_MONITOR_DESC_RING;
   812			htt_ring_type = HTT_SW_TO_HW_RING;
   813			break;
   814		default:
   815			ath11k_warn(ab, "Unsupported ring type in DP :%d\n", ring_type);
   816			ret = -EINVAL;
   817			goto err_free;
   818		}
   819	
   820		skb_put(skb, len);
   821		cmd = (struct htt_rx_ring_selection_cfg_cmd *)skb->data;
   822		cmd->info0 = FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_MSG_TYPE,
   823					HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG);
   824		if (htt_ring_type == HTT_SW_TO_HW_RING ||
   825		    htt_ring_type == HTT_HW_TO_SW_RING)
   826			cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
   827						 DP_SW2HW_MACID(mac_id));
   828		else
   829			cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
   830						 mac_id);
   831		cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_RING_ID,
   832					 htt_ring_id);
 > 833		cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_SS,
   834					 !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));
   835		cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PS,
   836					 !!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP));
   837	
   838		cmd->info1 = FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE,
   839					rx_buf_size);
 > 840		cmd->pkt_type_en_flags0 = __cpu_to_le32(tlv_filter->pkt_filter_flags0);
 > 841		cmd->pkt_type_en_flags1 = __cpu_to_le32(tlv_filter->pkt_filter_flags1);
 > 842		cmd->pkt_type_en_flags2 = __cpu_to_le32(tlv_filter->pkt_filter_flags2);
 > 843		cmd->pkt_type_en_flags3 = __cpu_to_le32(tlv_filter->pkt_filter_flags3);
 > 844		cmd->rx_filter_tlv = __cpu_to_le32(tlv_filter->rx_filter);
   845	
   846		ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);
   847		if (ret)
   848			goto err_free;
   849	
   850		return 0;
   851	
   852	err_free:
   853		dev_kfree_skb_any(skb);
   854	
   855		return ret;
   856	}
   857	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
