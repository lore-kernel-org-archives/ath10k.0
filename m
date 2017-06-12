Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKROT-0008Ut-Mr
 for ath10k@lists.infradead.org; Mon, 12 Jun 2017 15:37:08 +0000
MIME-Version: 1.0
Subject: Re: [v3] ath10k: Define structures for CE ctrl/misc register
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1496739941-18132-1-git-send-email-c_sgarna@qti.qualcomm.com>
References: <1496739941-18132-1-git-send-email-c_sgarna@qti.qualcomm.com>
Message-ID: <a383aa68b0c744e186e0b7e98b78446b@eusanexr01a.eu.qualcomm.com>
Date: Mon, 12 Jun 2017 08:36:17 -0700
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
To: Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com> wrote:

> Define structures for the copy engine ctrl/misc registers,
> that includes CE CMD halt, watermark source, watermark destination,
> host IE ring, source, destination and dmax ring.
> 
> This adds support to avoid the conditional compilation,
> code optimization and dynamic configuration of the copy engine
> register map for respective hardware bus interface.
> 
> Signed-off-by: Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Like kbuild test robot reported, this failed to build. I fixed it like this in
ahb.c in pending branch:

	ar_pci->bus_ops = &ath10k_ahb_bus_ops;

-- 
https://patchwork.kernel.org/patch/9768317/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
