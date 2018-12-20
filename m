Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1j0-0001hr-LU
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:03:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix warning due to msdu limit error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1542613703-9704-1-git-send-email-bperumal@codeaurora.org>
References: <1542613703-9704-1-git-send-email-bperumal@codeaurora.org>
Message-Id: <20181220170255.D4E20608FB@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:02:51 +0000 (UTC)
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> Some hardwares variants (QCA99x0) are limiting msdu deaggregation with
> some threshold value(default limit in QCA99x0 is 64 msdus), it was introduced to
> avoid excessive MSDU-deaggregation in error cases. When number of sub frames
> exceeds the limit, target hardware will send all msdus starting from present
> msdu in RAW format as a single msdu packet and it will be indicated with
> error status bit "RX_MSDU_END_INFO0_MSDU_LIMIT_ERR" set in rx descriptor.
> This msdu frame is a partial raw MSDU and does't have first msdu and ieee80211
> header. It caused below warning message.
> 
> [  320.151332] ------------[ cut here ]------------
> [  320.155006] WARNING: CPU: 0 PID: 3 at drivers/net/wireless/ath/ath10k/htt_rx.c:1188
> 
> In our issue case, MSDU limit error happened due to FCS error and generated
> this warning message.
> 
> This fixes the warning by handling the MSDU limit error. If msdu limit error
> happens, driver adds first MSDU's ieee80211 header and sets A-MSDU present bit
> in QOS header so that upper layer processes this frame if it is valid or drop it
> if FCS error set. And removed the warning message, hence partial msdus without
> first msdu is expected in msdu limit error cases.
> 
> Tested on QCA9984, Firmware 10.4-3.6-00104
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a2864772f33a ath10k: fix warning due to msdu limit error

-- 
https://patchwork.kernel.org/patch/10688251/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
