Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fx3fX-0008Ay-3i
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 05:14:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k:  fix vdev-start timeout on error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1531512596-31355-1-git-send-email-greearb@candelatech.com>
References: <1531512596-31355-1-git-send-email-greearb@candelatech.com>
Message-Id: <20180904051416.AC5AD6034F@smtp.codeaurora.org>
Date: Tue,  4 Sep 2018 05:14:16 +0000 (UTC)
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

This had few checkpatch warnings:

drivers/net/wireless/ath/ath10k/wmi.h:6647: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/wmi.h:6647: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/wmi.h:6648: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/wmi.h:6648: please, no spaces at the start of a line

I fixed those in the pending branch.

-- 
https://patchwork.kernel.org/patch/10524087/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
