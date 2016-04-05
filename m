Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anR9y-0000wH-Up
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 13:36:49 +0000
MIME-Version: 1.0
Date: Tue, 05 Apr 2016 19:06:25 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] ath10k: remove MSI range support
In-Reply-To: <87oa9ob4m0.fsf@kamboji.qca.qualcomm.com>
References: <1459426522-25925-1-git-send-email-rmanohar@qti.qualcomm.com>
 <87oa9ob4m0.fsf@kamboji.qca.qualcomm.com>
Message-ID: <be237b11cdc2472b67a1fd58e7860938@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2016-04-05 18:21, Valo, Kalle wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
>> MSI-X is never well-tested, might contain bugs and generally isn't
>> really all that useful to maintain. Also ath10k is mainly used with
>> shared/singly-MSI interrupt systems. Hence removing MSI range support.
>> This change will be useful for further cleanup in copy engine lock
>> and to add NAPI support.
>> 
>> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> 
> [...]
> 
>> @@ -171,14 +168,10 @@ struct ath10k_pci {
>>  	void __iomem *mem;
>>  	size_t mem_len;
>> 
>> -	/*
>> -	 * Number of MSI interrupts granted, 0 --> using legacy PCI line
>> -	 * interrupts.
>> -	 */
>> -	int num_msi_intrs;
>> +	/* Operating interrupt mode */
>> +	u8 oper_irq_mode;
> 
> Shouldn't this be enum ath10k_pci_irq_mode?

Yes.. Then the enum should be moved to pci.h. will send next version

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
