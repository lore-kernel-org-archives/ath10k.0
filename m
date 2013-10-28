Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vaj1I-0007lH-NC
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 09:21:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: DMAR faults?
References: <5266B204.8030901@candelatech.com>
Date: Mon, 28 Oct 2013 11:21:13 +0200
In-Reply-To: <5266B204.8030901@candelatech.com> (Ben Greear's message of "Tue, 
 22 Oct 2013 10:12:36 -0700")
Message-ID: <8761sheoom.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> Any idea what this means?  The 05:00.0 is the ath10k device...
>
> ath10k_pci 0000:05:00.0: BAR 0: assigned [mem 0xf4400000-0xf45fffff 64bit]
> ath10k: MSI-X interrupt handling (8 intrs)
> dmar: DRHD: handling fault status reg 3
> dmar: DMAR:[DMA Write] Request device [05:00.0] fault addr ffe46000
> DMAR:[fault reason 02] Present bit in context entry is clear

I guess you have iommu enabled? I think that means ath10k device tried
to write to a memory area which was not mapped by the driver.

> ath10k: Hardware name qca988x hw2.0 version 0x4100016c
> ath10k: UART prints disabled
> ath10k: firmware 999.999.0.636 booted
> ath10k: htt target version 2.1
> ath10k: Completion buffers are full

Timestamps would be really useful. How fast did you get that completion
buffers are full message?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
