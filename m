Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSvtv-0004DO-3D
 for ath10k@lists.infradead.org; Mon, 27 Apr 2020 05:01:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: enable rx duration report default for wmi tlv
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200423022758.5365-1-wgong@codeaurora.org>
References: <20200423022758.5365-1-wgong@codeaurora.org>
Message-Id: <20200427050145.6B036C433F2@smtp.codeaurora.org>
Date: Mon, 27 Apr 2020 05:01:45 +0000 (UTC)
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

> When run command "iw dev wlan0 station dump", the rx duration is 0.
> When firmware indicate WMI_UPDATE_STATS_EVENTID, extended flag of
> statsis not set by default, so firmware do not report rx duration.
> 
> one sample:
> localhost # iw wlan0 station dump
> Station c4:04:15:5d:97:22 (on wlan0)
>         inactive time:  48 ms
>         rx bytes:       21670
>         rx packets:     147
>         tx bytes:       11529
>         tx packets:     100
>         tx retries:     88
>         tx failed:      36
>         beacon loss:    1
>         beacon rx:      31
>         rx drop misc:   47
>         signal:         -72 [-74, -75] dBm
>         signal avg:     -71 [-74, -75] dBm
>         beacon signal avg:      -71 dBm
>         tx bitrate:     54.0 MBit/s MCS 3 40MHz
>         rx bitrate:     1.0 MBit/s
> 	rx duration:    0 us
> 
> This patch enable firmware's extened flag of stats by setting flag
> WMI_TLV_STAT_PEER_EXTD of ar->fw_stats_req_mask which is set in
> ath10k_core_init_firmware_features via WMI_REQUEST_STATS_CMDID.
> 
> After apply this patch, rx duration show value with the command:
> Station c4:04:15:5d:97:22 (on wlan0)
>         inactive time:  883 ms
>         rx bytes:       44289
>         rx packets:     265
>         tx bytes:       10838
>         tx packets:     93
>         tx retries:     899
>         tx failed:      103
>         beacon loss:    0
>         beacon rx:      78
>         rx drop misc:   46
>         signal:         -71 [-74, -76] dBm
>         signal avg:     -70 [-74, -76] dBm
>         beacon signal avg:      -70 dBm
>         tx bitrate:     54.0 MBit/s MCS 3 40MHz
>         rx bitrate:     1.0 MBit/s
>         rx duration:    358004 us
> 
> This patch do not have side effect for all chips, because function
> ath10k_debug_fw_stats_request is already exported to debugfs
> "fw_stats" and WMI_REQUEST_STATS_CMDID is safely sent after condition
> checked by ath10k_peer_stats_enabled in ath10k_sta_statistics.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4913e675630e ath10k: enable rx duration report default for wmi tlv

-- 
https://patchwork.kernel.org/patch/11504895/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
