Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebSHT-0000wC-10
 for ath10k@lists.infradead.org; Tue, 16 Jan 2018 14:32:09 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add sanity check to ie_len before parsing fw/board ie
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1515455461-19286-1-git-send-email-ryanhsu@codeaurora.org>
References: <1515455461-19286-1-git-send-email-ryanhsu@codeaurora.org>
Message-Id: <20180116143152.31ADC60854@smtp.codeaurora.org>
Date: Tue, 16 Jan 2018 14:31:52 +0000 (UTC)
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
To: ryanhsu@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@codeaurora.org wrote:

> Validate ie_len after the alignment padding before access the buffer
> to avoid potential overflow.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9ed4f9162873 ath10k: add sanity check to ie_len before parsing fw/board ie

-- 
https://patchwork.kernel.org/patch/10150769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
