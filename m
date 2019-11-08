Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT020-0001KD-38
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 08:54:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: disable cpuidle during downloading firmware.
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191101054035.42101-1-ikjn@chromium.org>
References: <20191101054035.42101-1-ikjn@chromium.org>
Message-Id: <20191108085411.B30B460DA6@smtp.codeaurora.org>
Date: Fri,  8 Nov 2019 08:54:11 +0000 (UTC)
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
To: Ikjoon Jang <ikjn@chromium.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S . Miller" <davem@davemloft.net>

Ikjoon Jang <ikjn@chromium.org> wrote:

> Downloading ath10k firmware needs a large number of IOs and
> cpuidle's miss predictions make it worse. In the worst case,
> resume time can be three times longer than the average on sdio.
> 
> This patch disables cpuidle during firmware downloading by
> applying PM_QOS_CPU_DMA_LATENCY in ath10k_download_fw().
> 
> Tested-on: QCA9880
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00029
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3b58d6a599ba ath10k: disable cpuidle during downloading firmware

-- 
https://patchwork.kernel.org/patch/11222331/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
