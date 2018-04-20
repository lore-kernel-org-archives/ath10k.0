Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9SrB-0006bA-3G
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 10:01:33 +0000
MIME-Version: 1.0
Subject: Re: ath10k: remove variables which set but not used
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20180318075014.GA26784@blackstone>
References: <20180318075014.GA26784@blackstone>
Message-Id: <20180420100118.1195A60FEA@smtp.codeaurora.org>
Date: Fri, 20 Apr 2018 10:01:18 +0000 (UTC)
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
To: Kenneth Lu <kuohsianglu@gmail.com>
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kenneth Lu <kuohsianglu@gmail.com> wrote:

> Variable buf_len and num_vdev_stats are bging assigned but never read.
> These are redundant and can be remove.
> 
> Signed-off-by: Kenneth Lu <kuohsianglu@gmail.com>

Fails to compile:

drivers/net/wireless/ath/ath10k/wmi.c: In function 'ath10k_wmi_10_4_op_pull_fw_stats':
drivers/net/wireless/ath/ath10k/wmi.c:3067:18: error: 'num_vdev_stats' undeclared (first use in this function); did you mean 'num_pdev_stats'?
  for (i = 0; i < num_vdev_stats; i++) {
                  ^~~~~~~~~~~~~~
                  num_pdev_stats
drivers/net/wireless/ath/ath10k/wmi.c:3067:18: note: each undeclared identifier is reported only once for each function it appears in
make[5]: *** [drivers/net/wireless/ath/ath10k/wmi.o] Error 1
make[4]: *** [drivers/net/wireless/ath/ath10k] Error 2
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10291063/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
