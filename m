Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGFyT-000768-Ns
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 23:55:14 +0000
Message-ID: <54C824DC.5080804@qca.qualcomm.com>
Date: Tue, 27 Jan 2015 15:53:00 -0800
From: Peter Oh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost>
In-Reply-To: <20150127213349.GA24933@localhost>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On 01/27/2015 01:33 PM, Bob Copeland wrote:
> On Mon, Jan 26, 2015 at 02:25:18PM -0800, Peter Oh wrote:
>> Using ioread() to perform data sync is excessive.
>> Use compact API, wmb(), that intended to be used for the case.
>> It reduces total 14 CPU clocks per interrupt.
> Hi,
>
>>   	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
>>   			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
>>   
>> -	/* IMPORTANT: this extra read transaction is required to
>> -	 * flush the posted write buffer. */
>> -	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
>> -				PCIE_INTR_ENABLE_ADDRESS);
>> +	/* invoke data sync barrier */
>> +	wmb();
>>   }
> I am no expert in arcane PCI matters, but that looks suspicious to me.  I seem
> to recall wmb() only enforced ordering, and maybe not even memory-IO ordering
> on all platforms.  If you want to disable an irq, it really seems like you
> would want to flush posted writes so you know the hardware has seen it.
enforced ordering is happened by flush write buffer and wmb is commonly 
used to flush write buffer.
so that wmb guarantees ordering by flush write buffer. That's why it's 
called a memory barrier.
when wmb is used, it guarantees all memory accesses complete before wmb 
command completes.
for instance dsb is the corresponding command for wmb in arm and arm 
instruction guide says
"The DSB instruction completes when all explicit memory accesses before 
it complete."
Which means DSB instruction will hold the bus (usually AXI bus) and 
never returns until any memory or memory mapped I/O access complete
(dsb is for ARM and other platforms have the equivalent instruction such 
as sfence, sync, mf, and dcs).
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
