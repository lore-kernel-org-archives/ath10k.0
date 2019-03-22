Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7Acu-0001cv-GY
 for ath10k@lists.infradead.org; Fri, 22 Mar 2019 03:13:54 +0000
Date: Fri, 22 Mar 2019 08:46:14 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath11k-bringup 47/60]
 drivers/net/wireless/ath/ath11k/hal_rx.c:1156:27: sparse: cast to restricted
 __le32
Message-ID: <201903220812.24scFjG9%lkp@intel.com>
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
head:   3c46e2415dac1f744640d0e42594fb27de804df9
commit: 627a418bbae46c034b1fd8739c0e94fa62190620 [47/60] ath11k: process monitor status ring for RX stats
reproduce:
        # apt-get install sparse
        git checkout 627a418bbae46c034b1fd8739c0e94fa62190620
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath11k/hal_rx.c:118:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:120:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:122:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:124:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:126:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:128:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:130:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:132:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:134:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:136:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:138:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:140:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:142:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:144:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:146:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:148:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:150:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:152:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:154:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:156:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:158:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:160:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:166:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:170:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:172:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:176:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:178:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:180:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:182:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:184:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:186:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:188:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:190:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:192:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:212:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:216:17: sparse: dubious: x & !y
   drivers/net/wireless/ath/ath11k/hal_rx.c:218:17: sparse: dubious: x & !y
>> drivers/net/wireless/ath/ath11k/hal_rx.c:1156:27: sparse: cast to restricted __le32
>> drivers/net/wireless/ath/ath11k/hal_rx.c:1156:27: sparse: cast to restricted __le32

vim +1156 drivers/net/wireless/ath/ath11k/hal_rx.c

   874	
   875	static enum hal_rx_mon_status
   876	ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
   877					   struct hal_rx_mon_ppdu_info *ppdu_info,
   878					   u32 tlv_tag, u8 *tlv_data)
   879	{
   880		u32 info0, info1;
   881	
   882		switch (tlv_tag) {
   883		case HAL_RX_PPDU_START: {
   884			struct hal_rx_ppdu_start *ppdu_start =
   885				(struct hal_rx_ppdu_start *)tlv_data;
   886	
   887			ppdu_info->ppdu_id =
   888				FIELD_GET(HAL_RX_PPDU_START_INFO0_PPDU_ID,
   889					  __le32_to_cpu(ppdu_start->info0));
   890			ppdu_info->chan_num = __le32_to_cpu(ppdu_start->chan_num);
   891			ppdu_info->ppdu_ts = __le32_to_cpu(ppdu_start->ppdu_start_ts);
   892			break;
   893		}
   894		case HAL_RX_PPDU_END_USER_STATS: {
   895			struct hal_rx_ppdu_end_user_stats *eu_stats =
   896				(struct hal_rx_ppdu_end_user_stats *)tlv_data;
   897	
   898			info0 = __le32_to_cpu(eu_stats->info0);
   899			info1 = __le32_to_cpu(eu_stats->info1);
   900	
   901			ppdu_info->tid =
   902				ffs(FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP,
   903					      __le32_to_cpu(eu_stats->info6))) - 1;
   904			ppdu_info->tcp_msdu_count =
   905				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT,
   906					  __le32_to_cpu(eu_stats->info4));
   907			ppdu_info->udp_msdu_count =
   908				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_UDP_MSDU_CNT,
   909					  __le32_to_cpu(eu_stats->info4));
   910			ppdu_info->other_msdu_count =
   911				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT,
   912					  __le32_to_cpu(eu_stats->info5));
   913			ppdu_info->tcp_ack_msdu_count =
   914				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT,
   915					  __le32_to_cpu(eu_stats->info5));
   916			ppdu_info->preamble_type =
   917				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO1_PKT_TYPE, info1);
   918			ppdu_info->num_mpdu_fcs_ok =
   919				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK,
   920					  info1);
   921			ppdu_info->num_mpdu_fcs_err =
   922				FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR,
   923					  info0);
   924			break;
   925		}
   926		case HAL_PHYRX_HT_SIG: {
   927			struct hal_rx_ht_sig_info *ht_sig =
   928				(struct hal_rx_ht_sig_info *)tlv_data;
   929	
   930			info0 = __le32_to_cpu(ht_sig->info0);
   931			info1 = __le32_to_cpu(ht_sig->info1);
   932	
   933			ppdu_info->mcs = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_MCS, info0);
   934			ppdu_info->bw = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_BW, info0);
   935			ppdu_info->is_stbc = FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_STBC,
   936						       info1);
   937			ppdu_info->ldpc = (info1 &
   938					   HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING) ==
   939						HAL_RX_SU_MU_CODING_LDPC;
   940			ppdu_info->gi = info1 & HAL_RX_HT_SIG_INFO_INFO1_GI;
   941	
   942			switch (ppdu_info->mcs) {
   943			case 0 ... 7:
   944				ppdu_info->nss = 1;
   945				break;
   946			case 8 ... 15:
   947				ppdu_info->nss = 2;
   948				break;
   949			case 16 ... 23:
   950				ppdu_info->nss = 3;
   951				break;
   952			case 24 ... 31:
   953				ppdu_info->nss = 4;
   954				break;
   955			}
   956	
   957			if (ppdu_info->nss > 1)
   958				ppdu_info->mcs = ppdu_info->mcs % 8;
   959	
   960			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
   961			break;
   962		}
   963		case HAL_PHYRX_L_SIG_B: {
   964			struct hal_rx_lsig_b_info *lsigb =
   965				(struct hal_rx_lsig_b_info *)tlv_data;
   966	
   967			ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_B_INFO_INFO0_RATE,
   968						    __le32_to_cpu(lsigb->info0));
   969			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
   970			break;
   971		}
   972		case HAL_PHYRX_L_SIG_A: {
   973			struct hal_rx_lsig_a_info *lsiga =
   974				(struct hal_rx_lsig_a_info *)tlv_data;
   975	
   976			ppdu_info->rate = FIELD_GET(HAL_RX_LSIG_A_INFO_INFO0_RATE,
   977						    __le32_to_cpu(lsiga->info0));
   978			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
   979			break;
   980		}
   981		case HAL_PHYRX_VHT_SIG_A: {
   982			struct hal_rx_vht_sig_a_info *vht_sig =
   983				(struct hal_rx_vht_sig_a_info *)tlv_data;
   984			u32 nsts;
   985			u32 group_id;
   986	
   987			info0 = __le32_to_cpu(vht_sig->info0);
   988			info1 = __le32_to_cpu(vht_sig->info1);
   989	
   990			ppdu_info->ldpc = (info1 &
   991					   HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING) ==
   992						HAL_RX_SU_MU_CODING_LDPC;
   993			ppdu_info->mcs = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
   994						   info1);
   995			ppdu_info->gi =
   996				FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
   997					  info1);
   998			ppdu_info->is_stbc = info0 & HAL_RX_VHT_SIG_A_INFO_INFO0_STBC;
   999			nsts = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_NSTS, info0);
  1000			if (ppdu_info->is_stbc && nsts > 0)
  1001				nsts = ((nsts + 1) >> 1) - 1;
  1002	
  1003			ppdu_info->nss = (nsts & VHT_SIG_SU_NSS_MASK) + 1;
  1004			ppdu_info->bw = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_BW,
  1005						  info0);
  1006			ppdu_info->beamformed = info1 &
  1007						HAL_RX_VHT_SIG_A_INFO_INFO1_BEAMFORMED;
  1008			group_id = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_GROUP_ID,
  1009					     info0);
  1010			if (group_id == 0 || group_id == 63)
  1011				ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
  1012			else
  1013				ppdu_info->reception_type =
  1014					HAL_RX_RECEPTION_TYPE_MU_MIMO;
  1015			break;
  1016		}
  1017		case HAL_PHYRX_HE_SIG_A_SU: {
  1018			struct hal_rx_he_sig_a_su_info *he_sig_a =
  1019				(struct hal_rx_he_sig_a_su_info *)tlv_data;
  1020			u32 nsts, cp_ltf, dcm;
  1021	
  1022			info0 = __le32_to_cpu(he_sig_a->info0);
  1023			info1 = __le32_to_cpu(he_sig_a->info1);
  1024	
  1025			ppdu_info->mcs =
  1026				FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS,
  1027					  info0);
  1028			ppdu_info->bw =
  1029				FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW,
  1030					  info0);
  1031			ppdu_info->ldpc = (info1 &
  1032					   HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING) ==
  1033						HAL_RX_SU_MU_CODING_LDPC;
  1034			ppdu_info->is_stbc = info1 &
  1035					     HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC;
  1036			ppdu_info->beamformed = info1 &
  1037						HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF;
  1038			dcm = info0 & HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM;
  1039			cp_ltf = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_CP_LTF_SIZE,
  1040					   info0);
  1041			nsts = FIELD_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS, info0);
  1042	
  1043			switch (cp_ltf) {
  1044			case 0:
  1045			case 1:
  1046				ppdu_info->gi = HAL_RX_GI_0_8_US;
  1047				break;
  1048			case 2:
  1049				ppdu_info->gi = HAL_RX_GI_1_6_US;
  1050				break;
  1051			case 3:
  1052				if (dcm && ppdu_info->is_stbc)
  1053					ppdu_info->gi = HAL_RX_GI_0_8_US;
  1054				else
  1055					ppdu_info->gi = HAL_RX_GI_3_2_US;
  1056				break;
  1057			}
  1058	
  1059			ppdu_info->nss = nsts + 1;
  1060			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
  1061			break;
  1062		}
  1063		case HAL_PHYRX_HE_SIG_A_MU_DL: {
  1064			struct hal_rx_he_sig_a_mu_dl_info *he_sig_a_mu_dl =
  1065				(struct hal_rx_he_sig_a_mu_dl_info *)tlv_data;
  1066	
  1067			u32 cp_ltf;
  1068	
  1069			info0 = __le32_to_cpu(he_sig_a_mu_dl->info0);
  1070			info1 = __le32_to_cpu(he_sig_a_mu_dl->info1);
  1071	
  1072			ppdu_info->bw =
  1073				FIELD_GET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_TRANSMIT_BW,
  1074					  info0);
  1075			cp_ltf = FIELD_GET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_CP_LTF_SIZE,
  1076					   info0);
  1077	
  1078			switch (cp_ltf) {
  1079			case 0:
  1080			case 1:
  1081				ppdu_info->gi = HAL_RX_GI_0_8_US;
  1082				break;
  1083			case 2:
  1084				ppdu_info->gi = HAL_RX_GI_1_6_US;
  1085				break;
  1086			case 3:
  1087				ppdu_info->gi = HAL_RX_GI_3_2_US;
  1088				break;
  1089			}
  1090	
  1091			ppdu_info->is_stbc = info1 &
  1092					     HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_STBC;
  1093			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
  1094			break;
  1095		}
  1096		case HAL_PHYRX_HE_SIG_B1_MU: {
  1097			/* TODO: Check if resource unit(RU) allocation stats
  1098			 * are required
  1099			 */
  1100			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_MIMO;
  1101			break;
  1102		}
  1103		case HAL_PHYRX_HE_SIG_B2_MU: {
  1104			struct hal_rx_he_sig_b2_mu_info *he_sig_b2_mu =
  1105				(struct hal_rx_he_sig_b2_mu_info *)tlv_data;
  1106	
  1107			info0 = __le32_to_cpu(he_sig_b2_mu->info0);
  1108	
  1109			ppdu_info->mcs =
  1110				FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_MCS,
  1111					  info0);
  1112			ppdu_info->nss =
  1113				FIELD_GET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS,
  1114					  info0) + 1;
  1115			ppdu_info->ldpc = (info0 &
  1116					   HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING) ==
  1117						HAL_RX_SU_MU_CODING_LDPC;
  1118			break;
  1119		}
  1120		case HAL_PHYRX_HE_SIG_B2_OFDMA: {
  1121			struct hal_rx_he_sig_b2_ofdma_info *he_sig_b2_ofdma =
  1122				(struct hal_rx_he_sig_b2_ofdma_info *)tlv_data;
  1123	
  1124			info0 = __le32_to_cpu(he_sig_b2_ofdma->info0);
  1125	
  1126			ppdu_info->mcs =
  1127				FIELD_GET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_MCS,
  1128					  info0);
  1129			ppdu_info->nss =
  1130				FIELD_GET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS,
  1131					  info0) + 1;
  1132			ppdu_info->beamformed =
  1133				info0 &
  1134				HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF;
  1135			ppdu_info->ldpc =
  1136				(info0 &
  1137				 HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING) ==
  1138					HAL_RX_SU_MU_CODING_LDPC;
  1139			ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_MU_OFDMA;
  1140			break;
  1141		}
  1142		case HAL_PHYRX_RSSI_LEGACY: {
  1143			struct hal_rx_phyrx_rssi_legacy_info *rssi =
  1144				(struct hal_rx_phyrx_rssi_legacy_info *)tlv_data;
  1145	
  1146			ppdu_info->rssi_comb =
  1147				FIELD_GET(HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB,
  1148					  __le32_to_cpu(rssi->info0));
  1149			break;
  1150		}
  1151		case HAL_RX_MPDU_START: {
  1152			struct hal_rx_mpdu_info *mpdu_info =
  1153				(struct hal_rx_mpdu_info *)tlv_data;
  1154			u16 peer_id;
  1155	
> 1156			peer_id = FIELD_GET(HAL_RX_MPDU_INFO_INFO0_PEERID,
  1157					    __le32_to_cpu(mpdu_info->info0));
  1158			if (peer_id)
  1159				ppdu_info->peer_id = peer_id;
  1160			break;
  1161		}
  1162		case HAL_DUMMY:
  1163			return HAL_RX_MON_STATUS_BUF_DONE;
  1164		case HAL_RX_PPDU_END_STATUS_DONE:
  1165		case 0:
  1166			return HAL_RX_MON_STATUS_PPDU_DONE;
  1167		default:
  1168			break;
  1169		}
  1170	
  1171		return HAL_RX_MON_STATUS_PPDU_NOT_DONE;
  1172	}
  1173	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
