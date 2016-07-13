Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNNvi-0008Hu-JO
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 17:26:42 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: Anyone brought up 9984 NIC on x86-64?
Date: Wed, 13 Jul 2016 17:26:09 +0000
Message-ID: <1468430769350.75672@qti.qualcomm.com>
References: <578673DA.1010907@candelatech.com>
In-Reply-To: <578673DA.1010907@candelatech.com>
Content-Language: en-US
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
To: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

> I added a few patches to my 4.7 kernel to enable ath10k to load for 9984,
> but it immediately crashes due to IOMMU error when trying to allocate
> memory.
> 
> I'm building the latest linux-ath tree now and will test that when it
> is done, but I am curious to know if anyone has successfully booted
> 9984 on x86-64?
> 
Ben,

Are you seeing IOMMU error even after wtih your DMA_BIDIRECTIONAL change? Could you please try with

https://patchwork.kernel.org/patch/9175029/

But increase WMI_MAX_MEM_CHUNK_SIZE to 512.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
