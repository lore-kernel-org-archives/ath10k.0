Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coREl-0006XQ-0y
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 08:58:25 +0000
MIME-Version: 1.0
Subject: Re: ath10k: remove redundant error check
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170228111439.19546-1-colin.king@canonical.com>
References: <20170228111439.19546-1-colin.king@canonical.com>
Message-ID: <f9f879b23b604117bf434e122146882e@euamsexm01a.eu.qualcomm.com>
Date: Thu, 16 Mar 2017 09:57:51 +0100
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
To: Colin Ian King <colin.king@canonical.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Colin Ian King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on ret for an error is redundant because it is already been
> checked for non-zero earlier on and ret is never non-zero at this point.
> Fix this by removing the redundant check and error message.
> 
> Detected by CoverityScan, CID#1357170 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to ath-next branch of ath.git, thanks.

51f60b8b6979 ath10k: remove redundant error check

-- 
https://patchwork.kernel.org/patch/9595221/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
