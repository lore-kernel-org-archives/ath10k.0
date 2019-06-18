Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd861-0005D1-Cn
 for ath10k@lists.infradead.org; Tue, 18 Jun 2019 06:59:59 +0000
Subject: Re: [ath6kl:pending-ath11k 198/205]
 drivers/net/wireless/ath/ath11k/mac.c:1274 ath11k_peer_assoc_h_he() error:
 memcpy() 'he_cap->he_cap_elem.mac_cap_info' too small (6 vs 8)
References: <20190618065329.GY1893@kadam>
From: John Crispin <john@phrozen.org>
Message-ID: <be8949ff-7ac2-3570-05ec-342036a6f52e@phrozen.org>
Date: Tue, 18 Jun 2019 08:59:55 +0200
MIME-Version: 1.0
In-Reply-To: <20190618065329.GY1893@kadam>
Content-Language: en-US
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
To: kbuild test robot <lkp@intel.com>, kbuild@01.org
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, kbuild-all@01.org, Dan Carpenter <dan.carpenter@oracle.com>


On 18/06/2019 08:53, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-ath11k
> head:   0f82fec5679664bb91d6c167fd1a146f113e4197
> commit: cbdb3159fdf450b7b3999a06600aa0e1fb78383f [198/205] ath11k: set additional values inside wmi_peer_assoc_complete_cmd
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:1274 ath11k_peer_assoc_h_he() error: memcpy() 'he_cap->he_cap_elem.mac_cap_info' too small (6 vs 8)
>
> Old smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:1276 ath11k_peer_assoc_h_he() error: memcpy() 'he_cap->he_cap_elem.phy_cap_info' too small (11 vs 12)
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=cbdb3159fdf450b7b3999a06600aa0e1fb78383f
> git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
> git remote update ath6kl
> git checkout cbdb3159fdf450b7b3999a06600aa0e1fb78383f
> vim +1274 drivers/net/wireless/ath/ath11k/mac.c
>
> 258bbf52 Kalle Valo   2019-02-05  1260
> 258bbf52 Kalle Valo   2019-02-05  1261  static void ath11k_peer_assoc_h_he(struct ath11k *ar,
> 258bbf52 Kalle Valo   2019-02-05  1262  				   struct ieee80211_vif *vif,
> 258bbf52 Kalle Valo   2019-02-05  1263  				   struct ieee80211_sta *sta,
> 258bbf52 Kalle Valo   2019-02-05  1264  				   struct peer_assoc_params *arg)
> 258bbf52 Kalle Valo   2019-02-05  1265  {
> 17aca2d9 John Crispin 2019-06-03  1266  	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
> 3db59a23 Kalle Valo   2019-06-12  1267  	u16 v;
> 17aca2d9 John Crispin 2019-06-03  1268
> 17aca2d9 John Crispin 2019-06-03  1269  	if (!he_cap->has_he)
> 17aca2d9 John Crispin 2019-06-03  1270  		return;
> 17aca2d9 John Crispin 2019-06-03  1271
> 17aca2d9 John Crispin 2019-06-03  1272  	arg->he_flag = true;
> 17aca2d9 John Crispin 2019-06-03  1273
> 17aca2d9 John Crispin 2019-06-03 @1274  	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
> 17aca2d9 John Crispin 2019-06-03  1275  	       sizeof(arg->peer_he_cap_macinfo));
>
> Smatch thinks these are different sizes...  I don't have a copy of
> struct peer_assoc_params so I can't check.

Hi,

its he_cap->he_cap_elem.mac_cap_info[6] and arg->peer_he_cap_macinfo[2] and we only copy the first 2 elements as the FW only cares for the first 2 bytes.

	John




>
> 17aca2d9 John Crispin 2019-06-03  1276  	memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
> 17aca2d9 John Crispin 2019-06-03  1277  	       sizeof(arg->peer_he_cap_phyinfo));
> 17aca2d9 John Crispin 2019-06-03  1278  	memcpy(&arg->peer_he_ops, &vif->bss_conf.he_operation,
> 17aca2d9 John Crispin 2019-06-03  1279  	       sizeof(arg->peer_he_ops));
> cbdb3159 John Crispin 2019-06-17  1280  	arg->peer_he_cap_macinfo_internal = 0x0;
> 17aca2d9 John Crispin 2019-06-03  1281
> 17aca2d9 John Crispin 2019-06-03  1282  	if (he_cap->he_cap_elem.phy_cap_info[6] &
> 17aca2d9 John Crispin 2019-06-03  1283  	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
> 17aca2d9 John Crispin 2019-06-03  1284  		int bit = 7;
> 17aca2d9 John Crispin 2019-06-03  1285  		int nss, ru;
> 17aca2d9 John Crispin 2019-06-03  1286
> 17aca2d9 John Crispin 2019-06-03  1287  		arg->peer_ppet.numss_m1 = he_cap->ppe_thres[0] &
> 17aca2d9 John Crispin 2019-06-03  1288  					  IEEE80211_PPE_THRES_NSS_MASK;
> 17aca2d9 John Crispin 2019-06-03  1289  		arg->peer_ppet.ru_bit_mask =
> 17aca2d9 John Crispin 2019-06-03  1290  			(he_cap->ppe_thres[0] &
> 17aca2d9 John Crispin 2019-06-03  1291  			 IEEE80211_PPE_THRES_RU_INDEX_BITMASK_MASK) >>
> 17aca2d9 John Crispin 2019-06-03  1292  			IEEE80211_PPE_THRES_RU_INDEX_BITMASK_POS;
> 17aca2d9 John Crispin 2019-06-03  1293
> 17aca2d9 John Crispin 2019-06-03  1294  		for (nss = 0; nss <= arg->peer_ppet.numss_m1; nss++) {
> 17aca2d9 John Crispin 2019-06-03  1295  			for (ru = 0; ru < 4; ru++) {
> 17aca2d9 John Crispin 2019-06-03  1296  				u32 val = 0;
> 17aca2d9 John Crispin 2019-06-03  1297  				int i;
> 17aca2d9 John Crispin 2019-06-03  1298
> 17aca2d9 John Crispin 2019-06-03  1299  				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
> 17aca2d9 John Crispin 2019-06-03  1300  					continue;
> 17aca2d9 John Crispin 2019-06-03  1301  				for (i = 0; i < 6; i++) {
> 17aca2d9 John Crispin 2019-06-03  1302  					val >>= 1;
> 17aca2d9 John Crispin 2019-06-03  1303  					val |= ((he_cap->ppe_thres[bit / 8] >>
> 17aca2d9 John Crispin 2019-06-03  1304  						 (bit % 8)) & 0x1) << 5;
> 17aca2d9 John Crispin 2019-06-03  1305  					bit++;
> 17aca2d9 John Crispin 2019-06-03  1306  				}
> 17aca2d9 John Crispin 2019-06-03  1307  				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=
> 17aca2d9 John Crispin 2019-06-03  1308  								val << (ru * 6);
> 17aca2d9 John Crispin 2019-06-03  1309  			}
> 17aca2d9 John Crispin 2019-06-03  1310  		}
> 17aca2d9 John Crispin 2019-06-03  1311  	}
> 17aca2d9 John Crispin 2019-06-03  1312
> 17aca2d9 John Crispin 2019-06-03  1313  	switch (sta->bandwidth) {
> 17aca2d9 John Crispin 2019-06-03  1314  	case IEEE80211_STA_RX_BW_160:
> 17aca2d9 John Crispin 2019-06-03  1315  		if (he_cap->he_cap_elem.phy_cap_info[0] &
> 17aca2d9 John Crispin 2019-06-03  1316  		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
> 3db59a23 Kalle Valo   2019-06-12  1317  			v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80p80);
> 3db59a23 Kalle Valo   2019-06-12  1318  			arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] = v;
> 3db59a23 Kalle Valo   2019-06-12  1319
> 3db59a23 Kalle Valo   2019-06-12  1320  			v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80p80);
> 3db59a23 Kalle Valo   2019-06-12  1321  			arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] = v;
> 3db59a23 Kalle Valo   2019-06-12  1322
> 17aca2d9 John Crispin 2019-06-03  1323  			arg->peer_he_mcs_count++;
> 17aca2d9 John Crispin 2019-06-03  1324  		}
> 3db59a23 Kalle Valo   2019-06-12  1325
> 3db59a23 Kalle Valo   2019-06-12  1326  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
> 3db59a23 Kalle Valo   2019-06-12  1327  		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
> 3db59a23 Kalle Valo   2019-06-12  1328
> 3db59a23 Kalle Valo   2019-06-12  1329  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_160);
> 3db59a23 Kalle Valo   2019-06-12  1330  		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
> 3db59a23 Kalle Valo   2019-06-12  1331
> 17aca2d9 John Crispin 2019-06-03  1332  		arg->peer_he_mcs_count++;
> 17aca2d9 John Crispin 2019-06-03  1333  		/* drop through */
> 17aca2d9 John Crispin 2019-06-03  1334
> 17aca2d9 John Crispin 2019-06-03  1335  	default:
> 3db59a23 Kalle Valo   2019-06-12  1336  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
> 3db59a23 Kalle Valo   2019-06-12  1337  		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
> 3db59a23 Kalle Valo   2019-06-12  1338  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
> 3db59a23 Kalle Valo   2019-06-12  1339  		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
> 17aca2d9 John Crispin 2019-06-03  1340  		arg->peer_he_mcs_count++;
> 17aca2d9 John Crispin 2019-06-03  1341  		break;
> 17aca2d9 John Crispin 2019-06-03  1342  	}
> 258bbf52 Kalle Valo   2019-02-05  1343  }
> 258bbf52 Kalle Valo   2019-02-05  1344
>
> :::::: The code at line 1274 was first introduced by commit
> :::::: 17aca2d9a969788a7f1e3e0c72b5485bf6a432a4 ath11k: add HE support
>
> :::::: TO: John Crispin <john@phrozen.org>
> :::::: CC: Kalle Valo <kvalo@codeaurora.org>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
