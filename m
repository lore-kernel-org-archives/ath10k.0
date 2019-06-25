Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfm5u-0008TD-39
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 14:06:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: Enable MSA region dump support for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190610091759.29508-1-govinds@codeaurora.org>
References: <20190610091759.29508-1-govinds@codeaurora.org>
Message-Id: <20190625140645.A32456085C@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 14:06:45 +0000 (UTC)
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

> MSA memory region caries the hw descriptors information.
> Dump MSA region in core dump as this is very helpful in debugging
> hw issues.
> 
> Testing: Tested on WCN3990 HW
> Tested FW: WLAN.HL.3.1-00959-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

New warning:

drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_msa_dump_memory':
drivers/net/wireless/ath/ath10k/snoc.c:1662:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  hdr->start = cpu_to_le32(ar_snoc->qmi->msa_va);
                         ^

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10984519/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
