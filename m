Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6qGA-0006C3-ED
 for ath10k@lists.infradead.org; Sat, 15 Aug 2020 07:05:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: add wmi service peer stat info for wmi tlv
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597312029-32348-2-git-send-email-wgong@codeaurora.org>
References: <1597312029-32348-2-git-send-email-wgong@codeaurora.org>
Message-Id: <20200815070540.F3ED3C433C9@smtp.codeaurora.org>
Date: Sat, 15 Aug 2020 07:05:40 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> ath10k_sta_statistics is used to report info for iw wlan0 link,
> it check ath10k_peer_stats_enabled, and ath10k_peer_stats_enabled
> check WMI_SERVICE_PEER_STATS bit of ar->wmi.svc_map. SVCMAP() for
> WMI_SERVICE_PEER_STATS was defined only for wmi_10x_svc_map and
> wmi_10_4_svc_map interfaces, it missed in wmi_tlv_svc_map, so it is
> not usable for iw wlan0 link for wmi tlv interface.
> 
> If firmware report WMI_TLV_SERVICE_PEER_STATS_INFO for wmi tlv, then
> enable the WMI_SERVICE_PEER_STATS bit in ath10k, and then it pass check
> in ath10k_peer_stats_enabled and ath10k_sta_statistics pass check.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

e39f32afc6d2 ath10k: add wmi service peer stat info for wmi tlv
1cd6ba8ae33e ath10k: remove return for NL80211_STA_INFO_TX_BITRATE
cbcbabb9c395 ath10k: enable supports_peer_stats_info for QCA6174 PCI devices

-- 
https://patchwork.kernel.org/patch/11712349/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
