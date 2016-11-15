Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6fJd-0002lx-If
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 15:06:30 +0000
MIME-Version: 1.0
Subject: Re: [v3,1/2] ath10k: clean up HTT tx buffer allocation and free
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1476278778-4253-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1476278778-4253-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <b46170abfbc548458e6be817f9d31079@euamsexm01a.eu.qualcomm.com>
Date: Tue, 15 Nov 2016 16:06:02 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> cleanup 'ath10k_htt_tx_alloc' by introducing the API's
> 'ath10k_htt_tx_alloc/free_{cont_txbuf, txdone_fifo} and
> re-use them whereever needed
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

19f338c6eb0c ath10k: clean up HTT tx buffer allocation and free
f004e532a80a ath10k: remove extraneous error message in tx alloc

-- 
https://patchwork.kernel.org/patch/9373055/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
