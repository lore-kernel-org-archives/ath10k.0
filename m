Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwsh-0001YU-6D
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 08:22:25 +0000
Date: Mon, 15 Apr 2019 11:21:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 93/93]
 drivers/net/wireless/ath/ath11k/debug.c:1143 ath11k_write_pktlog_filter()
 warn: inconsistent returns 'mutex:&ar->conf_mutex'.
Message-ID: <20190415082128.GN31633@kadam>
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
To: kbuild@01.org, Anilkumar Kolli <akolli@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87 [93/93] ath11k: enable pktlog filter per peer

New smatch warnings:
drivers/net/wireless/ath/ath11k/debug.c:1143 ath11k_write_pktlog_filter() warn: inconsistent returns 'mutex:&ar->conf_mutex'.
  Locked on:   line 1115
  Unlocked on: line 1143

Old smatch warnings:
drivers/net/wireless/ath/ath11k/debug.c:700 ath11k_write_simulate_fw_crash() error: uninitialized symbol 'radioup'.

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
vim +1143 drivers/net/wireless/ath/ath11k/debug.c

d25cb35c Sathishkumar Muruganandam 2019-02-13   988  
62a55be6 Anilkumar Kolli           2019-04-05   989  static ssize_t ath11k_write_pktlog_filter(struct file *file,
62a55be6 Anilkumar Kolli           2019-04-05   990  					  const char __user *ubuf,
62a55be6 Anilkumar Kolli           2019-04-05   991  					  size_t count, loff_t *ppos)
62a55be6 Anilkumar Kolli           2019-04-05   992  {
62a55be6 Anilkumar Kolli           2019-04-05   993  	struct ath11k *ar = file->private_data;
b1860013 Anilkumar Kolli           2019-04-05   994  	struct htt_rx_ring_tlv_filter tlv_filter = {0};
9bcbbf4c Anilkumar Kolli           2019-04-05   995  	u32 rx_filter = 0, ring_id, filter, peer_valid;
9bcbbf4c Anilkumar Kolli           2019-04-05   996  	u8 buf[128] = {0}, mac_addr[ETH_ALEN] = {0}, mode;
b1860013 Anilkumar Kolli           2019-04-05   997  	char *token, *sptr;
9bcbbf4c Anilkumar Kolli           2019-04-05   998  	int ret, i;
b1860013 Anilkumar Kolli           2019-04-05   999  	ssize_t rc;
62a55be6 Anilkumar Kolli           2019-04-05  1000  
62a55be6 Anilkumar Kolli           2019-04-05  1001  	mutex_lock(&ar->conf_mutex);
62a55be6 Anilkumar Kolli           2019-04-05  1002  	if (ar->state != ATH11K_STATE_ON) {
62a55be6 Anilkumar Kolli           2019-04-05  1003  		ret = -ENETDOWN;
62a55be6 Anilkumar Kolli           2019-04-05  1004  		goto out;
62a55be6 Anilkumar Kolli           2019-04-05  1005  	}
62a55be6 Anilkumar Kolli           2019-04-05  1006  
b1860013 Anilkumar Kolli           2019-04-05  1007  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
b1860013 Anilkumar Kolli           2019-04-05  1008  	if (rc < 0) {
b1860013 Anilkumar Kolli           2019-04-05  1009  		ret = rc;
b1860013 Anilkumar Kolli           2019-04-05  1010  		goto out;
b1860013 Anilkumar Kolli           2019-04-05  1011  	}
b1860013 Anilkumar Kolli           2019-04-05  1012  	buf[rc] = '\0';
b1860013 Anilkumar Kolli           2019-04-05  1013  	sptr = buf;
b1860013 Anilkumar Kolli           2019-04-05  1014  
b1860013 Anilkumar Kolli           2019-04-05  1015  	token = strsep(&sptr, " ");
b1860013 Anilkumar Kolli           2019-04-05  1016  	if (!token) {
b1860013 Anilkumar Kolli           2019-04-05  1017  		ret = -EINVAL;
b1860013 Anilkumar Kolli           2019-04-05  1018  		goto out;
b1860013 Anilkumar Kolli           2019-04-05  1019  	}
b1860013 Anilkumar Kolli           2019-04-05  1020  
b1860013 Anilkumar Kolli           2019-04-05  1021  	if (kstrtou32(token, 0, &filter)) {
b1860013 Anilkumar Kolli           2019-04-05  1022  		ret = -EINVAL;
b1860013 Anilkumar Kolli           2019-04-05  1023  		goto out;
b1860013 Anilkumar Kolli           2019-04-05  1024  	}
b1860013 Anilkumar Kolli           2019-04-05  1025  
62a55be6 Anilkumar Kolli           2019-04-05  1026  	if (filter == ar->debug.pktlog_filter) {
62a55be6 Anilkumar Kolli           2019-04-05  1027  		ret = count;
62a55be6 Anilkumar Kolli           2019-04-05  1028  		goto out;
62a55be6 Anilkumar Kolli           2019-04-05  1029  	}
62a55be6 Anilkumar Kolli           2019-04-05  1030  
b1860013 Anilkumar Kolli           2019-04-05  1031  	if (filter) {
b1860013 Anilkumar Kolli           2019-04-05  1032  		ret = ath11k_wmi_pdev_pktlog_enable(ar, filter);
b1860013 Anilkumar Kolli           2019-04-05  1033  		if (ret) {
62a55be6 Anilkumar Kolli           2019-04-05  1034  			ath11k_warn(ar->ab,
62a55be6 Anilkumar Kolli           2019-04-05  1035  				    "failed to enable pktlog filter %x: %d\n",
62a55be6 Anilkumar Kolli           2019-04-05  1036  				    ar->debug.pktlog_filter, ret);
b1860013 Anilkumar Kolli           2019-04-05  1037  			goto out;
b1860013 Anilkumar Kolli           2019-04-05  1038  		}
62a55be6 Anilkumar Kolli           2019-04-05  1039  	} else {
62a55be6 Anilkumar Kolli           2019-04-05  1040  		ret = ath11k_wmi_pdev_pktlog_disable(ar);
b1860013 Anilkumar Kolli           2019-04-05  1041  		if (ret) {
62a55be6 Anilkumar Kolli           2019-04-05  1042  			ath11k_warn(ar->ab, "failed to disable pktlog: %d\n", ret);
b1860013 Anilkumar Kolli           2019-04-05  1043  			goto out;
b1860013 Anilkumar Kolli           2019-04-05  1044  		}
b1860013 Anilkumar Kolli           2019-04-05  1045  	}
b1860013 Anilkumar Kolli           2019-04-05  1046  
b1860013 Anilkumar Kolli           2019-04-05  1047  	token = strsep(&sptr, " ");
b1860013 Anilkumar Kolli           2019-04-05  1048  	if (!token) {
b1860013 Anilkumar Kolli           2019-04-05  1049  		ret = -EINVAL;
b1860013 Anilkumar Kolli           2019-04-05  1050  		goto out;
b1860013 Anilkumar Kolli           2019-04-05  1051  	}
b1860013 Anilkumar Kolli           2019-04-05  1052  
b1860013 Anilkumar Kolli           2019-04-05  1053  	if (kstrtou8(token, 0, &mode)) {
b1860013 Anilkumar Kolli           2019-04-05  1054  		ret = -EINVAL;
b1860013 Anilkumar Kolli           2019-04-05  1055  		goto out;
b1860013 Anilkumar Kolli           2019-04-05  1056  	}
b1860013 Anilkumar Kolli           2019-04-05  1057  
b1860013 Anilkumar Kolli           2019-04-05  1058  	if (mode == ATH11K_PKTLOG_MODE_FULL) {
b1860013 Anilkumar Kolli           2019-04-05  1059  		rx_filter = HTT_RX_FILTER_TLV_FLAGS_PPDU_START |
b1860013 Anilkumar Kolli           2019-04-05  1060  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
b1860013 Anilkumar Kolli           2019-04-05  1061  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
b1860013 Anilkumar Kolli           2019-04-05  1062  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT |
b1860013 Anilkumar Kolli           2019-04-05  1063  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
b1860013 Anilkumar Kolli           2019-04-05  1064  			    HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
b1860013 Anilkumar Kolli           2019-04-05  1065  			    HTT_RX_FILTER_TLV_FLAGS_MSDU_START |
b1860013 Anilkumar Kolli           2019-04-05  1066  			    HTT_RX_FILTER_TLV_FLAGS_MSDU_END |
b1860013 Anilkumar Kolli           2019-04-05  1067  			    HTT_RX_FILTER_TLV_FLAGS_MPDU_END |
b1860013 Anilkumar Kolli           2019-04-05  1068  			    HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER |
b1860013 Anilkumar Kolli           2019-04-05  1069  			    HTT_RX_FILTER_TLV_FLAGS_ATTENTION;
b1860013 Anilkumar Kolli           2019-04-05  1070  	} else if (mode == ATH11K_PKTLOG_MODE_LITE) {
b1860013 Anilkumar Kolli           2019-04-05  1071  		rx_filter = HTT_RX_FILTER_TLV_FLAGS_PPDU_START |
b1860013 Anilkumar Kolli           2019-04-05  1072  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
b1860013 Anilkumar Kolli           2019-04-05  1073  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
b1860013 Anilkumar Kolli           2019-04-05  1074  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT |
b1860013 Anilkumar Kolli           2019-04-05  1075  			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
b1860013 Anilkumar Kolli           2019-04-05  1076  			    HTT_RX_FILTER_TLV_FLAGS_MPDU_START;
b1860013 Anilkumar Kolli           2019-04-05  1077  	}
b1860013 Anilkumar Kolli           2019-04-05  1078  
b1860013 Anilkumar Kolli           2019-04-05  1079  	tlv_filter.rx_filter = rx_filter;
b1860013 Anilkumar Kolli           2019-04-05  1080  	if (rx_filter) {
b1860013 Anilkumar Kolli           2019-04-05  1081  		tlv_filter.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0;
b1860013 Anilkumar Kolli           2019-04-05  1082  		tlv_filter.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1;
b1860013 Anilkumar Kolli           2019-04-05  1083  		tlv_filter.pkt_filter_flags2 = HTT_RX_FP_CTRL_FILTER_FLASG2;
b1860013 Anilkumar Kolli           2019-04-05  1084  		tlv_filter.pkt_filter_flags3 = HTT_RX_FP_CTRL_FILTER_FLASG3 |
b1860013 Anilkumar Kolli           2019-04-05  1085  					       HTT_RX_FP_DATA_FILTER_FLASG3;
b1860013 Anilkumar Kolli           2019-04-05  1086  	}
b1860013 Anilkumar Kolli           2019-04-05  1087  
b1860013 Anilkumar Kolli           2019-04-05  1088  	ring_id = ar->dp.rx_mon_status_refill_ring.refill_buf_ring.ring_id;
b1860013 Anilkumar Kolli           2019-04-05  1089  	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
b1860013 Anilkumar Kolli           2019-04-05  1090  					    HAL_RXDMA_MONITOR_STATUS,
b1860013 Anilkumar Kolli           2019-04-05  1091  					    DP_RX_BUFFER_SIZE, &tlv_filter);
b1860013 Anilkumar Kolli           2019-04-05  1092  
b1860013 Anilkumar Kolli           2019-04-05  1093  	if (ret) {
b1860013 Anilkumar Kolli           2019-04-05  1094  		ath11k_warn(ar->ab, "failed to set rx filter for moniter status ring\n");
b1860013 Anilkumar Kolli           2019-04-05  1095  		goto out;
62a55be6 Anilkumar Kolli           2019-04-05  1096  	}
62a55be6 Anilkumar Kolli           2019-04-05  1097  
9bcbbf4c Anilkumar Kolli           2019-04-05  1098  	token = strsep(&sptr, " ");
9bcbbf4c Anilkumar Kolli           2019-04-05  1099  	if (!token) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1100  		ret = -EINVAL;
9bcbbf4c Anilkumar Kolli           2019-04-05  1101  		goto out;
9bcbbf4c Anilkumar Kolli           2019-04-05  1102  	}
9bcbbf4c Anilkumar Kolli           2019-04-05  1103  
9bcbbf4c Anilkumar Kolli           2019-04-05  1104  	if (kstrtou32(token, 0, &peer_valid)) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1105  		ret = -EINVAL;
9bcbbf4c Anilkumar Kolli           2019-04-05  1106  		goto out;
9bcbbf4c Anilkumar Kolli           2019-04-05  1107  	}
9bcbbf4c Anilkumar Kolli           2019-04-05  1108  
9bcbbf4c Anilkumar Kolli           2019-04-05  1109  	if (peer_valid) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1110  		token = strsep(&sptr, " ");
9bcbbf4c Anilkumar Kolli           2019-04-05  1111  		if (token) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1112  			for (i = 0; i < ETH_ALEN - 1; i++) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1113  				token = strsep(&sptr, ":");
9bcbbf4c Anilkumar Kolli           2019-04-05  1114  				if (!token)
9bcbbf4c Anilkumar Kolli           2019-04-05  1115  					return -EINVAL;
                                                                                        ^^^^^^^^^^^^^^^
9bcbbf4c Anilkumar Kolli           2019-04-05  1116  
9bcbbf4c Anilkumar Kolli           2019-04-05  1117  				if (kstrtou8(token, 16, &mac_addr[i]))
9bcbbf4c Anilkumar Kolli           2019-04-05  1118  					return -EINVAL;
                                                                                        ^^^^^^^^^^^^^^^
It should be goto out.  Btw, "goto unlock;" is a better name because
it tells you what the goto does.  People don't spend enough time
thinking about label names so I always try to nag them and annoy them.
It is the punishment.

9bcbbf4c Anilkumar Kolli           2019-04-05  1119  			}
9bcbbf4c Anilkumar Kolli           2019-04-05  1120  			memcpy(ar->debug.pktlog_peer_addr, mac_addr, ETH_ALEN);
9bcbbf4c Anilkumar Kolli           2019-04-05  1121  		}
9bcbbf4c Anilkumar Kolli           2019-04-05  1122  	}
9bcbbf4c Anilkumar Kolli           2019-04-05  1123  
9bcbbf4c Anilkumar Kolli           2019-04-05  1124  	/* Send peer based pktlog enable/disable */
9bcbbf4c Anilkumar Kolli           2019-04-05  1125  	ret = ath11k_wmi_pdev_peer_pktlog_filter(ar, mac_addr, peer_valid);
9bcbbf4c Anilkumar Kolli           2019-04-05  1126  	if (ret) {
9bcbbf4c Anilkumar Kolli           2019-04-05  1127  		ath11k_warn(ar->ab, "failed to set peer pktlog filter %pM: %d\n",
9bcbbf4c Anilkumar Kolli           2019-04-05  1128  			    mac_addr, ret);
9bcbbf4c Anilkumar Kolli           2019-04-05  1129  		goto out;
9bcbbf4c Anilkumar Kolli           2019-04-05  1130  	}
9bcbbf4c Anilkumar Kolli           2019-04-05  1131  
9bcbbf4c Anilkumar Kolli           2019-04-05  1132  	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "pktlog filter %d mode %s peer addr %pM\n",
9bcbbf4c Anilkumar Kolli           2019-04-05  1133  		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL)?"full":"lite"),
9bcbbf4c Anilkumar Kolli           2019-04-05  1134  		   ar->debug.pktlog_peer_addr);
9bcbbf4c Anilkumar Kolli           2019-04-05  1135  
62a55be6 Anilkumar Kolli           2019-04-05  1136  	ar->debug.pktlog_filter = filter;
b1860013 Anilkumar Kolli           2019-04-05  1137  	ar->debug.pktlog_mode = mode;
9bcbbf4c Anilkumar Kolli           2019-04-05  1138  	ar->debug.pktlog_peer_valid = peer_valid;
62a55be6 Anilkumar Kolli           2019-04-05  1139  	ret = count;
62a55be6 Anilkumar Kolli           2019-04-05  1140  
62a55be6 Anilkumar Kolli           2019-04-05  1141  out:
62a55be6 Anilkumar Kolli           2019-04-05  1142  	mutex_unlock(&ar->conf_mutex);
62a55be6 Anilkumar Kolli           2019-04-05 @1143  	return ret;
62a55be6 Anilkumar Kolli           2019-04-05  1144  }
62a55be6 Anilkumar Kolli           2019-04-05  1145  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
