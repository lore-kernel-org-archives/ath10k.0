Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfHa-0007Ox-Ga
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 10:36:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] dt: bindings: add dt entry flag to skip SCM call
 for msa region
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200103134414.15457-2-govinds@codeaurora.org>
References: <20200103134414.15457-2-govinds@codeaurora.org>
Message-Id: <20200126103645.79D13C43383@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:36:45 +0000 (UTC)
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
Cc: robh@kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, devicetree@vger.kernel.org

Govind Singh <govinds@codeaurora.org> wrote:

> Add boolean context flag to disable SCM call for statically
> mapped msa region.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

6ca71a10aee8 dt: bindings: add dt entry flag to skip SCM call for msa region
ab000ea6a393 ath10k: Don't call SCM interface for statically mapped msa region

-- 
https://patchwork.kernel.org/patch/11316913/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
