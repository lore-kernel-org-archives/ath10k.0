Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQm1-0007rF-Jr
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:25:07 +0000
MIME-Version: 1.0
Subject: Re: ath10k: hw: make consistent usage of ATH10K_FW_DIR in paths
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180509075633.3030-1-marcus.folkesson@gmail.com>
References: <20180509075633.3030-1-marcus.folkesson@gmail.com>
Message-Id: <20180512092455.34E256079C@smtp.codeaurora.org>
Date: Sat, 12 May 2018 09:24:55 +0000 (UTC)
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
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> For some reason not all entries used ATH10K_FW_DIR so fix that. No functional
> changes.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0be928850dac ath10k: hw: make consistent usage of ATH10K_FW_DIR in paths

-- 
https://patchwork.kernel.org/patch/10388585/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
