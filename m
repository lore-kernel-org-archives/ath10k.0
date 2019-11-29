Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaaxC-0005mM-MS
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:44:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: change log level for mpdu status of sdio chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eaaeb8dba-59b83dae-1133-48b3-8aab-a51f765322bf-000000@us-west-2.amazonses.com>
References: <0101016eaaeb8dba-59b83dae-1133-48b3-8aab-a51f765322bf-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb61e6758-6214d37a-5887-432a-ae09-573b2fb33bb1-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:44:36 +0000
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

> Change log level from warn to dbg level of mpdu status
> of sdio chip.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00007-QCARMSWP-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5d2467299a17 ath10k: change log level for mpdu status of sdio chip

-- 
https://patchwork.kernel.org/patch/11263361/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
