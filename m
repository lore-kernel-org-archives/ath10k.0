Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkKu7-0006My-1h
 for ath10k@lists.infradead.org; Fri, 18 Jan 2019 03:33:12 +0000
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] wireless: remove unneeded semicolon
Date: Fri, 18 Jan 2019 11:32:15 +0800
Message-ID: <20190118033215.5904-1-yuehaibing@huawei.com>
MIME-Version: 1.0
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
To: davem@davemloft.net, kvalo@codeaurora.org, arend.vanspriel@broadcom.com, franky.lin@broadcom.com, chi-hsien.lin@cypress.com, pkshih@realtek.com
Cc: brcm80211-dev-list.pdl@broadcom.com, YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, brcm80211-dev-list@cypress.com

remove unneeded semicolon

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h                     | 2 +-
 drivers/net/wireless/ath/ath6kl/init.c                    | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 2 +-
 drivers/net/wireless/ray_cs.c                             | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c      | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 2034ccc..021eb30 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1986,7 +1986,7 @@ static inline const char *ath10k_wmi_phymode_str(enum wmi_phy_mode mode)
 		/* no default handler to allow compiler to check that the
 		 * enum is fully handled
 		 */
-	};
+	}
 
 	return "<unknown>";
 }
diff --git a/drivers/net/wireless/ath/ath6kl/init.c b/drivers/net/wireless/ath/ath6kl/init.c
index 54132af..aa1c71a 100644
--- a/drivers/net/wireless/ath/ath6kl/init.c
+++ b/drivers/net/wireless/ath/ath6kl/init.c
@@ -1140,7 +1140,7 @@ static int ath6kl_fetch_fw_apin(struct ath6kl *ar, const char *name)
 
 		len -= ie_len;
 		data += ie_len;
-	};
+	}
 
 	ret = 0;
 out:
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index d64bf23..ec12986 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -315,7 +315,7 @@ static int brcmf_sdiod_skbuff_read(struct brcmf_sdio_dev *sdiodev,
 		/* bail out as things are really fishy here */
 		WARN(1, "invalid sdio function number: %d\n", func->num);
 		err = -ENOMEDIUM;
-	};
+	}
 
 	if (err == -ENOMEDIUM)
 		brcmf_sdiod_change_state(sdiodev, BRCMF_SDIOD_NOMEDIUM);
diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 33ad875..b58bb7b 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -2211,7 +2211,7 @@ static void rx_data(struct net_device *dev, struct rcs __iomem *prcs,
 			untranslate(local, skb, total_len);
 		}
 	} else { /* sniffer mode, so just pass whole packet */
-	};
+	}
 
 /************************/
 	/* Now pick up the rest of the fragments if any */
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c
index 1263b12..11f94b1 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c
@@ -332,7 +332,7 @@ static void _rtl8723be_phy_set_txpower_by_rate_base(struct ieee80211_hw *hw,
 				 "Invalid RateSection %d in Band 2.4G, Rf Path %d, %dTx in PHY_SetTxPowerByRateBase()\n",
 				 rate_section, path, txnum);
 			break;
-		};
+		}
 	} else {
 		RT_TRACE(rtlpriv, COMP_INIT, DBG_LOUD,
 			 "Invalid Band %d in PHY_SetTxPowerByRateBase()\n",
@@ -374,7 +374,7 @@ static u8 _rtl8723be_phy_get_txpower_by_rate_base(struct ieee80211_hw *hw,
 				 "Invalid RateSection %d in Band 2.4G, Rf Path %d, %dTx in PHY_GetTxPowerByRateBase()\n",
 				 rate_section, path, txnum);
 			break;
-		};
+		}
 	} else {
 		RT_TRACE(rtlpriv, COMP_INIT, DBG_LOUD,
 			 "Invalid Band %d in PHY_GetTxPowerByRateBase()\n",
@@ -694,7 +694,7 @@ static u8 _rtl8723be_get_rate_section_index(u32 regaddr)
 		else if (regaddr >= 0xE20 && regaddr <= 0xE4C)
 			index = (u8)((regaddr - 0xE20) / 4);
 		break;
-	};
+	}
 	return index;
 }
 
-- 
2.7.0



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
