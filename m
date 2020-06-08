Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFnA-0004EY-LM
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 11:18:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Move msa region map/unmap to init/deinit path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591191231-31917-1-git-send-email-govinds@codeaurora.org>
References: <1591191231-31917-1-git-send-email-govinds@codeaurora.org>
Message-Id: <20200608111808.9D72DC433CB@smtp.codeaurora.org>
Date: Mon,  8 Jun 2020 11:18:08 +0000 (UTC)
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

> With kernel qrtr switch from user space qrtr, fw crash is seen
> during reboot. During reboot modem rproc shutdown causes wlan qmi
> service exit and msa region gets unmapped. Since pdev is not suspended
> hw still accessing the msa region and this results in  fw crash as
> msa region is unmapped.
> 
> Decouple msa mapping from wlan qmi server arrive/exit to init/deinit
> path.
> 
> Testing is pending with "0c2204a4ad71 net: qrtr: Migrate nameservice
> to kernel from userspace", only regression sanity performed with user space
> qrtr on QCS404/SC7180.
> 
> Fixes: 0c2204a4ad71 net: qrtr: Migrate nameservice to kernel from userspace
> Signed-off-by: Govind Singh <govinds@codeaurora.org>

Dropped as requested

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11585699/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
