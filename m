Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBNYr-00066l-8Q
 for ath10k@lists.infradead.org; Sat, 13 Oct 2018 17:18:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20181013171835.02BF96079B@smtp.codeaurora.org>
Date: Sat, 13 Oct 2018 17:18:34 +0000 (UTC)
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

> For WoWLAN support it is expected to support wake up based on discovery of
> one or more known SSIDs. This is the WIPHY_WOWLAN_NET_DETECT feature,
> which shows up as an NL80211 feature flag.
> 
> This shows up in 'iw phy' as:
> 
> WoWLAN support:
> * wake up on network detection, up to 16 match sets
> 
> And it can be enabled with command:
> 
> iw phy0 wowlan enable net-detect interval 5000 delay 30 freqs 2412 matches ssid foo
> 
> Firmware will do scan by the configured parameters after suspend and
> wakeup if it found matched SSIDs. Tested with QCA6174 hw3.0 with
> firmware WLAN.RM.4.4.1-00110-QCARMSWPZ-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> [kvalo@codeaurora.org: fix lots of endian bugs, whitespace, commit log and style cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ce834e280f2f ath10k: support NET_DETECT WoWLAN feature

-- 
https://patchwork.kernel.org/patch/10567005/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
