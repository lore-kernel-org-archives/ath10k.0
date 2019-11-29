Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaayg-00077I-40
 for ath10k@lists.infradead.org; Fri, 29 Nov 2019 07:46:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: enable wow feature for sdio chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eab75c9ce-0fc306b4-0804-4829-bf57-85d803251a00-000000@us-west-2.amazonses.com>
References: <0101016eab75c9ce-0fc306b4-0804-4829-bf57-85d803251a00-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb61fcc14-473890f2-db55-46f7-ad1f-2c3ec952aab8-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:46:07 +0000
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

> sdio does not support wow, this patch is to enable it. When system enter
> sleep state, if wowlan is enabled, then sdio chip will keep power if
> platform support keep power, after resume, it will not need to re-load
> firmware again.
> 
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7321095ca39c ath10k: enable wow feature for sdio chip

-- 
https://patchwork.kernel.org/patch/11263485/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
