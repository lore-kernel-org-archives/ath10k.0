Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXAtk-0003hO-4E
 for ath10k@lists.infradead.org; Fri, 27 Jan 2017 18:05:22 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: remove multiple defines of DIAG_TRANSFER_LIMIT
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
Message-ID: <10e75338551b4824b607cd630521b2f0@eusanexr01a.eu.qualcomm.com>
Date: Fri, 27 Jan 2017 10:04:54 -0800
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> DIAG_TRANSFER_LIMIT is redefined with same value and comments
> just below this entry, remove this duplicate entry.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

3 patches applied to ath-next branch of ath.git, thanks.

dd51fa3d8a1d ath10k: remove multiple defines of DIAG_TRANSFER_LIMIT
0de4df5ba2ad ath10k: use dma_zalloc_coherent()
1ad38fd719da ath10k: fix typo in addr calculation

-- 
https://patchwork.kernel.org/patch/9532691/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
