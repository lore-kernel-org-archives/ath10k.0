Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRm94-0002Qd-Lu
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 19:02:03 +0000
Date: Tue, 18 Aug 2015 22:01:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: ath10k: fix peer limit enforcement
Message-ID: <20150818190131.GA24548@mwanda>
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

The patch e04cafbc38c7: "ath10k: fix peer limit enforcement" from Aug
5, 2015, leads to the following static checker warning:

	drivers/net/wireless/ath/ath10k/mac.c:4365 ath10k_add_interface()
	warn: inconsistent returns 'mutex:&ar->conf_mutex'.
	  Locked on:   line 4125
	  Unlocked on: line 4344
	               line 4365

drivers/net/wireless/ath/ath10k/mac.c
  4098          int i;
  4099          u32 vdev_param;
  4100  
  4101          vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
  4102  
  4103          mutex_lock(&ar->conf_mutex);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^
Lock.

  4104  
  4105          memset(arvif, 0, sizeof(*arvif));
  4106  
  4107          arvif->ar = ar;
  4108          arvif->vif = vif;
  4109  
  4110          INIT_LIST_HEAD(&arvif->list);
  4111          INIT_WORK(&arvif->ap_csa_work, ath10k_mac_vif_ap_csa_work);
  4112          INIT_DELAYED_WORK(&arvif->connection_loss_work,
  4113                            ath10k_mac_vif_sta_connection_loss_work);
  4114  
  4115          for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
  4116                  arvif->bitrate_mask.control[i].legacy = 0xffffffff;
  4117                  memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
  4118                         sizeof(arvif->bitrate_mask.control[i].ht_mcs));
  4119                  memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,
  4120                         sizeof(arvif->bitrate_mask.control[i].vht_mcs));
  4121          }
  4122  
  4123          if (ar->num_peers >= ar->max_num_peers) {
  4124                  ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
  4125                  return -ENOBUFS;

Can't return directly.  We're holding a lock.

  4126          }
  4127  
  4128          if (ar->free_vdev_map == 0) {
  4129                  ath10k_warn(ar, "Free vdev map is empty, no more interfaces allowed.\n");
  4130                  ret = -EBUSY;
  4131                  goto err;
  4132          }
  4133          bit = __ffs64(ar->free_vdev_map);

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
