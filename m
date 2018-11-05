Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJboB-0005iF-7w
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 10:08:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath10k: Dump tx stats in rate table format
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1539324208-10525-1-git-send-email-akolli@codeaurora.org>
References: <1539324208-10525-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20181105100824.F322F6085F@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 10:08:24 +0000 (UTC)
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

> This patch adds the tx statistics pkts/bytes dump
> in rate table format.
> 
> Dump format table is similar to http://mcsindex.com/
> 
> Tested on QCA9984/QCA4019/QCA988x
> Firmware: 10.4-3.5.3-00057
> 	  10.2.4-1.0-00037
> command:
> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan0/
>     stations/<MACADDR>/tx_stats
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e88975ca37d1 ath10k: dump tx stats in rate table format

-- 
https://patchwork.kernel.org/patch/10637889/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
