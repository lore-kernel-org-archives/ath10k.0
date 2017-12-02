Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLCH4-0006L1-PP
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 18:12:29 +0000
Date: Sun, 3 Dec 2017 02:11:25 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [ath6kl:ath10k-pending-sdio-usb 19/23]
 drivers/net/wireless/ath/ath10k/mac.c:5062:26: warning: cast from pointer to
 integer of different size
Message-ID: <201712030224.70yKPAxp%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Alagu Sankar <alagusankar@silex-india.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, kbuild-all@01.org, ath10k@lists.infradead.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath10k-pending-sdio-usb
head:   c595220acc6c02730d3316eecbbea2543303bb4f
commit: 35461ca94f6aa2f7a6d71f8c397649237385f63a [19/23] ath10k_sdio: high latency fixes for beacon buffer
config: i386-randconfig-x007-201749 (attached as .config)
compiler: gcc-7 (Debian 7.2.0-12) 7.2.1 20171025
reproduce:
        git checkout 35461ca94f6aa2f7a6d71f8c397649237385f63a
        # save the attached .config to linux build tree
        make ARCH=i386 

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_add_interface':
>> drivers/net/wireless/ath/ath10k/mac.c:5062:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
                             ^

vim +5062 drivers/net/wireless/ath/ath10k/mac.c

  4925	
  4926	/*
  4927	 * TODO:
  4928	 * Figure out how to handle WMI_VDEV_SUBTYPE_P2P_DEVICE,
  4929	 * because we will send mgmt frames without CCK. This requirement
  4930	 * for P2P_FIND/GO_NEG should be handled by checking CCK flag
  4931	 * in the TX packet.
  4932	 */
  4933	static int ath10k_add_interface(struct ieee80211_hw *hw,
  4934					struct ieee80211_vif *vif)
  4935	{
  4936		struct ath10k *ar = hw->priv;
  4937		struct ath10k_vif *arvif = (void *)vif->drv_priv;
  4938		struct ath10k_peer *peer;
  4939		enum wmi_sta_powersave_param param;
  4940		int ret = 0;
  4941		u32 value;
  4942		int bit;
  4943		int i;
  4944		u32 vdev_param;
  4945	
  4946		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
  4947	
  4948		mutex_lock(&ar->conf_mutex);
  4949	
  4950		memset(arvif, 0, sizeof(*arvif));
  4951		ath10k_mac_txq_init(vif->txq);
  4952	
  4953		arvif->ar = ar;
  4954		arvif->vif = vif;
  4955	
  4956		INIT_LIST_HEAD(&arvif->list);
  4957		INIT_WORK(&arvif->ap_csa_work, ath10k_mac_vif_ap_csa_work);
  4958		INIT_DELAYED_WORK(&arvif->connection_loss_work,
  4959				  ath10k_mac_vif_sta_connection_loss_work);
  4960	
  4961		for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
  4962			arvif->bitrate_mask.control[i].legacy = 0xffffffff;
  4963			memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
  4964			       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
  4965			memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
  4966			       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
  4967		}
  4968	
  4969		if (ar->num_peers >= ar->max_num_peers) {
  4970			ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
  4971			ret = -ENOBUFS;
  4972			goto err;
  4973		}
  4974	
  4975		if (ar->free_vdev_map == 0) {
  4976			ath10k_warn(ar, "Free vdev map is empty, no more interfaces allowed.\n");
  4977			ret = -EBUSY;
  4978			goto err;
  4979		}
  4980		bit = __ffs64(ar->free_vdev_map);
  4981	
  4982		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac create vdev %i map %llx\n",
  4983			   bit, ar->free_vdev_map);
  4984	
  4985		arvif->vdev_id = bit;
  4986		arvif->vdev_subtype =
  4987			ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_NONE);
  4988	
  4989		switch (vif->type) {
  4990		case NL80211_IFTYPE_P2P_DEVICE:
  4991			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  4992			arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  4993						(ar, WMI_VDEV_SUBTYPE_P2P_DEVICE);
  4994			break;
  4995		case NL80211_IFTYPE_UNSPECIFIED:
  4996		case NL80211_IFTYPE_STATION:
  4997			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  4998			if (vif->p2p)
  4999				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5000						(ar, WMI_VDEV_SUBTYPE_P2P_CLIENT);
  5001			break;
  5002		case NL80211_IFTYPE_ADHOC:
  5003			arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
  5004			break;
  5005		case NL80211_IFTYPE_MESH_POINT:
  5006			if (test_bit(WMI_SERVICE_MESH_11S, ar->wmi.svc_map)) {
  5007				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5008							(ar, WMI_VDEV_SUBTYPE_MESH_11S);
  5009			} else if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5010				ret = -EINVAL;
  5011				ath10k_warn(ar, "must load driver with rawmode=1 to add mesh interfaces\n");
  5012				goto err;
  5013			}
  5014			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5015			break;
  5016		case NL80211_IFTYPE_AP:
  5017			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5018	
  5019			if (vif->p2p)
  5020				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5021							(ar, WMI_VDEV_SUBTYPE_P2P_GO);
  5022			break;
  5023		case NL80211_IFTYPE_MONITOR:
  5024			arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
  5025			break;
  5026		default:
  5027			WARN_ON(1);
  5028			break;
  5029		}
  5030	
  5031		/* Using vdev_id as queue number will make it very easy to do per-vif
  5032		 * tx queue locking. This shouldn't wrap due to interface combinations
  5033		 * but do a modulo for correctness sake and prevent using offchannel tx
  5034		 * queues for regular vif tx.
  5035		 */
  5036		vif->cab_queue = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5037		for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
  5038			vif->hw_queue[i] = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5039	
  5040		/* Some firmware revisions don't wait for beacon tx completion before
  5041		 * sending another SWBA event. This could lead to hardware using old
  5042		 * (freed) beacon data in some cases, e.g. tx credit starvation
  5043		 * combined with missed TBTT. This is very very rare.
  5044		 *
  5045		 * On non-IOMMU-enabled hosts this could be a possible security issue
  5046		 * because hw could beacon some random data on the air.  On
  5047		 * IOMMU-enabled hosts DMAR faults would occur in most cases and target
  5048		 * device would crash.
  5049		 *
  5050		 * Since there are no beacon tx completions (implicit nor explicit)
  5051		 * propagated to host the only workaround for this is to allocate a
  5052		 * DMA-coherent buffer for a lifetime of a vif and use it for all
  5053		 * beacon tx commands. Worst case for this approach is some beacons may
  5054		 * become corrupted, e.g. have garbled IEs or out-of-date TIM bitmap.
  5055		 */
  5056		if (vif->type == NL80211_IFTYPE_ADHOC ||
  5057		    vif->type == NL80211_IFTYPE_MESH_POINT ||
  5058		    vif->type == NL80211_IFTYPE_AP) {
  5059			if (ar->is_high_latency) {
  5060				arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
  5061							    GFP_KERNEL);
> 5062				arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
  5063			} else {
  5064				arvif->beacon_buf =
  5065					dma_zalloc_coherent(ar->dev,
  5066							    IEEE80211_MAX_FRAME_LEN,
  5067							    &arvif->beacon_paddr,
  5068							    GFP_ATOMIC);
  5069			}
  5070			if (!arvif->beacon_buf) {
  5071				ret = -ENOMEM;
  5072				ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
  5073					    ret);
  5074				goto err;
  5075			}
  5076		}
  5077		if (test_bit(ATH10K_FLAG_HW_CRYPTO_DISABLED, &ar->dev_flags))
  5078			arvif->nohwcrypt = true;
  5079	
  5080		if (arvif->nohwcrypt &&
  5081		    !test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5082			ath10k_warn(ar, "cryptmode module param needed for sw crypto\n");
  5083			goto err;
  5084		}
  5085	
  5086		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev create %d (add interface) type %d subtype %d bcnmode %s\n",
  5087			   arvif->vdev_id, arvif->vdev_type, arvif->vdev_subtype,
  5088			   arvif->beacon_buf ? "single-buf" : "per-skb");
  5089	
  5090		ret = ath10k_wmi_vdev_create(ar, arvif->vdev_id, arvif->vdev_type,
  5091					     arvif->vdev_subtype, vif->addr);
  5092		if (ret) {
  5093			ath10k_warn(ar, "failed to create WMI vdev %i: %d\n",
  5094				    arvif->vdev_id, ret);
  5095			goto err;
  5096		}
  5097	
  5098		ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
  5099		spin_lock_bh(&ar->data_lock);
  5100		list_add(&arvif->list, &ar->arvifs);
  5101		spin_unlock_bh(&ar->data_lock);
  5102	
  5103		/* It makes no sense to have firmware do keepalives. mac80211 already
  5104		 * takes care of this with idle connection polling.
  5105		 */
  5106		ret = ath10k_mac_vif_disable_keepalive(arvif);
  5107		if (ret) {
  5108			ath10k_warn(ar, "failed to disable keepalive on vdev %i: %d\n",
  5109				    arvif->vdev_id, ret);
  5110			goto err_vdev_delete;
  5111		}
  5112	
  5113		arvif->def_wep_key_idx = -1;
  5114	
  5115		vdev_param = ar->wmi.vdev_param->tx_encap_type;
  5116		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5117						ATH10K_HW_TXRX_NATIVE_WIFI);
  5118		/* 10.X firmware does not support this VDEV parameter. Do not warn */
  5119		if (ret && ret != -EOPNOTSUPP) {
  5120			ath10k_warn(ar, "failed to set vdev %i TX encapsulation: %d\n",
  5121				    arvif->vdev_id, ret);
  5122			goto err_vdev_delete;
  5123		}
  5124	
  5125		/* Configuring number of spatial stream for monitor interface is causing
  5126		 * target assert in qca9888 and qca6174.
  5127		 */
  5128		if (ar->cfg_tx_chainmask && (vif->type != NL80211_IFTYPE_MONITOR)) {
  5129			u16 nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
  5130	
  5131			vdev_param = ar->wmi.vdev_param->nss;
  5132			ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5133							nss);
  5134			if (ret) {
  5135				ath10k_warn(ar, "failed to set vdev %i chainmask 0x%x, nss %i: %d\n",
  5136					    arvif->vdev_id, ar->cfg_tx_chainmask, nss,
  5137					    ret);
  5138				goto err_vdev_delete;
  5139			}
  5140		}
  5141	
  5142		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5143		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
  5144			ret = ath10k_peer_create(ar, vif, NULL, arvif->vdev_id,
  5145						 vif->addr, WMI_PEER_TYPE_DEFAULT);
  5146			if (ret) {
  5147				ath10k_warn(ar, "failed to create vdev %i peer for AP/IBSS: %d\n",
  5148					    arvif->vdev_id, ret);
  5149				goto err_vdev_delete;
  5150			}
  5151	
  5152			spin_lock_bh(&ar->data_lock);
  5153	
  5154			peer = ath10k_peer_find(ar, arvif->vdev_id, vif->addr);
  5155			if (!peer) {
  5156				ath10k_warn(ar, "failed to lookup peer %pM on vdev %i\n",
  5157					    vif->addr, arvif->vdev_id);
  5158				spin_unlock_bh(&ar->data_lock);
  5159				ret = -ENOENT;
  5160				goto err_peer_delete;
  5161			}
  5162	
  5163			arvif->peer_id = find_first_bit(peer->peer_ids,
  5164							ATH10K_MAX_NUM_PEER_IDS);
  5165	
  5166			spin_unlock_bh(&ar->data_lock);
  5167		} else {
  5168			arvif->peer_id = HTT_INVALID_PEERID;
  5169		}
  5170	
  5171		if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
  5172			ret = ath10k_mac_set_kickout(arvif);
  5173			if (ret) {
  5174				ath10k_warn(ar, "failed to set vdev %i kickout parameters: %d\n",
  5175					    arvif->vdev_id, ret);
  5176				goto err_peer_delete;
  5177			}
  5178		}
  5179	
  5180		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
  5181			param = WMI_STA_PS_PARAM_RX_WAKE_POLICY;
  5182			value = WMI_STA_PS_RX_WAKE_POLICY_WAKE;
  5183			ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
  5184							  param, value);
  5185			if (ret) {
  5186				ath10k_warn(ar, "failed to set vdev %i RX wake policy: %d\n",
  5187					    arvif->vdev_id, ret);
  5188				goto err_peer_delete;
  5189			}
  5190	
  5191			ret = ath10k_mac_vif_recalc_ps_wake_threshold(arvif);
  5192			if (ret) {
  5193				ath10k_warn(ar, "failed to recalc ps wake threshold on vdev %i: %d\n",
  5194					    arvif->vdev_id, ret);
  5195				goto err_peer_delete;
  5196			}
  5197	
  5198			ret = ath10k_mac_vif_recalc_ps_poll_count(arvif);
  5199			if (ret) {
  5200				ath10k_warn(ar, "failed to recalc ps poll count on vdev %i: %d\n",
  5201					    arvif->vdev_id, ret);
  5202				goto err_peer_delete;
  5203			}
  5204		}
  5205	
  5206		ret = ath10k_mac_set_txbf_conf(arvif);
  5207		if (ret) {
  5208			ath10k_warn(ar, "failed to set txbf for vdev %d: %d\n",
  5209				    arvif->vdev_id, ret);
  5210			goto err_peer_delete;
  5211		}
  5212	
  5213		ret = ath10k_mac_set_rts(arvif, ar->hw->wiphy->rts_threshold);
  5214		if (ret) {
  5215			ath10k_warn(ar, "failed to set rts threshold for vdev %d: %d\n",
  5216				    arvif->vdev_id, ret);
  5217			goto err_peer_delete;
  5218		}
  5219	
  5220		arvif->txpower = vif->bss_conf.txpower;
  5221		ret = ath10k_mac_txpower_recalc(ar);
  5222		if (ret) {
  5223			ath10k_warn(ar, "failed to recalc tx power: %d\n", ret);
  5224			goto err_peer_delete;
  5225		}
  5226	
  5227		if (vif->type == NL80211_IFTYPE_MONITOR) {
  5228			ar->monitor_arvif = arvif;
  5229			ret = ath10k_monitor_recalc(ar);
  5230			if (ret) {
  5231				ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
  5232				goto err_peer_delete;
  5233			}
  5234		}
  5235	
  5236		spin_lock_bh(&ar->htt.tx_lock);
  5237		if (!ar->tx_paused)
  5238			ieee80211_wake_queue(ar->hw, arvif->vdev_id);
  5239		spin_unlock_bh(&ar->htt.tx_lock);
  5240	
  5241		mutex_unlock(&ar->conf_mutex);
  5242		return 0;
  5243	
  5244	err_peer_delete:
  5245		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5246		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS)
  5247			ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
  5248	
  5249	err_vdev_delete:
  5250		ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
  5251		ar->free_vdev_map |= 1LL << arvif->vdev_id;
  5252		spin_lock_bh(&ar->data_lock);
  5253		list_del(&arvif->list);
  5254		spin_unlock_bh(&ar->data_lock);
  5255	
  5256	err:
  5257		if (arvif->beacon_buf) {
  5258			if (ar->is_high_latency)
  5259				kfree(arvif->beacon_buf);
  5260			else
  5261				dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
  5262						  arvif->beacon_buf,
  5263						  arvif->beacon_paddr);
  5264			arvif->beacon_buf = NULL;
  5265		}
  5266	
  5267		mutex_unlock(&ar->conf_mutex);
  5268	
  5269		return ret;
  5270	}
  5271	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--SLDf9lqlvOQaIe6s
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--SLDf9lqlvOQaIe6s--
