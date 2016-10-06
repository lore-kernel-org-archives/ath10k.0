Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bs3A1-0003w1-6E
 for ath10k@lists.infradead.org; Thu, 06 Oct 2016 07:32:11 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: clean up HTT tx buffer allocation and free
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1475584772-4091-2-git-send-email-mohammed@qca.qualcomm.com>
References: <1475584772-4091-2-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <dc6b3afe60574d7bb60e1913da3f1ad4@euamsexm01a.eu.qualcomm.com>
Date: Thu, 6 Oct 2016 09:31:41 +0200
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

Patch 1 doesn't apply and the conflict was not trivial

error: patch failed: drivers/net/wireless/ath/ath10k/htt_tx.c:388
error: drivers/net/wireless/ath/ath10k/htt_tx.c: patch does not apply
stg import: Diff does not apply cleanly
error: patch failed: drivers/net/wireless/ath/ath10k/htt_tx.c:283
error: drivers/net/wireless/ath/ath10k/htt_tx.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

9361741 [1/2] ath10k: clean up HTT tx buffer allocation and free
9361743 [2/2] ath10k: Remove extraneous error message in tx alloc

-- 
https://patchwork.kernel.org/patch/9361741/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
