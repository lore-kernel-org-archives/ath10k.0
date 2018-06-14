Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTtC-0004qN-UM
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:10:20 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix spectral scan for QCA9984 and QCA9888 chipsets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1527593473-15976-1-git-send-email-periyasa@codeaurora.org>
References: <1527593473-15976-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20180614151008.7E6BD6074D@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:10:08 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> The spectral scan has been always broken on QCA9984 and QCA9888.
> 
> Introduce a hardware parameter 'spectral_bin_offset' to resolve this issue for
> QCA9984 and QCA9888 chipsets. For other chipsets, the hardware parameter
> 'spectral_bin_offset' is zero so that existing behaviour is retained as it is.
> 
> In QCA9984 and QCA9888 chipsets, hardware param value 'spectral_bin_discard'
> is 12 bytes. This 12 bytes is derived as the sum of segment index (4 bytes),
> extra bins before the actual data (4 bytes) and extra bins after the actual
> data (4 bytes). Always discarding (12 bytes) happens at end of the samples and
> incorrect samples got dumped, so that user can find incorrect arrangement
> samples in spectral scan dump.
> 
> To fix this issue, we have to discard first 8 bytes and last 4 bytes in every
> samples, so totally 12 bytes are discarded. In every sample we need to consider
> the offset while taking the actual spectral data. For QCA9984, QCA9888 the
> offset is 8 bytes (segment index + extra bins before actual data).
> 
> Hardware tested: QCA9984 and QCA9888
> Firmware tested: 10.4-3.5.3-00053
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2e9bcd0d7324 ath10k: fix spectral scan for QCA9984 and QCA9888 chipsets

-- 
https://patchwork.kernel.org/patch/10435029/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
