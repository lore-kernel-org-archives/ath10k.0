Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt7yO-00066r-IQ
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 09:33:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: report tx airtime provided by fw
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1542298483-15879-1-git-send-email-mpubbise@codeaurora.org>
References: <1542298483-15879-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20190211093355.BEE5E605A2@smtp.codeaurora.org>
Date: Mon, 11 Feb 2019 09:33:55 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> If supported, update transmit airtime in mac80211 with the airtime
> values reported by the firmware. TX airtime of the PPDU is reported
> via HTT data TX completion indication message.
> 
> A new service flag 'WMI_SERVICE_REPORT_AIRTIME' is added to advertise
> the firmware support. For firmwares which do not support this feature,
> TX airtime is calculated in the driver using TX bitrate.
> 
> Hardwares tested : QCA9984
> Firmwares tested : 10.4-3.6.1-00841
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I had some conflicts, please carefully check my resolution in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=1baca5592c99c9d61924956c56c620d371b61d96

$ git am -s --reject 10684687.mbox
Applying: ath10k: report tx airtime provided by fw
Checking patch drivers/net/wireless/ath/ath10k/core.c...
Hunk #1 succeeded at 2631 (offset 32 lines).
Checking patch drivers/net/wireless/ath/ath10k/htt.h...
Hunk #1 succeeded at 571 (offset 7 lines).
Hunk #2 succeeded at 584 (offset 7 lines).
Hunk #3 succeeded at 877 (offset 7 lines).
Checking patch drivers/net/wireless/ath/ath10k/htt_rx.c...
Hunk #1 succeeded at 2220 (offset 217 lines).
Hunk #2 succeeded at 2249 (offset 217 lines).
Hunk #3 succeeded at 2286 (offset 217 lines).
Checking patch drivers/net/wireless/ath/ath10k/mac.c...
Hunk #1 succeeded at 4007 (offset 40 lines).
error: while searching for:
                wiphy_ext_feature_set(ar->hw->wiphy,
                                      NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);

        if (ath10k_peer_stats_enabled(ar))
                wiphy_ext_feature_set(ar->hw->wiphy,
                                      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
        /*

error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:8615
Checking patch drivers/net/wireless/ath/ath10k/txrx.c...
Checking patch drivers/net/wireless/ath/ath10k/wmi.h...
error: while searching for:
        WMI_SERVICE_SPOOF_MAC_SUPPORT,
        WMI_SERVICE_TX_DATA_ACK_RSSI,
        WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,

        /* keep last */
        WMI_SERVICE_MAX,

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:205
error: while searching for:
        WMI_10_4_SERVICE_PEER_TID_CONFIGS_SUPPORT,
        WMI_10_4_SERVICE_VDEV_BCN_RATE_CONTROL,
        WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
};

static inline char *wmi_service_name(int service_id)

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:359
error: while searching for:
        SVCSTR(WMI_SERVICE_RESET_CHIP);
        SVCSTR(WMI_SERVICE_TX_DATA_ACK_RSSI);
        SVCSTR(WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT);
        default:
                return NULL;
        }

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:474
error: while searching for:
               WMI_SERVICE_TX_DATA_ACK_RSSI, len);
        SVCMAP(WMI_10_4_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT,
               WMI_SERVICE_VDEV_DIFFERENT_BEACON_INTERVAL_SUPPORT, len);
}

#undef SVCMAP

error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:786
Hunk #5 succeeded at 2989 (offset -7 lines).
Applied patch drivers/net/wireless/ath/ath10k/core.c cleanly.
Applied patch drivers/net/wireless/ath/ath10k/htt.h cleanly.
Applied patch drivers/net/wireless/ath/ath10k/htt_rx.c cleanly.
Applying patch drivers/net/wireless/ath/ath10k/mac.c with 1 reject...
Hunk #1 applied cleanly.
Rejected hunk #2.
Applied patch drivers/net/wireless/ath/ath10k/txrx.c cleanly.
Applying patch drivers/net/wireless/ath/ath10k/wmi.h with 4 rejects...
Rejected hunk #1.
Rejected hunk #2.
Rejected hunk #3.
Rejected hunk #4.
Hunk #5 applied cleanly.
Patch failed at 0001 ath10k: report tx airtime provided by fw

-- 
https://patchwork.kernel.org/patch/10684687/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
