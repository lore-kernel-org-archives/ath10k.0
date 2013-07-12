Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxV9Q-0008GI-4q
 for ath10k@lists.infradead.org; Fri, 12 Jul 2013 04:40:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: ATH10K should depend on HAS_DMA
References: <1373490216-12437-1-git-send-email-geert@linux-m68k.org>
 <1373490216-12437-3-git-send-email-geert@linux-m68k.org>
Date: Fri, 12 Jul 2013 07:39:39 +0300
In-Reply-To: <1373490216-12437-3-git-send-email-geert@linux-m68k.org> (Geert
 Uytterhoeven's message of "Wed, 10 Jul 2013 23:03:36 +0200")
Message-ID: <87txk04cj8.fsf@kamboji.qca.qualcomm.com>
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> If NO_DMA=y:
>
> drivers/built-in.o: In function `ath10k_skb_unmap':
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
> drivers/built-in.o: In function `ath10k_skb_map':
> drivers/net/wireless/ath/ath10k/core.h:83: undefined reference to `dma_map_single'
> drivers/net/wireless/ath/ath10k/core.h:86: undefined reference to `dma_mapping_error'
> drivers/built-in.o: In function `ath10k_htt_rx_ring_free':
> drivers/net/wireless/ath/ath10k/htt_rx.c:113: undefined reference to `dma_unmap_single'
> drivers/built-in.o: In function `ath10k_htt_rx_amsdu_pop':
> drivers/net/wireless/ath/ath10k/htt_rx.c:296: undefined reference to `dma_unmap_single'
> drivers/net/wireless/ath/ath10k/htt_rx.c:389: undefined reference to `dma_unmap_single'
> drivers/built-in.o: In function `__ath10k_htt_rx_ring_fill_n':
> drivers/net/wireless/ath/ath10k/htt_rx.c:146: undefined reference to `dma_map_single'
> drivers/net/wireless/ath/ath10k/htt_rx.c:150: undefined reference to `dma_mapping_error'
> drivers/built-in.o: In function `ath10k_htt_rx_attach':
> drivers/net/wireless/ath/ath10k/htt_rx.c:474: undefined reference to `dma_alloc_coherent'
> drivers/net/wireless/ath/ath10k/htt_rx.c:509: undefined reference to `dma_free_coherent'
> drivers/net/wireless/ath/ath10k/htt_rx.c:514: undefined reference to `dma_free_coherent'
> drivers/built-in.o: In function `ath10k_htt_rx_detach':
> drivers/net/wireless/ath/ath10k/htt_rx.c:220: undefined reference to `dma_unmap_single'
> drivers/net/wireless/ath/ath10k/htt_rx.c:228: undefined reference to `dma_free_coherent'
> drivers/built-in.o: In function `ath10k_skb_map':
> drivers/net/wireless/ath/ath10k/core.h:83: undefined reference to `dma_map_single'
> drivers/net/wireless/ath/ath10k/core.h:86: undefined reference to `dma_mapping_error'
> drivers/built-in.o: In function `ath10k_skb_unmap':
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
> drivers/built-in.o: In function `ath10k_skb_map':
> drivers/net/wireless/ath/ath10k/core.h:83: undefined reference to `dma_map_single'
> drivers/net/wireless/ath/ath10k/core.h:86: undefined reference to `dma_mapping_error'
> drivers/net/wireless/ath/ath10k/core.h:83: undefined reference to `dma_map_single'
> drivers/net/wireless/ath/ath10k/core.h:86: undefined reference to `dma_mapping_error'
> drivers/built-in.o: In function `ath10k_skb_unmap':
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
> drivers/net/wireless/ath/ath10k/core.h:98: undefined reference to `dma_unmap_single'
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-wireless@vger.kernel.org

Thanks, I'll take this and send forward.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
