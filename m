Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1borHq-0004mN-Bs
 for ath10k@lists.infradead.org; Tue, 27 Sep 2016 12:15:02 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: use devm_clk_get() instead of clk_get()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1473165598-28683-2-git-send-email-yamada.masahiro@socionext.com>
References: <1473165598-28683-2-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <e4a0ff1bec4b4e88b61c88988a7683d6@euamsexm01a.eu.qualcomm.com>
Date: Tue, 27 Sep 2016 14:14:33 +0200
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>

Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> Use the managed variant of clk_get() to simplify the failure path
> and the .remove callback.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

3 patches applied to ath-next branch of ath.git, thanks.

828662753d60 ath10k: use devm_clk_get() instead of clk_get()
c5d8a34675d9 ath10k: use devm_reset_control_get() instead of reset_control_get()
65901a9e7058 ath10k: do not check if reset is NULL

-- 
https://patchwork.kernel.org/patch/9316579/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
