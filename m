Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diCIH-0008LC-W5
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 04:20:32 +0000
MIME-Version: 1.0
Subject: Re: [2/6] ath10k: refactor firmware crashdump code to coredump.c
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <150278538298.22482.10986802411848917689.stgit@potku.adurom.net>
References: <150278538298.22482.10986802411848917689.stgit@potku.adurom.net>
Message-ID: <ec54c0ff3af546d2a52d75428c38d06b@euamsexm01a.eu.qualcomm.com>
Date: Thu, 17 Aug 2017 06:20:02 +0200
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

> In preparation to add RAM dump support. No functional changes, only moving code
> and renaming function names.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

With only this patch applied, and CONFIG_DEV_COREDUMP disabled, there's a build error:

drivers/net/wireless/ath/ath10k/coredump.c:24:30: error: redefinition of 'ath10k_coredump_new'
drivers/net/wireless/ath/ath10k/coredump.c:130:5: error: redefinition of 'ath10k_coredump_submit'

-- 
https://patchwork.kernel.org/patch/9901243/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
