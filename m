Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eU8qP-0001rr-Kk
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 10:21:56 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/6] ath10k: remove deprecated fw_crash_dump debugfs file
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <151394990944.9382.5479713630153339961.stgit@potku.adurom.net>
References: <151394990944.9382.5479713630153339961.stgit@potku.adurom.net>
Message-ID: <653962c19c4c4f72a4aa11672c4f2973@euamsexm01a.eu.qualcomm.com>
Date: Wed, 27 Dec 2017 11:21:37 +0100
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

> The fw_crash_dump file was deprecated by commmit 727000e6af34 ("ath10k: support
> dev_coredump for crash dump") in v4.11 in favor of dev_coredump interface,
> remove it now for good. Everyone should use dev_coredump now.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

6 patches applied to ath-next branch of ath.git, thanks.

d333bdd9b065 ath10k: remove deprecated fw_crash_dump debugfs file
f25b9f285a0e ath10k: refactor firmware crashdump code to coredump.c
e2fcf60c6fe8 ath10k: detach coredump.c from debug.c
5c9d0a20202b ath10k: add coredump_mask module parameter
703f261dd77f ath10k: add memory dump support for QCA6174/QCA9377
1a8e5c618bfa ath10k: add memory dump support QCA988X

-- 
https://patchwork.kernel.org/patch/10130491/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
