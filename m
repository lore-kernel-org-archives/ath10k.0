Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eU8d7-0003OQ-EB
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 10:08:17 +0000
MIME-Version: 1.0
Subject: Re: [01/10] ath10k: Add hw param for 64-bit address support
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1513846859-23639-2-git-send-email-govinds@qti.qualcomm.com>
References: <1513846859-23639-2-git-send-email-govinds@qti.qualcomm.com>
Message-ID: <b76f2a5377bf41aaa386645b432a2177@euamsexm01a.eu.qualcomm.com>
Date: Wed, 27 Dec 2017 11:07:52 +0100
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
To: Govind Singh <govinds@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@qti.qualcomm.com>

Govind Singh <govinds@qti.qualcomm.com> wrote:

> WCN3990 target supports 37-bit addressing mode. In order
> to accommodate extended address support, add hw param to
> indicate if the target supports addressing above 32-bits.
> 
> Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
> Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

10 patches applied to ath-next branch of ath.git, thanks.

f13cc6bd68ba ath10k: Add hw param for 64-bit address support
e3def6f7ddf8 ath10k: Update rx descriptor for WCN3990 target
3b0b55b19d1d ath10k: Add support for 64 bit HTT in-order indication msg
9abe68535ad8 ath10k: Add support for 64 bit htt rx ring cfg
71ad70961093 ath10k: Add support for 64 bit HTT frag descriptor
e62ee5c381c5 ath10k: Add support for htt_data_tx_desc_64 descriptor
bb8d0d15fc6a ath10k: Add hw param for rx ring size support
a91a626baa15 ath10k: Add paddrs_ring_64 support for 64bit target
5dac5f3772f6 ath10k: Use dma_addr_t for ce buffers to support 64bit target
2a1e1ad3fd37 ath10k: Add support for 64 bit ce descriptor

-- 
https://patchwork.kernel.org/patch/10127165/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
