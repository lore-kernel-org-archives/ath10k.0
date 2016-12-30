Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtHB-00057i-F5
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:15:02 +0000
MIME-Version: 1.0
Subject: Re: ath10k: support dev_coredump for crash dump
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20161221121921.25119.93932.stgit@potku.adurom.net>
References: <20161221121921.25119.93932.stgit@potku.adurom.net>
Message-ID: <ea5cf07e249847d5a4f5078c8f31889e@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:14:34 +0100
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> From: Arun Khandavalli <akhandav@qti.qualcomm.com>
> 
> Whenever firmware crashes, and both CONFIG_ATH10K_DEBUGFS and
> CONFIG_ALLOW_DEV_COREDUMP are enabled, dump information about the crash via a
> devcoredump device. Dump can be read from userspace for further analysis from:
> 
> /sys/class/devcoredump/devcd*/data
> 
> As until now we have provided the firmware crash dump file via fw_crash_dump
> debugfs keep it still available but deprecate and a warning print that the user
> should switch to using dev_coredump.
> 
> Future improvement would be not to depend on CONFIG_ATH10K_DEBUGFS, as there
> might be systems which want to get the firmware crash dump but not enable
> debugfs. How to handle memory consumption is also something which needs to be
> taken into account.
> 
> Signed-off-by: Arun Khandavalli <akhandav@qti.qualcomm.com>
> [kvalo@qca.qualcomm.com: rebase, fixes, improve commit log]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

727000e6af34 ath10k: support dev_coredump for crash dump

-- 
https://patchwork.kernel.org/patch/9482989/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
