Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSznk-00026S-TV
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 08:39:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry flag to skip SCM call for
 msa region
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191023094014.28683-2-govinds@codeaurora.org>
References: <20191023094014.28683-2-govinds@codeaurora.org>
Message-Id: <20191108083928.8BA2C60A1B@smtp.codeaurora.org>
Date: Fri,  8 Nov 2019 08:39:28 +0000 (UTC)
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

> Add boolean context flag to disable SCM call for statically
> mapped msa region.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I was wondering why there are no review comments from DT folks and then
noticed that you didn't CC the devicetree list. Please resend (as v2)
and CC devicetree list.

2 patches set to Changes Requested.

11206177 [1/2] dt: bindings: add dt entry flag to skip SCM call for msa region
11206179 [2/2] ath10k: Don't call SCM interface for statically mapped msa region

-- 
https://patchwork.kernel.org/patch/11206177/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
