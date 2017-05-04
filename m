Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6GKI-00076n-7f
 for ath10k@lists.infradead.org; Thu, 04 May 2017 12:57:48 +0000
MIME-Version: 1.0
Subject: Re: [v7,01/10] ath10k: htc: made static function public
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <149207213738.4590.816518386579937753.stgit@potku.adurom.net>
References: <149207213738.4590.816518386579937753.stgit@potku.adurom.net>
Message-ID: <5322c7736c7843deb83e86354f42ecc7@eusanexr01a.eu.qualcomm.com>
Date: Thu, 4 May 2017 05:57:19 -0700
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> From: Erik Stromdahl <erik.stromdahl@gmail.com>
> 
> Changed ath10k_htc_notify_tx_completion and
> ath10k_htc_process_trailer from static to non static.
> 
> These functions are needed by SDIO/mbox.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

10 patches applied to ath-next branch of ath.git, thanks.

3e0dd820f07f ath10k: htc: made static function public
680ebb4e7977 ath10k: htc: rx trailer lookahead support
ea1a3ddf6273 ath10k: htc: move htc ctrl ep connect to htc_init
fcd2113363dd ath10k: htc: refactorization
01d6fd6965ea ath10k: various sdio related definitions
60bdfffa1254 ath10k: add sdio extra initializations
34dd398a55ff ath10k: sdio get target info
04ff79467ec2 ath10k: htc: ready_ext msg support
f008d1537bf8 ath10k: different fw file name for sdio
d96db25d2025 ath10k: add initial SDIO support

-- 
https://patchwork.kernel.org/patch/9678959/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
