Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anQT1-0000U5-Bv
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 12:52:24 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove MSI range support
Date: Tue, 5 Apr 2016 12:51:52 +0000
Message-ID: <87oa9ob4m0.fsf@kamboji.qca.qualcomm.com>
References: <1459426522-25925-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1459426522-25925-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 31 Mar 2016 17:45:22 +0530")
Content-Language: en-US
Content-ID: <D04CF63A63A8A242BEB5740E7DC445D9@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> MSI-X is never well-tested, might contain bugs and generally isn't
> really all that useful to maintain. Also ath10k is mainly used with
> shared/singly-MSI interrupt systems. Hence removing MSI range support.
> This change will be useful for further cleanup in copy engine lock
> and to add NAPI support.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> @@ -171,14 +168,10 @@ struct ath10k_pci {
>  	void __iomem *mem;
>  	size_t mem_len;
>  
> -	/*
> -	 * Number of MSI interrupts granted, 0 --> using legacy PCI line
> -	 * interrupts.
> -	 */
> -	int num_msi_intrs;
> +	/* Operating interrupt mode */
> +	u8 oper_irq_mode;

Shouldn't this be enum ath10k_pci_irq_mode?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
