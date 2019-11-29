Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaav0-0004zs-0g
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:42:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: set max mtu to 1500 for sdio chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eaacca72d-a73d6fb5-0e3f-4fbb-9045-8363270fe25f-000000@us-west-2.amazonses.com>
References: <0101016eaacca72d-a73d6fb5-0e3f-4fbb-9045-8363270fe25f-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb61c5161-97752744-4206-4a8c-889a-12ae7523cc5c-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:42:19 +0000
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

> For sdio chip, the max credit size in firmware is 1556, the 1556
> include payload, ieee80211 header, htt header, htc header. So it
> need to set the max mtu to 1500 to forbidden TX packet which exceed
> 1500 form application.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

376a30c7c9a0 ath10k: set max mtu to 1500 for sdio chip

-- 
https://patchwork.kernel.org/patch/11263345/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
