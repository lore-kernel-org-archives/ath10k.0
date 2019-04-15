Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFvel-0003pW-Ss
 for ath10k@lists.infradead.org; Mon, 15 Apr 2019 07:03:58 +0000
Date: Mon, 15 Apr 2019 10:02:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:ath11k-bringup 47/93]
 drivers/net/wireless/ath/ath11k/hal_rx.c:939
 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info1 & (1 <<
 (6))) == 1' is always false.
Message-ID: <20190415070253.GI31633@kadam>
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
To: kbuild@01.org, Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   9bcbbf4cedb7a1f30cb547cf87dc480d7f8a5e87
commit: 627a418bbae46c034b1fd8739c0e94fa62190620 [47/93] ath11k: process monitor status ring for RX stats

New smatch warnings:
drivers/net/wireless/ath/ath11k/hal_rx.c:939 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info1 & (1 << (6))) == 1' is always false.
drivers/net/wireless/ath/ath11k/hal_rx.c:1117 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info0 & (1 << (20))) == 1' is always false.

Old smatch warnings:
drivers/net/wireless/ath/ath11k/hal_rx.c:992 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info1 & (1 << (2))) == 1' is always false.
drivers/net/wireless/ath/ath11k/hal_rx.c:1033 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info1 & (1 << (7))) == 1' is always false.
drivers/net/wireless/ath/ath11k/hal_rx.c:1138 ath11k_hal_rx_parse_mon_status_tlv() warn: masked condition '(info0 & (1 << (20))) == 1' is always false.

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=627a418bbae46c034b1fd8739c0e94fa62190620
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
git remote update ath6kl
git checkout 627a418bbae46c034b1fd8739c0e94fa62190620
vim +939 drivers/net/wireless/ath/ath11k/hal_rx.c

627a418b Manikanta Pubbisetty 2019-03-07   874  
627a418b Manikanta Pubbisetty 2019-03-07   875  static enum hal_rx_mon_status
627a418b Manikanta Pubbisetty 2019-03-07   876  ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
627a418b Manikanta Pubbisetty 2019-03-07   877  				   struct hal_rx_mon_ppdu_info *ppdu_info,
627a418b Manikanta Pubbisetty 2019-03-07   878  				   u32 tlv_tag, u8 *tlv_data)
627a418b Manikanta Pubbisetty 2019-03-07   879  {
627a418b Manikanta Pubbisetty 2019-03-07   880  	u32 info0, info1;
627a418b Manikanta Pubbisetty 2019-03-07   881  
627a418b Manikanta Pubbisetty 2019-03-07   882  	switch (tlv_tag) {
627a418b Manikanta Pubbisetty 2019-03-07   883  	case HAL_RX_PPDU_START: {
627a418b Manikanta Pubbisetty 2019-03-07   884  		struct hal_rx_ppdu_start *ppdu_start =
627a418b Manikanta Pubbisetty 2019-03-07   885  			(struct hal_rx_ppdu_start *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   886  
627a418b Manikanta Pubbisetty 2019-03-07   887  		ppdu_info->ppdu_id =
627a418b Manikanta Pubbisetty 2019-03-07   888  			FIELD_GET(HAL_RX_PPDU_START_INFO0_PPDU_ID,
627a418b Manikanta Pubbisetty 2019-03-07   889  				  __le32_to_cpu(ppdu_start->info0));
627a418b Manikanta Pubbisetty 2019-03-07   890  		ppdu_info->chan_num = __le32_to_cpu(ppdu_start->chan_num);
627a418b Manikanta Pubbisetty 2019-03-07   891  		ppdu_info->ppdu_ts = __le32_to_cpu(ppdu_start->ppdu_start_ts);
627a418b Manikanta Pubbisetty 2019-03-07   892  		break;
627a418b Manikanta Pubbisetty 2019-03-07   893  	}
627a418b Manikanta Pubbisetty 2019-03-07   894  	case HAL_RX_PPDU_END_USER_STATS: {
627a418b Manikanta Pubbisetty 2019-03-07   895  		struct hal_rx_ppdu_end_user_stats *eu_stats =
627a418b Manikanta Pubbisetty 2019-03-07   896  			(struct hal_rx_ppdu_end_user_stats *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   897  
627a418b Manikanta Pubbisetty 2019-03-07   898  		info0 = __le32_to_cpu(eu_stats->info0);
627a418b Manikanta Pubbisetty 2019-03-07   899  		info1 = __le32_to_cpu(eu_stats->info1);
627a418b Manikanta Pubbisetty 2019-03-07   900  
627a418b Manikanta Pubbisetty 2019-03-07   901  		ppdu_info->tid =
627a418b Manikanta Pubbisetty 2019-03-07   902  			ffs(FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP,
627a418b Manikanta Pubbisetty 2019-03-07   903  				      __le32_to_cpu(eu_stats->info6))) - 1;
627a418b Manikanta Pubbisetty 2019-03-07   904  		ppdu_info->tcp_msdu_count =
627a418b Manikanta Pubbisetty 2019-03-07   905  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT,
627a418b Manikanta Pubbisetty 2019-03-07   906  				  __le32_to_cpu(eu_stats->info4));
627a418b Manikanta Pubbisetty 2019-03-07   907  		ppdu_info->udp_msdu_count =
627a418b Manikanta Pubbisetty 2019-03-07   908  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_UDP_MSDU_CNT,
627a418b Manikanta Pubbisetty 2019-03-07   909  				  __le32_to_cpu(eu_stats->info4));
627a418b Manikanta Pubbisetty 2019-03-07   910  		ppdu_info->other_msdu_count =
627a418b Manikanta Pubbisetty 2019-03-07   911  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT,
627a418b Manikanta Pubbisetty 2019-03-07   912  				  __le32_to_cpu(eu_stats->info5));
627a418b Manikanta Pubbisetty 2019-03-07   913  		ppdu_info->tcp_ack_msdu_count =
627a418b Manikanta Pubbisetty 2019-03-07   914  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT,
627a418b Manikanta Pubbisetty 2019-03-07   915  				  __le32_to_cpu(eu_stats->info5));
627a418b Manikanta Pubbisetty 2019-03-07   916  		ppdu_info->preamble_type =
627a418b Manikanta Pubbisetty 2019-03-07   917  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO1_PKT_TYPE, info1);
627a418b Manikanta Pubbisetty 2019-03-07   918  		ppdu_info->num_mpdu_fcs_ok =
627a418b Manikanta Pubbisetty 2019-03-07   919  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK,
627a418b Manikanta Pubbisetty 2019-03-07   920  				  info1);
627a418b Manikanta Pubbisetty 2019-03-07   921  		ppdu_info->num_mpdu_fcs_err =
627a418b Manikanta Pubbisetty 2019-03-07   922  			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR,
627a418b Manikanta Pubbisetty 2019-03-07   923  				  info0);
627a418b Manikanta Pubbisetty 2019-03-07   924  		break;
627a418b Manikanta Pubbisetty 2019-03-07   925  	}
627a418b Manikanta Pubbisetty 2019-03-07   926  	case HAL_PHYRX_HT_SIG: {
627a418b Manikanta Pubbisetty 2019-03-07   927  		struct hal_rx_ht_sig_info *ht_sig =
627a418b Manikanta Pubbisetty 2019-03-07   928  			(struct hal_rx_ht_sig_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   929  
627a418b Manikanta Pubbisetty 2019-03-07   930  		info0 = __le32_to_cpu(ht_sig->info0);
627a418b Manikanta Pubbisetty 2019-03-07   931  		info1 = __le32_to_cpu(ht_sig->info1);
627a418b Manikanta Pubbisetty 2019-03-07   932  
627a418b Manikanta Pubbisetty 2019-03-07   933  		ppdu_info->mcs = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_MCS, info0);
627a418b Manikanta Pubbisetty 2019-03-07   934  		ppdu_info->bw = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_BW, info0);
627a418b Manikanta Pubbisetty 2019-03-07   935  		ppdu_info->is_stbc = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_STBC,
627a418b Manikanta Pubbisetty 2019-03-07   936  					       info1);
627a418b Manikanta Pubbisetty 2019-03-07   937  		ppdu_info->ldpc = (info1 &
627a418b Manikanta Pubbisetty 2019-03-07   938  				   HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING) ==
627a418b Manikanta Pubbisetty 2019-03-07  @939  					HAL_RX_SU_MU_CODING_LDPC;

Smatch thinks HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING is BIT(6) and
HAL_RX_SU_MU_CODING_LDPC is BIT(0) so this can't be true...

627a418b Manikanta Pubbisetty 2019-03-07   940  		ppdu_info->gi = info1 & HAL_RX_HT_SIG_INFO_INFO1_GI;
627a418b Manikanta Pubbisetty 2019-03-07   941  
627a418b Manikanta Pubbisetty 2019-03-07   942  		switch (ppdu_info->mcs) {
627a418b Manikanta Pubbisetty 2019-03-07   943  		case 0 ... 7:
627a418b Manikanta Pubbisetty 2019-03-07   944  			ppdu_info->nss = 1;
627a418b Manikanta Pubbisetty 2019-03-07   945  			break;
627a418b Manikanta Pubbisetty 2019-03-07   946  		case 8 ... 15:
627a418b Manikanta Pubbisetty 2019-03-07   947  			ppdu_info->nss = 2;
627a418b Manikanta Pubbisetty 2019-03-07   948  			break;
627a418b Manikanta Pubbisetty 2019-03-07   949  		case 16 ... 23:
627a418b Manikanta Pubbisetty 2019-03-07   950  			ppdu_info->nss = 3;
627a418b Manikanta Pubbisetty 2019-03-07   951  			break;
627a418b Manikanta Pubbisetty 2019-03-07   952  		case 24 ... 31:
627a418b Manikanta Pubbisetty 2019-03-07   953  			ppdu_info->nss = 4;
627a418b Manikanta Pubbisetty 2019-03-07   954  			break;
627a418b Manikanta Pubbisetty 2019-03-07   955  		}
627a418b Manikanta Pubbisetty 2019-03-07   956  
627a418b Manikanta Pubbisetty 2019-03-07   957  		if (ppdu_info->nss > 1)
627a418b Manikanta Pubbisetty 2019-03-07   958  			ppdu_info->mcs = ppdu_info->mcs % 8;
627a418b Manikanta Pubbisetty 2019-03-07   959  
627a418b Manikanta Pubbisetty 2019-03-07   960  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
627a418b Manikanta Pubbisetty 2019-03-07   961  		break;
627a418b Manikanta Pubbisetty 2019-03-07   962  	}
627a418b Manikanta Pubbisetty 2019-03-07   963  	case HAL_PHYRX_L_SIG_B: {
627a418b Manikanta Pubbisetty 2019-03-07   964  		struct hal_rx_lsig_b_info *lsigb =
627a418b Manikanta Pubbisetty 2019-03-07   965  			(struct hal_rx_lsig_b_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   966  
627a418b Manikanta Pubbisetty 2019-03-07   967  		ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_B_INFO_INFO0_RATE,
627a418b Manikanta Pubbisetty 2019-03-07   968  					    __le32_to_cpu(lsigb->info0));
627a418b Manikanta Pubbisetty 2019-03-07   969  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
627a418b Manikanta Pubbisetty 2019-03-07   970  		break;
627a418b Manikanta Pubbisetty 2019-03-07   971  	}
627a418b Manikanta Pubbisetty 2019-03-07   972  	case HAL_PHYRX_L_SIG_A: {
627a418b Manikanta Pubbisetty 2019-03-07   973  		struct hal_rx_lsig_a_info *lsiga =
627a418b Manikanta Pubbisetty 2019-03-07   974  			(struct hal_rx_lsig_a_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   975  
627a418b Manikanta Pubbisetty 2019-03-07   976  		ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_A_INFO_INFO0_RATE,
627a418b Manikanta Pubbisetty 2019-03-07   977  					    __le32_to_cpu(lsiga->info0));
627a418b Manikanta Pubbisetty 2019-03-07   978  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
627a418b Manikanta Pubbisetty 2019-03-07   979  		break;
627a418b Manikanta Pubbisetty 2019-03-07   980  	}
627a418b Manikanta Pubbisetty 2019-03-07   981  	case HAL_PHYRX_VHT_SIG_A: {
627a418b Manikanta Pubbisetty 2019-03-07   982  		struct hal_rx_vht_sig_a_info *vht_sig =
627a418b Manikanta Pubbisetty 2019-03-07   983  			(struct hal_rx_vht_sig_a_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07   984  		u32 nsts;
627a418b Manikanta Pubbisetty 2019-03-07   985  		u32 group_id;
627a418b Manikanta Pubbisetty 2019-03-07   986  
627a418b Manikanta Pubbisetty 2019-03-07   987  		info0 = __le32_to_cpu(vht_sig->info0);
627a418b Manikanta Pubbisetty 2019-03-07   988  		info1 = __le32_to_cpu(vht_sig->info1);
627a418b Manikanta Pubbisetty 2019-03-07   989  
627a418b Manikanta Pubbisetty 2019-03-07   990  		ppdu_info->ldpc = (info1 &
627a418b Manikanta Pubbisetty 2019-03-07   991  				   HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING) ==
627a418b Manikanta Pubbisetty 2019-03-07   992  					HAL_RX_SU_MU_CODING_LDPC;
627a418b Manikanta Pubbisetty 2019-03-07   993  		ppdu_info->mcs = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
627a418b Manikanta Pubbisetty 2019-03-07   994  					   info1);
627a418b Manikanta Pubbisetty 2019-03-07   995  		ppdu_info->gi =
627a418b Manikanta Pubbisetty 2019-03-07   996  			FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
627a418b Manikanta Pubbisetty 2019-03-07   997  				  info1);
627a418b Manikanta Pubbisetty 2019-03-07   998  		ppdu_info->is_stbc = info0 & HAL_RX_VHT_SIG_A_INFO_INFO0_STBC;
627a418b Manikanta Pubbisetty 2019-03-07   999  		nsts = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_NSTS, info0);
627a418b Manikanta Pubbisetty 2019-03-07  1000  		if (ppdu_info->is_stbc && nsts > 0)
627a418b Manikanta Pubbisetty 2019-03-07  1001  			nsts = ((nsts + 1) >> 1) - 1;
627a418b Manikanta Pubbisetty 2019-03-07  1002  
627a418b Manikanta Pubbisetty 2019-03-07  1003  		ppdu_info->nss = (nsts & VHT_SIG_SU_NSS_MASK) + 1;
627a418b Manikanta Pubbisetty 2019-03-07  1004  		ppdu_info->bw = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_BW,
627a418b Manikanta Pubbisetty 2019-03-07  1005  					  info0);
627a418b Manikanta Pubbisetty 2019-03-07  1006  		ppdu_info->beamformed = info1 &
627a418b Manikanta Pubbisetty 2019-03-07  1007  					HAL_RX_VHT_SIG_A_INFO_INFO1_BEAMFORMED;
627a418b Manikanta Pubbisetty 2019-03-07  1008  		group_id = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_GROUP_ID,
627a418b Manikanta Pubbisetty 2019-03-07  1009  				     info0);
627a418b Manikanta Pubbisetty 2019-03-07  1010  		if (group_id == 0 || group_id == 63)
627a418b Manikanta Pubbisetty 2019-03-07  1011  			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
627a418b Manikanta Pubbisetty 2019-03-07  1012  		else
627a418b Manikanta Pubbisetty 2019-03-07  1013  			ppdu_info->reception_type =
627a418b Manikanta Pubbisetty 2019-03-07  1014  				HAL_RX_RECEPTION_TYPE_MU_MIMO;
627a418b Manikanta Pubbisetty 2019-03-07  1015  		break;
627a418b Manikanta Pubbisetty 2019-03-07  1016  	}
627a418b Manikanta Pubbisetty 2019-03-07  1017  	case HAL_PHYRX_HE_SIG_A_SU: {
627a418b Manikanta Pubbisetty 2019-03-07  1018  		struct hal_rx_he_sig_a_su_info *he_sig_a =
627a418b Manikanta Pubbisetty 2019-03-07  1019  			(struct hal_rx_he_sig_a_su_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07  1020  		u32 nsts, cp_ltf, dcm;
627a418b Manikanta Pubbisetty 2019-03-07  1021  
627a418b Manikanta Pubbisetty 2019-03-07  1022  		info0 = __le32_to_cpu(he_sig_a->info0);
627a418b Manikanta Pubbisetty 2019-03-07  1023  		info1 = __le32_to_cpu(he_sig_a->info1);
627a418b Manikanta Pubbisetty 2019-03-07  1024  
627a418b Manikanta Pubbisetty 2019-03-07  1025  		ppdu_info->mcs =
627a418b Manikanta Pubbisetty 2019-03-07  1026  			FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS,
627a418b Manikanta Pubbisetty 2019-03-07  1027  				  info0);
627a418b Manikanta Pubbisetty 2019-03-07  1028  		ppdu_info->bw =
627a418b Manikanta Pubbisetty 2019-03-07  1029  			FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW,
627a418b Manikanta Pubbisetty 2019-03-07  1030  				  info0);
627a418b Manikanta Pubbisetty 2019-03-07  1031  		ppdu_info->ldpc = (info1 &
627a418b Manikanta Pubbisetty 2019-03-07  1032  				   HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING) ==
627a418b Manikanta Pubbisetty 2019-03-07  1033  					HAL_RX_SU_MU_CODING_LDPC;
627a418b Manikanta Pubbisetty 2019-03-07  1034  		ppdu_info->is_stbc = info1 &
627a418b Manikanta Pubbisetty 2019-03-07  1035  				     HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC;
627a418b Manikanta Pubbisetty 2019-03-07  1036  		ppdu_info->beamformed = info1 &
627a418b Manikanta Pubbisetty 2019-03-07  1037  					HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF;
627a418b Manikanta Pubbisetty 2019-03-07  1038  		dcm = info0 & HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM;
627a418b Manikanta Pubbisetty 2019-03-07  1039  		cp_ltf = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_CP_LTF_SIZE,
627a418b Manikanta Pubbisetty 2019-03-07  1040  				   info0);
627a418b Manikanta Pubbisetty 2019-03-07  1041  		nsts = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS, info0);
627a418b Manikanta Pubbisetty 2019-03-07  1042  
627a418b Manikanta Pubbisetty 2019-03-07  1043  		switch (cp_ltf) {
627a418b Manikanta Pubbisetty 2019-03-07  1044  		case 0:
627a418b Manikanta Pubbisetty 2019-03-07  1045  		case 1:
627a418b Manikanta Pubbisetty 2019-03-07  1046  			ppdu_info->gi = HAL_RX_GI_0_8_US;
627a418b Manikanta Pubbisetty 2019-03-07  1047  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1048  		case 2:
627a418b Manikanta Pubbisetty 2019-03-07  1049  			ppdu_info->gi = HAL_RX_GI_1_6_US;
627a418b Manikanta Pubbisetty 2019-03-07  1050  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1051  		case 3:
627a418b Manikanta Pubbisetty 2019-03-07  1052  			if (dcm && ppdu_info->is_stbc)
627a418b Manikanta Pubbisetty 2019-03-07  1053  				ppdu_info->gi = HAL_RX_GI_0_8_US;
627a418b Manikanta Pubbisetty 2019-03-07  1054  			else
627a418b Manikanta Pubbisetty 2019-03-07  1055  				ppdu_info->gi = HAL_RX_GI_3_2_US;
627a418b Manikanta Pubbisetty 2019-03-07  1056  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1057  		}
627a418b Manikanta Pubbisetty 2019-03-07  1058  
627a418b Manikanta Pubbisetty 2019-03-07  1059  		ppdu_info->nss = nsts + 1;
627a418b Manikanta Pubbisetty 2019-03-07  1060  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
627a418b Manikanta Pubbisetty 2019-03-07  1061  		break;
627a418b Manikanta Pubbisetty 2019-03-07  1062  	}
627a418b Manikanta Pubbisetty 2019-03-07  1063  	case HAL_PHYRX_HE_SIG_A_MU_DL: {
627a418b Manikanta Pubbisetty 2019-03-07  1064  		struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl =
627a418b Manikanta Pubbisetty 2019-03-07  1065  			(struct hal_rx_he_sig_a_mu_dl_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07  1066  
627a418b Manikanta Pubbisetty 2019-03-07  1067  		u32 cp_ltf;
627a418b Manikanta Pubbisetty 2019-03-07  1068  
627a418b Manikanta Pubbisetty 2019-03-07  1069  		info0 = __le32_to_cpu(he_sig_a_mu_dl->info0);
627a418b Manikanta Pubbisetty 2019-03-07  1070  		info1 = __le32_to_cpu(he_sig_a_mu_dl->info1);
627a418b Manikanta Pubbisetty 2019-03-07  1071  
627a418b Manikanta Pubbisetty 2019-03-07  1072  		ppdu_info->bw =
627a418b Manikanta Pubbisetty 2019-03-07  1073  			FIELD_GET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_TRANSMIT_BW,
627a418b Manikanta Pubbisetty 2019-03-07  1074  				  info0);
627a418b Manikanta Pubbisetty 2019-03-07  1075  		cp_ltf = FIELD_GET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_CP_LTF_SIZE,
627a418b Manikanta Pubbisetty 2019-03-07  1076  				   info0);
627a418b Manikanta Pubbisetty 2019-03-07  1077  
627a418b Manikanta Pubbisetty 2019-03-07  1078  		switch (cp_ltf) {
627a418b Manikanta Pubbisetty 2019-03-07  1079  		case 0:
627a418b Manikanta Pubbisetty 2019-03-07  1080  		case 1:
627a418b Manikanta Pubbisetty 2019-03-07  1081  			ppdu_info->gi = HAL_RX_GI_0_8_US;
627a418b Manikanta Pubbisetty 2019-03-07  1082  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1083  		case 2:
627a418b Manikanta Pubbisetty 2019-03-07  1084  			ppdu_info->gi = HAL_RX_GI_1_6_US;
627a418b Manikanta Pubbisetty 2019-03-07  1085  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1086  		case 3:
627a418b Manikanta Pubbisetty 2019-03-07  1087  			ppdu_info->gi = HAL_RX_GI_3_2_US;
627a418b Manikanta Pubbisetty 2019-03-07  1088  			break;
627a418b Manikanta Pubbisetty 2019-03-07  1089  		}
627a418b Manikanta Pubbisetty 2019-03-07  1090  
627a418b Manikanta Pubbisetty 2019-03-07  1091  		ppdu_info->is_stbc = info1 &
627a418b Manikanta Pubbisetty 2019-03-07  1092  				     HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_STBC;
627a418b Manikanta Pubbisetty 2019-03-07  1093  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
627a418b Manikanta Pubbisetty 2019-03-07  1094  		break;
627a418b Manikanta Pubbisetty 2019-03-07  1095  	}
627a418b Manikanta Pubbisetty 2019-03-07  1096  	case HAL_PHYRX_HE_SIG_B1_MU: {
627a418b Manikanta Pubbisetty 2019-03-07  1097  		/* TODO: Check if resource unit(RU) allocation stats
627a418b Manikanta Pubbisetty 2019-03-07  1098  		 * are required
627a418b Manikanta Pubbisetty 2019-03-07  1099  		 */
627a418b Manikanta Pubbisetty 2019-03-07  1100  		ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
627a418b Manikanta Pubbisetty 2019-03-07  1101  		break;
627a418b Manikanta Pubbisetty 2019-03-07  1102  	}
627a418b Manikanta Pubbisetty 2019-03-07  1103  	case HAL_PHYRX_HE_SIG_B2_MU: {
627a418b Manikanta Pubbisetty 2019-03-07  1104  		struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu =
627a418b Manikanta Pubbisetty 2019-03-07  1105  			(struct hal_rx_he_sig_b2_mu_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07  1106  
627a418b Manikanta Pubbisetty 2019-03-07  1107  		info0 = __le32_to_cpu(he_sig_b2_mu->info0);
627a418b Manikanta Pubbisetty 2019-03-07  1108  
627a418b Manikanta Pubbisetty 2019-03-07  1109  		ppdu_info->mcs =
627a418b Manikanta Pubbisetty 2019-03-07  1110  			FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_MCS,
627a418b Manikanta Pubbisetty 2019-03-07  1111  				  info0);
627a418b Manikanta Pubbisetty 2019-03-07  1112  		ppdu_info->nss =
627a418b Manikanta Pubbisetty 2019-03-07  1113  			FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS,
627a418b Manikanta Pubbisetty 2019-03-07  1114  				  info0) + 1;
627a418b Manikanta Pubbisetty 2019-03-07  1115  		ppdu_info->ldpc = (info0 &
627a418b Manikanta Pubbisetty 2019-03-07  1116  				   HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING) ==
627a418b Manikanta Pubbisetty 2019-03-07 @1117  					HAL_RX_SU_MU_CODING_LDPC;
                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

627a418b Manikanta Pubbisetty 2019-03-07  1118  		break;
627a418b Manikanta Pubbisetty 2019-03-07  1119  	}
627a418b Manikanta Pubbisetty 2019-03-07  1120  	case HAL_PHYRX_HE_SIG_B2_OFDMA: {
627a418b Manikanta Pubbisetty 2019-03-07  1121  		struct hal_rx_he_sig_b2_ofdma_info *he_sig_b2_ofdma =
627a418b Manikanta Pubbisetty 2019-03-07  1122  			(struct hal_rx_he_sig_b2_ofdma_info *)tlv_data;
627a418b Manikanta Pubbisetty 2019-03-07  1123  
627a418b Manikanta Pubbisetty 2019-03-07  1124  		info0 = __le32_to_cpu(he_sig_b2_ofdma->info0);
627a418b Manikanta Pubbisetty 2019-03-07  1125  
627a418b Manikanta Pubbisetty 2019-03-07  1126  		ppdu_info->mcs =

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
