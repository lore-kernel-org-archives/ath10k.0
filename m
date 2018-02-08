Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejlWW-0004Ai-Or
 for ath10k@lists.infradead.org; Thu, 08 Feb 2018 12:41:58 +0000
MIME-Version: 1.0
Subject: Re: Revert "ath10k: add sanity check to ie_len before parsing
 fw/board ie"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1518011483-7704-1-git-send-email-kvalo@codeaurora.org>
References: <1518011483-7704-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20180208124145.CE2896081C@smtp.codeaurora.org>
Date: Thu,  8 Feb 2018 12:41:45 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Ryan Hsu <ryanhsu@codeaurora.org>

Kalle Valo <kvalo@codeaurora.org> wrote:

> This reverts commit 9ed4f91628737c820af6a1815b65bc06bd31518f.
> 
> The commit introduced a regression that over read the ie with
> the padding.
> 
> - the expected IE information
> 
> ath10k_pci 0000:03:00.0: found firmware features ie (1 B)
> ath10k_pci 0000:03:00.0: Enabling feature bit: 6
> ath10k_pci 0000:03:00.0: Enabling feature bit: 7
> ath10k_pci 0000:03:00.0: features
> ath10k_pci 0000:03:00.0: 00000000: c0 00 00 00 00 00 00 00
> 
> - the wrong IE with padding is read (0x77)
> 
> ath10k_pci 0000:03:00.0: found firmware features ie (4 B)
> ath10k_pci 0000:03:00.0: Enabling feature bit: 6
> ath10k_pci 0000:03:00.0: Enabling feature bit: 7
> ath10k_pci 0000:03:00.0: Enabling feature bit: 8
> ath10k_pci 0000:03:00.0: Enabling feature bit: 9
> ath10k_pci 0000:03:00.0: Enabling feature bit: 10
> ath10k_pci 0000:03:00.0: Enabling feature bit: 12
> ath10k_pci 0000:03:00.0: Enabling feature bit: 13
> ath10k_pci 0000:03:00.0: Enabling feature bit: 14
> ath10k_pci 0000:03:00.0: Enabling feature bit: 16
> ath10k_pci 0000:03:00.0: Enabling feature bit: 17
> ath10k_pci 0000:03:00.0: Enabling feature bit: 18
> ath10k_pci 0000:03:00.0: features
> ath10k_pci 0000:03:00.0: 00000000: c0 77 07 00 00 00 00 00
> 
> Tested-by: Mike Lothian <mike@fireburn.co.uk>
> Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

9ce8b24aa96e Revert "ath10k: add sanity check to ie_len before parsing fw/board ie"

-- 
https://patchwork.kernel.org/patch/10205215/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
