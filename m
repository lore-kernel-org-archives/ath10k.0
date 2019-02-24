Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxjSm-0001xx-Hi
 for ath10k@lists.infradead.org; Sun, 24 Feb 2019 02:24:23 +0000
Date: Sun, 24 Feb 2019 10:23:25 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:ath10k-pending-sdio-usb 16/16]
 drivers/net/wireless/ath/ath10k/mac.c:5223:26: warning: cast from pointer to
 integer of different size
Message-ID: <201902241023.LhrseA35%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
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
Cc: Kalle Valo <kvalo@codeaurora.org>, kbuild-all@01.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath10k-pending-sdio-usb
head:   3ea6ce40aecf119c80d392db5ca8dbf87010ff52
commit: 3ea6ce40aecf119c80d392db5ca8dbf87010ff52 [16/16] HACK: ath10k: high latency fixes for beacon buffer
config: i386-randconfig-x0-02240950 (attached as .config)
compiler: gcc-5 (Debian 5.5.0-3) 5.4.1 20171010
reproduce:
        git checkout 3ea6ce40aecf119c80d392db5ca8dbf87010ff52
        # save the attached .config to linux build tree
        make ARCH=i386 

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_add_interface':
>> drivers/net/wireless/ath/ath10k/mac.c:5223:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
                             ^

vim +5223 drivers/net/wireless/ath/ath10k/mac.c

  5086	
  5087	/*
  5088	 * TODO:
  5089	 * Figure out how to handle WMI_VDEV_SUBTYPE_P2P_DEVICE,
  5090	 * because we will send mgmt frames without CCK. This requirement
  5091	 * for P2P_FIND/GO_NEG should be handled by checking CCK flag
  5092	 * in the TX packet.
  5093	 */
  5094	static int ath10k_add_interface(struct ieee80211_hw *hw,
  5095					struct ieee80211_vif *vif)
  5096	{
  5097		struct ath10k *ar = hw->priv;
  5098		struct ath10k_vif *arvif = (void *)vif->drv_priv;
  5099		struct ath10k_peer *peer;
  5100		enum wmi_sta_powersave_param param;
  5101		int ret = 0;
  5102		u32 value;
  5103		int bit;
  5104		int i;
  5105		u32 vdev_param;
  5106	
  5107		vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
  5108	
  5109		mutex_lock(&ar->conf_mutex);
  5110	
  5111		memset(arvif, 0, sizeof(*arvif));
  5112		ath10k_mac_txq_init(vif->txq);
  5113	
  5114		arvif->ar = ar;
  5115		arvif->vif = vif;
  5116	
  5117		INIT_LIST_HEAD(&arvif->list);
  5118		INIT_WORK(&arvif->ap_csa_work, ath10k_mac_vif_ap_csa_work);
  5119		INIT_DELAYED_WORK(&arvif->connection_loss_work,
  5120				  ath10k_mac_vif_sta_connection_loss_work);
  5121	
  5122		for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
  5123			arvif->bitrate_mask.control[i].legacy = 0xffffffff;
  5124			memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
  5125			       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
  5126			memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
  5127			       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
  5128		}
  5129	
  5130		if (ar->num_peers >= ar->max_num_peers) {
  5131			ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
  5132			ret = -ENOBUFS;
  5133			goto err;
  5134		}
  5135	
  5136		if (ar->free_vdev_map == 0) {
  5137			ath10k_warn(ar, "Free vdev map is empty, no more interfaces allowed.\n");
  5138			ret = -EBUSY;
  5139			goto err;
  5140		}
  5141		bit = __ffs64(ar->free_vdev_map);
  5142	
  5143		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac create vdev %i map %llx\n",
  5144			   bit, ar->free_vdev_map);
  5145	
  5146		arvif->vdev_id = bit;
  5147		arvif->vdev_subtype =
  5148			ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_NONE);
  5149	
  5150		switch (vif->type) {
  5151		case NL80211_IFTYPE_P2P_DEVICE:
  5152			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  5153			arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5154						(ar, WMI_VDEV_SUBTYPE_P2P_DEVICE);
  5155			break;
  5156		case NL80211_IFTYPE_UNSPECIFIED:
  5157		case NL80211_IFTYPE_STATION:
  5158			arvif->vdev_type = WMI_VDEV_TYPE_STA;
  5159			if (vif->p2p)
  5160				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5161						(ar, WMI_VDEV_SUBTYPE_P2P_CLIENT);
  5162			break;
  5163		case NL80211_IFTYPE_ADHOC:
  5164			arvif->vdev_type = WMI_VDEV_TYPE_IBSS;
  5165			break;
  5166		case NL80211_IFTYPE_MESH_POINT:
  5167			if (test_bit(WMI_SERVICE_MESH_11S, ar->wmi.svc_map)) {
  5168				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5169							(ar, WMI_VDEV_SUBTYPE_MESH_11S);
  5170			} else if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5171				ret = -EINVAL;
  5172				ath10k_warn(ar, "must load driver with rawmode=1 to add mesh interfaces\n");
  5173				goto err;
  5174			}
  5175			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5176			break;
  5177		case NL80211_IFTYPE_AP:
  5178			arvif->vdev_type = WMI_VDEV_TYPE_AP;
  5179	
  5180			if (vif->p2p)
  5181				arvif->vdev_subtype = ath10k_wmi_get_vdev_subtype
  5182							(ar, WMI_VDEV_SUBTYPE_P2P_GO);
  5183			break;
  5184		case NL80211_IFTYPE_MONITOR:
  5185			arvif->vdev_type = WMI_VDEV_TYPE_MONITOR;
  5186			break;
  5187		default:
  5188			WARN_ON(1);
  5189			break;
  5190		}
  5191	
  5192		/* Using vdev_id as queue number will make it very easy to do per-vif
  5193		 * tx queue locking. This shouldn't wrap due to interface combinations
  5194		 * but do a modulo for correctness sake and prevent using offchannel tx
  5195		 * queues for regular vif tx.
  5196		 */
  5197		vif->cab_queue = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5198		for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
  5199			vif->hw_queue[i] = arvif->vdev_id % (IEEE80211_MAX_QUEUES - 1);
  5200	
  5201		/* Some firmware revisions don't wait for beacon tx completion before
  5202		 * sending another SWBA event. This could lead to hardware using old
  5203		 * (freed) beacon data in some cases, e.g. tx credit starvation
  5204		 * combined with missed TBTT. This is very very rare.
  5205		 *
  5206		 * On non-IOMMU-enabled hosts this could be a possible security issue
  5207		 * because hw could beacon some random data on the air.  On
  5208		 * IOMMU-enabled hosts DMAR faults would occur in most cases and target
  5209		 * device would crash.
  5210		 *
  5211		 * Since there are no beacon tx completions (implicit nor explicit)
  5212		 * propagated to host the only workaround for this is to allocate a
  5213		 * DMA-coherent buffer for a lifetime of a vif and use it for all
  5214		 * beacon tx commands. Worst case for this approach is some beacons may
  5215		 * become corrupted, e.g. have garbled IEs or out-of-date TIM bitmap.
  5216		 */
  5217		if (vif->type == NL80211_IFTYPE_ADHOC ||
  5218		    vif->type == NL80211_IFTYPE_MESH_POINT ||
  5219		    vif->type == NL80211_IFTYPE_AP) {
  5220			if (ar->dev_type == ATH10K_DEV_TYPE_HL) {
  5221				arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
  5222							    GFP_KERNEL);
> 5223				arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
  5224			} else {
  5225				arvif->beacon_buf =
  5226					dma_alloc_coherent(ar->dev,
  5227							   IEEE80211_MAX_FRAME_LEN,
  5228							   &arvif->beacon_paddr,
  5229							   GFP_ATOMIC);
  5230			}
  5231			if (!arvif->beacon_buf) {
  5232				ret = -ENOMEM;
  5233				ath10k_warn(ar, "failed to allocate beacon buffer: %d\n",
  5234					    ret);
  5235				goto err;
  5236			}
  5237		}
  5238		if (test_bit(ATH10K_FLAG_HW_CRYPTO_DISABLED, &ar->dev_flags))
  5239			arvif->nohwcrypt = true;
  5240	
  5241		if (arvif->nohwcrypt &&
  5242		    !test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
  5243			ath10k_warn(ar, "cryptmode module param needed for sw crypto\n");
  5244			goto err;
  5245		}
  5246	
  5247		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev create %d (add interface) type %d subtype %d bcnmode %s\n",
  5248			   arvif->vdev_id, arvif->vdev_type, arvif->vdev_subtype,
  5249			   arvif->beacon_buf ? "single-buf" : "per-skb");
  5250	
  5251		ret = ath10k_wmi_vdev_create(ar, arvif->vdev_id, arvif->vdev_type,
  5252					     arvif->vdev_subtype, vif->addr);
  5253		if (ret) {
  5254			ath10k_warn(ar, "failed to create WMI vdev %i: %d\n",
  5255				    arvif->vdev_id, ret);
  5256			goto err;
  5257		}
  5258	
  5259		if (test_bit(WMI_SERVICE_VDEV_DISABLE_4_ADDR_SRC_LRN_SUPPORT,
  5260			     ar->wmi.svc_map)) {
  5261			vdev_param = ar->wmi.vdev_param->disable_4addr_src_lrn;
  5262			ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5263							WMI_VDEV_DISABLE_4_ADDR_SRC_LRN);
  5264			if (ret && ret != -EOPNOTSUPP) {
  5265				ath10k_warn(ar, "failed to disable 4addr src lrn vdev %i: %d\n",
  5266					    arvif->vdev_id, ret);
  5267			}
  5268		}
  5269	
  5270		ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
  5271		spin_lock_bh(&ar->data_lock);
  5272		list_add(&arvif->list, &ar->arvifs);
  5273		spin_unlock_bh(&ar->data_lock);
  5274	
  5275		/* It makes no sense to have firmware do keepalives. mac80211 already
  5276		 * takes care of this with idle connection polling.
  5277		 */
  5278		ret = ath10k_mac_vif_disable_keepalive(arvif);
  5279		if (ret) {
  5280			ath10k_warn(ar, "failed to disable keepalive on vdev %i: %d\n",
  5281				    arvif->vdev_id, ret);
  5282			goto err_vdev_delete;
  5283		}
  5284	
  5285		arvif->def_wep_key_idx = -1;
  5286	
  5287		vdev_param = ar->wmi.vdev_param->tx_encap_type;
  5288		ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5289						ATH10K_HW_TXRX_NATIVE_WIFI);
  5290		/* 10.X firmware does not support this VDEV parameter. Do not warn */
  5291		if (ret && ret != -EOPNOTSUPP) {
  5292			ath10k_warn(ar, "failed to set vdev %i TX encapsulation: %d\n",
  5293				    arvif->vdev_id, ret);
  5294			goto err_vdev_delete;
  5295		}
  5296	
  5297		/* Configuring number of spatial stream for monitor interface is causing
  5298		 * target assert in qca9888 and qca6174.
  5299		 */
  5300		if (ar->cfg_tx_chainmask && (vif->type != NL80211_IFTYPE_MONITOR)) {
  5301			u16 nss = get_nss_from_chainmask(ar->cfg_tx_chainmask);
  5302	
  5303			vdev_param = ar->wmi.vdev_param->nss;
  5304			ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5305							nss);
  5306			if (ret) {
  5307				ath10k_warn(ar, "failed to set vdev %i chainmask 0x%x, nss %i: %d\n",
  5308					    arvif->vdev_id, ar->cfg_tx_chainmask, nss,
  5309					    ret);
  5310				goto err_vdev_delete;
  5311			}
  5312		}
  5313	
  5314		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5315		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
  5316			ret = ath10k_peer_create(ar, vif, NULL, arvif->vdev_id,
  5317						 vif->addr, WMI_PEER_TYPE_DEFAULT);
  5318			if (ret) {
  5319				ath10k_warn(ar, "failed to create vdev %i peer for AP/IBSS: %d\n",
  5320					    arvif->vdev_id, ret);
  5321				goto err_vdev_delete;
  5322			}
  5323	
  5324			spin_lock_bh(&ar->data_lock);
  5325	
  5326			peer = ath10k_peer_find(ar, arvif->vdev_id, vif->addr);
  5327			if (!peer) {
  5328				ath10k_warn(ar, "failed to lookup peer %pM on vdev %i\n",
  5329					    vif->addr, arvif->vdev_id);
  5330				spin_unlock_bh(&ar->data_lock);
  5331				ret = -ENOENT;
  5332				goto err_peer_delete;
  5333			}
  5334	
  5335			arvif->peer_id = find_first_bit(peer->peer_ids,
  5336							ATH10K_MAX_NUM_PEER_IDS);
  5337	
  5338			spin_unlock_bh(&ar->data_lock);
  5339		} else {
  5340			arvif->peer_id = HTT_INVALID_PEERID;
  5341		}
  5342	
  5343		if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
  5344			ret = ath10k_mac_set_kickout(arvif);
  5345			if (ret) {
  5346				ath10k_warn(ar, "failed to set vdev %i kickout parameters: %d\n",
  5347					    arvif->vdev_id, ret);
  5348				goto err_peer_delete;
  5349			}
  5350		}
  5351	
  5352		if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
  5353			param = WMI_STA_PS_PARAM_RX_WAKE_POLICY;
  5354			value = WMI_STA_PS_RX_WAKE_POLICY_WAKE;
  5355			ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
  5356							  param, value);
  5357			if (ret) {
  5358				ath10k_warn(ar, "failed to set vdev %i RX wake policy: %d\n",
  5359					    arvif->vdev_id, ret);
  5360				goto err_peer_delete;
  5361			}
  5362	
  5363			ret = ath10k_mac_vif_recalc_ps_wake_threshold(arvif);
  5364			if (ret) {
  5365				ath10k_warn(ar, "failed to recalc ps wake threshold on vdev %i: %d\n",
  5366					    arvif->vdev_id, ret);
  5367				goto err_peer_delete;
  5368			}
  5369	
  5370			ret = ath10k_mac_vif_recalc_ps_poll_count(arvif);
  5371			if (ret) {
  5372				ath10k_warn(ar, "failed to recalc ps poll count on vdev %i: %d\n",
  5373					    arvif->vdev_id, ret);
  5374				goto err_peer_delete;
  5375			}
  5376		}
  5377	
  5378		ret = ath10k_mac_set_txbf_conf(arvif);
  5379		if (ret) {
  5380			ath10k_warn(ar, "failed to set txbf for vdev %d: %d\n",
  5381				    arvif->vdev_id, ret);
  5382			goto err_peer_delete;
  5383		}
  5384	
  5385		ret = ath10k_mac_set_rts(arvif, ar->hw->wiphy->rts_threshold);
  5386		if (ret) {
  5387			ath10k_warn(ar, "failed to set rts threshold for vdev %d: %d\n",
  5388				    arvif->vdev_id, ret);
  5389			goto err_peer_delete;
  5390		}
  5391	
  5392		arvif->txpower = vif->bss_conf.txpower;
  5393		ret = ath10k_mac_txpower_recalc(ar);
  5394		if (ret) {
  5395			ath10k_warn(ar, "failed to recalc tx power: %d\n", ret);
  5396			goto err_peer_delete;
  5397		}
  5398	
  5399		if (test_bit(WMI_SERVICE_RTT_RESPONDER_ROLE, ar->wmi.svc_map)) {
  5400			vdev_param = ar->wmi.vdev_param->rtt_responder_role;
  5401			ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5402							arvif->ftm_responder);
  5403	
  5404			/* It is harmless to not set FTM role. Do not warn */
  5405			if (ret && ret != -EOPNOTSUPP)
  5406				ath10k_warn(ar, "failed to set vdev %i FTM Responder: %d\n",
  5407					    arvif->vdev_id, ret);
  5408		}
  5409	
  5410		if (vif->type == NL80211_IFTYPE_MONITOR) {
  5411			ar->monitor_arvif = arvif;
  5412			ret = ath10k_monitor_recalc(ar);
  5413			if (ret) {
  5414				ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
  5415				goto err_peer_delete;
  5416			}
  5417		}
  5418	
  5419		spin_lock_bh(&ar->htt.tx_lock);
  5420		if (!ar->tx_paused)
  5421			ieee80211_wake_queue(ar->hw, arvif->vdev_id);
  5422		spin_unlock_bh(&ar->htt.tx_lock);
  5423	
  5424		mutex_unlock(&ar->conf_mutex);
  5425		return 0;
  5426	
  5427	err_peer_delete:
  5428		if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
  5429		    arvif->vdev_type == WMI_VDEV_TYPE_IBSS)
  5430			ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
  5431	
  5432	err_vdev_delete:
  5433		ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
  5434		ar->free_vdev_map |= 1LL << arvif->vdev_id;
  5435		spin_lock_bh(&ar->data_lock);
  5436		list_del(&arvif->list);
  5437		spin_unlock_bh(&ar->data_lock);
  5438	
  5439	err:
  5440		if (arvif->beacon_buf) {
  5441			if (ar->dev_type == ATH10K_DEV_TYPE_HL)
  5442				kfree(arvif->beacon_buf);
  5443			else
  5444				dma_free_coherent(ar->dev, IEEE80211_MAX_FRAME_LEN,
  5445						  arvif->beacon_buf,
  5446						  arvif->beacon_paddr);
  5447			arvif->beacon_buf = NULL;
  5448		}
  5449	
  5450		mutex_unlock(&ar->conf_mutex);
  5451	
  5452		return ret;
  5453	}
  5454	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--azLHFNyN32YCQGCU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--azLHFNyN32YCQGCU--
