Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkCFF-00066r-TI
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 17:46:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix open brace location
 inath10k_wmi_tlv_op_gen_dbglog_cfg()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <153069556911.18112.15554530524319470412.stgit@potku.adurom.net>
References: <153069556911.18112.15554530524319470412.stgit@potku.adurom.net>
Message-Id: <20180730174557.606CA62241@smtp.codeaurora.org>
Date: Mon, 30 Jul 2018 17:45:57 +0000 (UTC)
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

> Fixes a recently added checkpatch warning:
> 
> wmi-tlv.c:2703: open brace '{' following function definitions go on the next line
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1e3c43a7f111 ath10k: fix open brace location in ath10k_wmi_tlv_op_gen_dbglog_cfg()

-- 
https://patchwork.kernel.org/patch/10506253/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
