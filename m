Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gACEH-0005AO-W8
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 11:00:40 +0000
Date: Wed, 10 Oct 2018 14:00:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath10k: add support for configuring management packet
 rate
Message-ID: <20181010110016.GA20491@mwanda>
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
To: srirrama@codeaurora.org
Cc: ath10k@lists.infradead.org

Hello Sriram R,

The patch f279294e9ee2: "ath10k: add support for configuring
management packet rate" from Sep 10, 2018, leads to the following
static checker warning:

	drivers/net/wireless/ath/ath10k/mac.c:5685 ath10k_bss_info_changed()
	warn: inconsistent indenting

drivers/net/wireless/ath/ath10k/mac.c
  5673                  if (ret)
  5674                          ath10k_warn(ar,
  5675                                      "failed to set bcast rate on vdev %i: %d\n",
  5676                                      arvif->vdev_id,  ret);
  5677          }
  5678  
  5679          if (changed & BSS_CHANGED_BASIC_RATES) {
                                                       ^
Start

  5680                  if (WARN_ON(ath10k_mac_vif_chan(vif, &def))) {
  5681                          mutex_unlock(&ar->conf_mutex);
  5682                          return;
  5683                  }
  5684  
  5685          sband = ar->hw->wiphy->bands[def.chan->band];
  5686          basic_rate_idx = ffs(vif->bss_conf.basic_rates) - 1;
  5687          bitrate = sband->bitrates[basic_rate_idx].bitrate;
  5688  
  5689          hw_rate_code = ath10k_mac_get_rate_hw_value(bitrate);
  5690          if (hw_rate_code < 0) {
  5691                  ath10k_warn(ar, "bitrate not supported %d\n", bitrate);
  5692                  mutex_unlock(&ar->conf_mutex);
  5693                  return;
  5694          }
  5695  
  5696          vdev_param = ar->wmi.vdev_param->mgmt_rate;
  5697          ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
  5698                                          hw_rate_code);
  5699          if (ret)
  5700                  ath10k_warn(ar, "failed to set mgmt tx rate %d\n", ret);
  5701          }
                ^
End.  Looks like a bug.

  5702  
  5703          mutex_unlock(&ar->conf_mutex);
  5704  }

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
