Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8Ty0-0007pv-3R
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 14:51:25 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix diag_read to collect data for larger memory
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1464187154-26687-1-git-send-email-arnagara@qti.qualcomm.com>
Message-ID: <8d461713b1d345ebb4e04fb5f6ba44be@euamsexm01a.eu.qualcomm.com>
Date: Thu, 2 Jun 2016 16:50:56 +0200
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, arnagara@codeaurora.org, ath10k@lists.infradead.org

Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> wrote:
> diag_read uses dma_alloc_coherent to allocate memory requested by the
> caller. If this memory requested is larger, more than DIAG_TRANSFER_LIMIT
> (2K), then it is likely that we may not get the requested memory and we
> would fail.
> 
> To solve this, request dma_alloc_coherent for only DIAG_TRANSFER_LIMIT, and
> reuse this buffer multiple times as needed to copy the data requested in
> smaller chunks of size not more than DIAG_TRANSFER_LIMIT. Previously we
> were reading into the caller's only after getting the complete requested
> data.
> 
> Fixes: 68c03249f388 ('ath10k: convert pci_alloc_consistent() to dma_alloc_coherent()')
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

Thanks, 1 patch applied to ath.git:

1e56d5127d5c ath10k: fix diag_read to collect data for larger memory

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9135561/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
