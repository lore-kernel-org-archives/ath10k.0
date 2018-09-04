Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx76H-0005jy-6v
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 08:54:18 +0000
MIME-Version: 1.0
Date: Tue, 04 Sep 2018 14:24:06 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 4/4] ath10k: add debugfs support to dump per sta tx stats
In-Reply-To: <20180828133640.7D55E6044E@smtp.codeaurora.org>
References: <1533561223-342-5-git-send-email-akolli@codeaurora.org>
 <20180828133640.7D55E6044E@smtp.codeaurora.org>
Message-ID: <a6754e61eee013bd38dc9ba5463e2275@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-08-28 19:06, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> wrote:
> 
>> This patch adds 'tx_stats' in per station debugfs entry.
>> 
>> Use this command to dump tx_stats:
>> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan0/
>>     stations/<MACADDR>/tx_stats
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> kbuild bot found new warnings:
> 
>    drivers/net/wireless/ath/ath10k/debugfs_sta.c: In function
> 'ath10k_dbg_sta_dump_tx_stats':
>>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:714:1: warning: the 
>>> frame size of 1088 bytes is larger than 1024 bytes 
>>> [-Wframe-larger-than=]
>     }
>     ^
> 
>    drivers/net/wireless/ath/ath10k/debugfs_sta.c: In function
> 'ath10k_sta_add_debugfs':
>>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:737:41: error: 'struct 
>>> ath10k' has no member named 'debug'
>      if (ath10k_peer_stats_enabled(ar) && 
> ar->debug.enable_extd_tx_stats)
>                                             ^~

Please drop this patch series, I sent V2 addressing these issues.

Thanks
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
