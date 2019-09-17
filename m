Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAEBy-0004Et-Ao
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:10:55 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: revalidate the msa region coming from firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190731114220.22830-1-govinds@codeaurora.org>
References: <20190731114220.22830-1-govinds@codeaurora.org>
Message-Id: <20190917141053.C49A36141C@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:10:53 +0000 (UTC)
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

> driver sends QMI_WLFW_MSA_INFO_REQ_V01 QMI request to firmware
> and in response expects range of addresses and size to be mapped.
> Add condition to check whether addresses in response falls
> under valid range otherwise return failure.
> 
> Testing: Tested on WCN3990 HW
> Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c41305993ff5 ath10k: revalidate the msa region coming from firmware

-- 
https://patchwork.kernel.org/patch/11067547/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
