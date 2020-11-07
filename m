Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJ5o-0007LD-9V
 for ath10k@lists.infradead.org; Sat, 07 Nov 2020 07:57:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix compilation warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604507837-29361-1-git-send-email-tamizhr@codeaurora.org>
References: <1604507837-29361-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20201107075657.9B2D8C433CB@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 07:56:57 +0000 (UTC)
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> wrote:

> This change fixes below compilation warning.
> 
> smatch warnings:
>  drivers/net/wireless/ath/ath10k/mac.c:9125 ath10k_mac_op_set_tid_config() error: uninitialized symbol 'ret'.
> 
> No functional changes. Compile tested only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b91626451178 ath10k: fix compilation warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604507837-29361-1-git-send-email-tamizhr@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
