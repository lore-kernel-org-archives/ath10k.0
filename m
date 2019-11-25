Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCzq-0006Sg-CS
 for ath10k@lists.infradead.org; Mon, 25 Nov 2019 11:57:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: add NL80211_FEATURE_ND_RANDOM_MAC_ADDR for NLO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191108092706.17060-1-wgong@codeaurora.org>
References: <20191108092706.17060-1-wgong@codeaurora.org>
Message-ID: <0101016ea26c8dfd-c5d280f7-2cc2-42a0-af31-f68f736f6cd6-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 11:57:33 +0000
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

> Add NL80211_FEATURE_ND_RANDOM_MAC_ADDR for NLO will enable the random
> mac address for netdetect case.
> iw command:
> iw phy0 wowlan enable net-detect net-detect
> randomize=AA:7B:A1:AC:B2:41/FF:FF:FF:FF:FF:FF interval 5000 delay 30
> freqs 2412 matches ssid foo.
> After suspend, DUT will send probe request with mac AA:7B:A1:AC:B2:41.
> 
> WCN3990, QCA9377, QCA6174 PCI also support this feature.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

23b5156a856b ath10k: add NL80211_FEATURE_ND_RANDOM_MAC_ADDR for NLO

-- 
https://patchwork.kernel.org/patch/11234373/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
