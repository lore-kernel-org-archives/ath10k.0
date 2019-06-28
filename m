Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgwHc-0002iT-Qn
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 19:11:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix memory leak in qmi
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561472748-28467-1-git-send-email-dundi@codeaurora.org>
References: <1561472748-28467-1-git-send-email-dundi@codeaurora.org>
Message-Id: <20190628191139.242FE6070D@smtp.codeaurora.org>
Date: Fri, 28 Jun 2019 19:11:39 +0000 (UTC)
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
To: Dundi Raviteja <dundi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Dundi Raviteja <dundi@codeaurora.org> wrote:

> Currently the memory allocated for qmi handle is
> not being freed during de-init which leads to memory leak.
> 
> Free the allocated qmi memory in qmi deinit
> to avoid memory leak.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Fixes: fda6fee0001e ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Dundi Raviteja <dundi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c709df58832c ath10k: Fix memory leak in qmi

-- 
https://patchwork.kernel.org/patch/11015647/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
