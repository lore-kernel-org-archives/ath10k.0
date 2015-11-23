Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vha-0005dE-FP
 for ath10k@lists.infradead.org; Mon, 23 Nov 2015 18:18:59 +0000
Subject: Re: [PATCH 2/2] ath10k: do not use coherent memory for tx buffers
References: <1448284729-98078-1-git-send-email-nbd@openwrt.org>
 <1448284729-98078-2-git-send-email-nbd@openwrt.org>
 <56534C01.8030407@codeaurora.org>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <56535875.2080204@openwrt.org>
Date: Mon, 23 Nov 2015 19:18:29 +0100
MIME-Version: 1.0
In-Reply-To: <56534C01.8030407@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>, ath10k@lists.infradead.org

On 2015-11-23 18:25, Peter Oh wrote:
> Hi,
> 
> Have you measured the peak throughput?
> The pre-allocated coherent memory concept was introduced as once of peak 
> throughput improvement.
It's all still pre-allocated and pre-mapped.

> IIRC, dma_map_single takes about 4 us on Cortex A7 and dma_unmap_single 
> also takes time to invalid cache.
That's why I didn't put a map/unmap in the hot path. There is only a
cache sync there. With coherent memory, every single word access blocks
until the transaction is complete. With cached/mapped memory, the CPU
can fill the cachelines first, then flush it in one go. This usually
ends up being faster than working with coherent memory directly.

> Please share your tput number before and after, so I don't need to worry 
> about performance degrade.
I don't have an ideal setup for tput tests at the moment, so I can't
give you any numbers. However, on the device that I'm testing on
(IPQ806x based), this patch makes the difference between working and
non-working wifi, fixing the regression introduced by your pre-allocated
coherent memory patch.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
