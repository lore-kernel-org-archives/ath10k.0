Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1kt-0002B8-M8
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:05:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Remove work in progress logs from snoc driver
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181119113040.23294-1-govinds@codeaurora.org>
References: <20181119113040.23294-1-govinds@codeaurora.org>
Message-Id: <20181220170453.1F8B8608FF@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:04:53 +0000 (UTC)
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

> All the necessary patches to make wifi running (over SNOC)
> are merged and tested on SDM845/QCS404 platform with WCN3990
> wifi module, hence remove work in progress debug from snoc
> driver and Kconfig.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

876596759287 ath10k: remove work in progress logs from snoc driver

-- 
https://patchwork.kernel.org/patch/10688559/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
