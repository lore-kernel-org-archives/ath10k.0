Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVs6h-0004Z1-CM
 for ath10k@lists.infradead.org; Tue, 05 May 2020 07:35:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: remove the max_sched_scan_reqs value
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191114050001.4658-1-wgong@codeaurora.org>
References: <20191114050001.4658-1-wgong@codeaurora.org>
Message-Id: <20200505073510.09023C433F2@smtp.codeaurora.org>
Date: Tue,  5 May 2020 07:35:10 +0000 (UTC)
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

> The struct cfg80211_wowlan of NET_DETECT WoWLAN feature share the same
> struct cfg80211_sched_scan_request together with scheduled scan request
> feature, and max_sched_scan_reqs of wiphy is only used for sched scan,
> and ath10k does not support scheduled scan request feature, so ath10k
> does not set flag NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR, but ath10k
> set max_sched_scan_reqs of wiphy to a non zero value 1, then function
> nl80211_add_commands_unsplit of cfg80211 will set it support command
> NL80211_CMD_START_SCHED_SCAN because max_sched_scan_reqs is a non zero
> value, but actually ath10k not support it, then it leads a mismatch result
> for sched scan of cfg80211, then application shill found the mismatch and
> stop running case of MAC random address scan and then the case fail.
> 
> After remove max_sched_scan_reqs value, it keeps match for sched scan and
> case of MAC random address scan pass.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> Tested with QCA6174 PCIe with firmware WLAN.RM.4.4.1-00110-QCARMSWP-1.
> 
> Fixes: ce834e280f2f875 ("ath10k: support NET_DETECT WoWLAN feature")
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d431f8939c14 ath10k: remove the max_sched_scan_reqs value

-- 
https://patchwork.kernel.org/patch/11243015/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
