Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpBPx-0003hl-JW
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 09:44:49 +0000
MIME-Version: 1.0
Subject: Re: [-next] ath10k: fix error return code in ahb
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1474031135-6963-1-git-send-email-weiyj.lk@gmail.com>
References: <1474031135-6963-1-git-send-email-weiyj.lk@gmail.com>
Message-ID: <65bd7c68b413408cbb37dd2ff152d423@euamsexm01a.eu.qualcomm.com>
Date: Wed, 28 Sep 2016 11:44:16 +0200
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
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>, ath10k@lists.infradead.org

Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fix to return a negative error code from the error handling case
> instead of 0, as done elsewhere in function ath10k_ahb_probe() or
> ath10k_ahb_resource_init().
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied to ath-next branch of ath.git, thanks.

931eb6b7fee3 ath10k: fix error return code in ahb

-- 
https://patchwork.kernel.org/patch/9335759/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
