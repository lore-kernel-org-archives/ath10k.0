Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6yJz-0008L2-D3
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 13:33:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k:  fix vdev-start timeout on error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1531512596-31355-1-git-send-email-greearb@candelatech.com>
References: <1531512596-31355-1-git-send-email-greearb@candelatech.com>
Message-Id: <20181001133301.1D84F609A5@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 13:33:01 +0000 (UTC)
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com wrote:

> The vdev-start-response message should cause the
> completion to fire, even in the error case.  Otherwise,
> the user still gets no useful information and everything
> is blocked until the timeout period.
> 
> Add some warning text to print out the invalid status
> code to aid debugging, and propagate failure code.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

833fd34d743c ath10k: fix vdev-start timeout on error

-- 
https://patchwork.kernel.org/patch/10524087/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
