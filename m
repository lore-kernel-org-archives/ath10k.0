Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egAgM-00082u-LB
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 14:45:19 +0000
MIME-Version: 1.0
Subject: Re: [v3,2/2] ath10k: Add support for Ubiquiti rebranded QCA988X v2
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180125111340.17553-3-tobleminer@gmail.com>
References: <20180125111340.17553-3-tobleminer@gmail.com>
Message-Id: <20180129144503.5903B609F2@smtp.codeaurora.org>
Date: Mon, 29 Jan 2018 14:45:03 +0000 (UTC)
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
To: Tobias Schramm <tobleminer@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@qca.qualcomm.com, bhelgaas@google.com

Tobias Schramm <tobleminer@gmail.com> wrote:

> Some modern Ubiquiti devices contain a rebranded QCA988X rev2 with
> a custom Ubiquiti vendor and device id. This patch adds support for
> those devices, treating them as a QCA988X v2.
> 
> Signed-off-by: Tobias Schramm <tobleminer@gmail.com>
> [kvalo@codeaurora.org: rebase, add missing fields in hw_params, fix a long line in pci.c:61]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This didn't apply to ath.git so I rebased it and it did some other modifications
(list in the commit log):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4037b395c946f94ee05ddc652421cdbd35567a3e

-- 
https://patchwork.kernel.org/patch/10183909/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
