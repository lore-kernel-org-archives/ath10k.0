Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gycNo-0005zi-7R
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 13:02:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k: sdio: set hi_acs_flags
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550766118-31703-2-git-send-email-kvalo@codeaurora.org>
References: <1550766118-31703-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190226130251.92467616BA@smtp.codeaurora.org>
Date: Tue, 26 Feb 2019 13:02:51 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> wrote:

> The SDIO firmware does not allow transmitting packets with the
> reduced tx completion HI_ACS option. SDIO firmware uses 1544 as
> alternate credit size, which is not big enough for the maximum sized
> mac80211 frames. Disable both these HI_ACS flags for SDIO.
> 
> Co-developed-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

bf1f0a1a4da1 ath10k: sdio: set hi_acs_flags
6cd70c65647b ath10k: sdio: disable fwlog prints
55545b087012 ath10k: sdio: reset chip on power_down()
7d4445223031 ath10k: don't report unset rssi values to mac80211

-- 
https://patchwork.kernel.org/patch/10824323/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
