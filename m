Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cpz9M-0000vP-S2
 for ath10k@lists.infradead.org; Mon, 20 Mar 2017 15:23:15 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix warnings from an earlier commit
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <148965546273.3007.5273967631982279383.stgit@potku.adurom.net>
References: <148965546273.3007.5273967631982279383.stgit@potku.adurom.net>
Message-ID: <1569c6bba3bc400c9800e036c3731b9c@euamsexm01a.eu.qualcomm.com>
Date: Mon, 20 Mar 2017 16:22:46 +0100
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
> I failed to notice that commit 523f6701dbab ("ath10k: update available channel
> list for 5G radio") added two new warnings:
> 
> drivers/net/wireless/ath/ath10k/mac.c:3129:6: warning: symbol 'ath10k_mac_update_channel_list' was not declared. Should it be static?
> drivers/net/wireless/ath/ath10k/mac.c:3170: Alignment should match open parenthesis
> 
> Fix those.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

46bc92bedbd3 ath10k: fix warnings from an earlier commit

-- 
https://patchwork.kernel.org/patch/9627713/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
