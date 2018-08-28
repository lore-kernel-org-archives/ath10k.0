Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fueAs-0005I7-Rb
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 13:36:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] ath10k: add debugfs support to dump per sta tx stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1533561223-342-5-git-send-email-akolli@codeaurora.org>
References: <1533561223-342-5-git-send-email-akolli@codeaurora.org>
Message-Id: <20180828133640.6B39D604BE@smtp.codeaurora.org>
Date: Tue, 28 Aug 2018 13:36:40 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> This patch adds 'tx_stats' in per station debugfs entry.
> 
> Use this command to dump tx_stats:
> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan0/
>     stations/<MACADDR>/tx_stats
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

kbuild bot found new warnings:

   drivers/net/wireless/ath/ath10k/debugfs_sta.c: In function 'ath10k_dbg_sta_dump_tx_stats':
>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:714:1: warning: the frame size of 1088 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    }
    ^

   drivers/net/wireless/ath/ath10k/debugfs_sta.c: In function 'ath10k_sta_add_debugfs':
>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:737:41: error: 'struct ath10k' has no member named 'debug'
     if (ath10k_peer_stats_enabled(ar) && ar->debug.enable_extd_tx_stats)
                                            ^~

-- 
https://patchwork.kernel.org/patch/10557079/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
