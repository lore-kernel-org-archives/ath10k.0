Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7hN-0002l7-QE
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:38:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Remove experimental tag from ath10k Kconfig
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200507055324.15564-1-govinds@codeaurora.org>
References: <20200507055324.15564-1-govinds@codeaurora.org>
Message-Id: <20200511123821.41011C432C2@smtp.codeaurora.org>
Date: Mon, 11 May 2020 12:38:21 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> ath10k(sdio/snoc) is no longer experimental. Remove experimental tag for
> SDIO/SNOC from ath10k Kconfig.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4d0f3604c4d1 ath10k: remove experimental tag from SDIO and SNOC busses in Kconfig

-- 
https://patchwork.kernel.org/patch/11532477/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
