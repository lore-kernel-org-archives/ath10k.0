Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bs3Fj-00065O-Qp
 for ath10k@lists.infradead.org; Thu, 06 Oct 2016 07:38:04 +0000
Date: Thu, 6 Oct 2016 13:07:30 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [1/2] ath10k: clean up HTT tx buffer allocation and free
Message-ID: <20161006073730.GA6601@atheros-ThinkPad-T61>
References: <1475584772-4091-2-git-send-email-mohammed@qca.qualcomm.com>
 <dc6b3afe60574d7bb60e1913da3f1ad4@euamsexm01a.eu.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc6b3afe60574d7bb60e1913da3f1ad4@euamsexm01a.eu.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

On Thu, Oct 06, 2016 at 09:31:41AM +0200, Kalle Valo wrote:
> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > 
> > cleanup 'ath10k_htt_tx_alloc' by introducing the API's
> > 'ath10k_htt_tx_alloc/free_{cont_txbuf, txdone_fifo} and
> > re-use them whereever needed
> > 
> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Patch 1 doesn't apply and the conflict was not trivial

[shafi] oops will rebase it, not sure how i missed it :-(

> 
> error: patch failed: drivers/net/wireless/ath/ath10k/htt_tx.c:388
> error: drivers/net/wireless/ath/ath10k/htt_tx.c: patch does not apply
> stg import: Diff does not apply cleanly
> error: patch failed: drivers/net/wireless/ath/ath10k/htt_tx.c:283
> error: drivers/net/wireless/ath/ath10k/htt_tx.c: patch does not apply
> stg import: Diff does not apply cleanly
> 
> 2 patches set to Changes Requested.
> 
> 9361741 [1/2] ath10k: clean up HTT tx buffer allocation and free
> 9361743 [2/2] ath10k: Remove extraneous error message in tx alloc
> 
> -- 
> https://patchwork.kernel.org/patch/9361741/
> 
> Documentation about submitting wireless patches and checking status
> from patchwork:
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
