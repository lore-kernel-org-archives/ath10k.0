Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f1TLe-00009R-GZ
 for ath10k@lists.infradead.org; Thu, 29 Mar 2018 08:55:55 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: refactor ath10k_pci_dump_memory() in preparation
 for QCA9984 support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522054714-31492-1-git-send-email-kvalo@codeaurora.org>
References: <1522054714-31492-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20180329085544.3E24560C64@smtp.codeaurora.org>
Date: Thu, 29 Mar 2018 08:55:44 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> As QCA9984 needs two region types refactor the code to make it easier add the
> new types. No functional changes.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

10c228843081 ath10k: refactor ath10k_pci_dump_memory() in preparation for QCA9984 support
219cc084c670 ath10k: add memory dump support QCA9984

-- 
https://patchwork.kernel.org/patch/10307431/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
