Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycR7-0008Fl-R1
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 13:06:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove the calibration data fetch for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550470471-28002-1-git-send-email-wgong@codeaurora.org>
References: <1550470471-28002-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20190226130617.3D06E61AAE@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 13:06:16 +0000 (UTC)
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

> The calibration data fetch will trigger sdio error, then sdio will
> become fail untill reboot system.
> 
> If happens when run ifconfig wlan down, then ifconfig wlan up will
> fail untill reboot system.Remove it fix the ifconfig wlan issue.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00005-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6566abea0b97 ath10k: remove the calibration data fetch for sdio

-- 
https://patchwork.kernel.org/patch/10817363/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
