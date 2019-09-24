Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCday-0000Gc-7w
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 05:42:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 0/2] add fw coredump for sdio when firmware assert
References: <1569241055-30816-1-git-send-email-wgong@codeaurora.org>
Date: Tue, 24 Sep 2019 08:42:35 +0300
In-Reply-To: <1569241055-30816-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Mon, 23 Sep 2019 20:17:33 +0800")
Message-ID: <878sqe5jxw.fsf@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> add fw coredump for sdio when firmware assert

Please add the changelog here.

> Wen Gong (2):
>   ath10k: add bus type for each layout of coredump
> v2: change code style
> v3: split bus type to another patch, 
> remove ATH10K_BUS_ANY, 
> add bus type for each layout
>   ath10k: add fw coredump for sdio when firmware assert
> v2: change code style
> v3: add commit log for fastdump, 
> add commit log for ath10k_sdio_hif_diag_read,
> change ath10k_err to dbg log

Then you mix the changelog with patch titles like that it makes it hard
to read the summary. So instead add the changelog above, before the
summary, and leave the summary intact.

Also this didn't apply:

Applying: ath10k: add bus type for each layout of coredump
Applying: ath10k: add fw coredump for sdio when firmware assert
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/coredump.c).
error: could not build fake ancestor
Patch failed at 0002 ath10k: add fw coredump for sdio when firmware assert

Then you submit the patch use ath.git master branch as the baseline and
do NOT have any other patches applied. Otherwise the sha1 information is
wrong and it's a lot more work for me to fix the conflicts.

So please rebase and resend.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
