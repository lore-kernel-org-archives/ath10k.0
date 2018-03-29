Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TZL-0006BL-Jz
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 09:10:05 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix vdev stats for 10.4 firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1521227710-3155-1-git-send-email-rmanohar@codeaurora.org>
References: <1521227710-3155-1-git-send-email-rmanohar@codeaurora.org>
Message-Id: <20180329090953.4D7A760C54@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 09:09:53 +0000 (UTC)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@codeaurora.org> wrote:

> Currently vdev stats displayed in fw_stats are applicable
> only for TLV based firmware and fix it for 10.4 firmware
> as of now. The vdev stats in 10.4 firmware is split into two
> parts (vdev_stats, vdev_stats_extended). The actual stats
> are captured only in extended vdev stats. In order to enable
> vdev stats, appropriate feature bit will be set on extended
> resource config. As FTM related counters are available only on
> newer 10.4 based firmware, these counters will be displayed
> only on valid data.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1b3fdb50f881 ath10k: fix vdev stats for 10.4 firmware

-- 
https://patchwork.kernel.org/patch/10289879/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
