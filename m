Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY6wh-00019T-JF
 for ath10k@lists.infradead.org; Tue, 04 Jun 2019 10:45:54 +0000
Date: Tue, 4 Jun 2019 18:45:27 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending 170/170]
 drivers/net/wireless/ath/ath11k/mac.c:1334:83: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <201906041825.blatvak2%lkp@intel.com>
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
To: John Crispin <john@phrozen.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   17aca2d9a969788a7f1e3e0c72b5485bf6a432a4
commit: 17aca2d9a969788a7f1e3e0c72b5485bf6a432a4 [170/170] ath11k: add HE support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 17aca2d9a969788a7f1e3e0c72b5485bf6a432a4
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/mac.c:1334:83: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
>> drivers/net/wireless/ath/ath11k/mac.c:1334:83: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1334:83: sparse:    got restricted __le16 const [usertype] rx_mcs_80p80
   drivers/net/wireless/ath/ath11k/mac.c:1336:83: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1336:83: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1336:83: sparse:    got restricted __le16 const [usertype] tx_mcs_80p80
   drivers/net/wireless/ath/ath11k/mac.c:1340:73: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1340:73: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1340:73: sparse:    got restricted __le16 const [usertype] rx_mcs_160
   drivers/net/wireless/ath/ath11k/mac.c:1342:73: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1342:73: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1342:73: sparse:    got restricted __le16 const [usertype] tx_mcs_160
   drivers/net/wireless/ath/ath11k/mac.c:1348:72: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1348:72: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1348:72: sparse:    got restricted __le16 const [usertype] rx_mcs_80
   drivers/net/wireless/ath/ath11k/mac.c:1350:72: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned int @@    got restricted __le16 constunsigned int @@
   drivers/net/wireless/ath/ath11k/mac.c:1350:72: sparse:    expected unsigned int
>> drivers/net/wireless/ath/ath11k/mac.c:1350:72: sparse:    got restricted __le16 const [usertype] tx_mcs_80

vim +1334 drivers/net/wireless/ath/ath11k/mac.c

  1279	
  1280	static void ath11k_peer_assoc_h_he(struct ath11k *ar,
  1281					   struct ieee80211_vif *vif,
  1282					   struct ieee80211_sta *sta,
  1283					   struct peer_assoc_params *arg)
  1284	{
  1285		const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
  1286	
  1287		if (!he_cap->has_he)
  1288			return;
  1289	
  1290		arg->he_flag = true;
  1291	
  1292		memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
  1293		       sizeof(arg->peer_he_cap_macinfo));
  1294		memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
  1295		       sizeof(arg->peer_he_cap_phyinfo));
  1296		memcpy(&arg->peer_he_ops, &vif->bss_conf.he_operation,
  1297		       sizeof(arg->peer_he_ops));
  1298	
  1299		if (he_cap->he_cap_elem.phy_cap_info[6] &
  1300		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
  1301			int bit = 7;
  1302			int nss, ru;
  1303	
  1304			arg->peer_ppet.numss_m1 = he_cap->ppe_thres[0] &
  1305						  IEEE80211_PPE_THRES_NSS_MASK;
  1306			arg->peer_ppet.ru_bit_mask =
  1307				(he_cap->ppe_thres[0] &
  1308				 IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK) >>
  1309				IEEE80211_PPE_THRES_RU_INDEX_BITMASK_POS;
  1310	
  1311			for (nss = 0; nss <= arg->peer_ppet.numss_m1; nss++) {
  1312				for (ru = 0; ru < 4; ru++) {
  1313					u32 val = 0;
  1314					int i;
  1315	
  1316					if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
  1317						continue;
  1318					for (i = 0; i < 6; i++) {
  1319						val >>= 1;
  1320						val |= ((he_cap->ppe_thres[bit / 8] >>
  1321							 (bit % 8)) & 0x1) << 5;
  1322						bit++;
  1323					}
  1324					arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
  1325									val << (ru * 6);
  1326				}
  1327			}
  1328		}
  1329	
  1330		switch (sta->bandwidth) {
  1331		case IEEE80211_STA_RX_BW_160:
  1332			if (he_cap->he_cap_elem.phy_cap_info[0] &
  1333			    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
> 1334				arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
  1335					he_cap->he_mcs_nss_supp.rx_mcs_80p80;
> 1336				arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =
  1337					he_cap->he_mcs_nss_supp.tx_mcs_80p80;
  1338				arg->peer_he_mcs_count++;
  1339			}
> 1340			arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
  1341				he_cap->he_mcs_nss_supp.rx_mcs_160;
> 1342			arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =
  1343				he_cap->he_mcs_nss_supp.tx_mcs_160;
  1344			arg->peer_he_mcs_count++;
  1345			/* drop through */
  1346	
  1347		default:
> 1348			arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
  1349				he_cap->he_mcs_nss_supp.rx_mcs_80;
> 1350			arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =
  1351				he_cap->he_mcs_nss_supp.tx_mcs_80;
  1352			arg->peer_he_mcs_count++;
  1353			break;
  1354		}
  1355	}
  1356	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
