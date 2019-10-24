Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXKI-00021p-IO
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 07:14:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry flag to skip SCM call for
 msa region
References: <20191023094014.28683-1-govinds@codeaurora.org>
 <20191023094014.28683-2-govinds@codeaurora.org>
Date: Thu, 24 Oct 2019 10:14:26 +0300
In-Reply-To: <20191023094014.28683-2-govinds@codeaurora.org> (Govind Singh's
 message of "Wed, 23 Oct 2019 15:10:13 +0530")
Message-ID: <87a79qk431.fsf@codeaurora.org>
MIME-Version: 1.0
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

Govind Singh <govinds@codeaurora.org> writes:

> Add boolean context flag to disable SCM call for statically
> mapped msa region.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

Oddly this didn't apply, but 3-way merge did work. Please double check
the result in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=6f308524cf602ed9a0dbb0b0b50ba625b9091879

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
