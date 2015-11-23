Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vxP-0000UR-9w
 for ath10k@lists.infradead.org; Mon, 23 Nov 2015 18:35:19 +0000
Subject: Re: [PATCH 2/2] ath10k: do not use coherent memory for tx buffers
References: <1448284729-98078-1-git-send-email-nbd@openwrt.org>
 <1448284729-98078-2-git-send-email-nbd@openwrt.org>
 <56534C01.8030407@codeaurora.org> <5653549B.8090503@dd-wrt.com>
 <56535A23.3020804@codeaurora.org>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <56535C4D.1010703@openwrt.org>
Date: Mon, 23 Nov 2015 19:34:53 +0100
MIME-Version: 1.0
In-Reply-To: <56535A23.3020804@codeaurora.org>
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

On 2015-11-23 19:25, Peter Oh wrote:
> 
> On 11/23/2015 10:02 AM, Sebastian Gottschall wrote:
>> Am 23.11.2015 um 18:25 schrieb Peter Oh:
>>> Hi,
>>>
>>> Have you measured the peak throughput?
>>> The pre-allocated coherent memory concept was introduced as once of 
>>> peak throughput improvement.
>>> IIRC, dma_map_single takes about 4 us on Cortex A7 and 
>>> dma_unmap_single also takes time to invalid cache.
>>> Please share your tput number before and after, so I don't need to 
>>> worry about performance degrade.
>> yes. and this concept fucks up the qualcom ipq806x platform (which has 
>> by default 2 QCA99XX cards). it does not work, since the preallocated 
>> concept allocates too much memory
> Can you specify the number that you're seeing?
> The tx buffer descriptor uses 56KB, so it would require 64KB x 2 slab 
> for 2 cards which is 128KB.
> Are you saying your system does not work because of this 128KB usage?
The reason might be the GFP_DMA flag, which is unnecessary.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
