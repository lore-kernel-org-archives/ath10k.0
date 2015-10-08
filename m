Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkFCz-0007C7-G5
 for ath10k@lists.infradead.org; Thu, 08 Oct 2015 17:42:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: use pre-allocated DMA buffer in Tx
References: <1443117270-16790-1-git-send-email-poh@qca.qualcomm.com>
 <87fv1lvauk.fsf@kamboji.qca.qualcomm.com>
 <5616A511.5060705@codeaurora.org>
Date: Thu, 8 Oct 2015 20:41:48 +0300
In-Reply-To: <5616A511.5060705@codeaurora.org> (Peter Oh's message of "Thu, 8
 Oct 2015 10:17:05 -0700")
Message-ID: <87fv1ltfz7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Peter Oh <poh@qca.qualcomm.com>

Peter Oh <poh@codeaurora.org> writes:

> Does it happen after you applied copy engine patchset or even without
> the patchset? I saw ath10k_pci_htt_tx_cb in backtrace which is not
> merged to master branch yet. If it only happens after the patchset,
> I'll apply them and look into it if any possibilities are there.

Good point. I thought I was able to reproduce the bug with a clean
master branch, but I now checked the logs and all three cases of this
warning had ath10k_pci_htt_tx_cb in the stack trace. So I must have
accidentally tested with a temporary branch where the pending branch was
merged with master branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
