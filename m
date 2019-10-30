Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPhHp-0005YD-L0
 for ath10k@lists.infradead.org; Wed, 30 Oct 2019 06:16:54 +0000
MIME-Version: 1.0
Date: Wed, 30 Oct 2019 14:16:51 +0800
From: zhichen@codeaurora.org
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
In-Reply-To: <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
 <d6cfd945-7bab-a01d-0157-e0e1802f66e3@eero.com>
Message-ID: <8c6d531f6474faf4df55f90185466774@codeaurora.org>
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
To: Peter Oh <peter.oh@eero.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-10-23 01:16, Peter Oh wrote:
> 
> How can you say value 0 (I believe it's 64 bytes) DMA burst size
> causes the symptom and 1 fixes it?
> 
> Peter

Confirmed from HW team that the configuration controls AXI burst size of 
the RD/WR access to the HOST MEM.
0-	No split , RAW read/write transfer size from MAC is put out on bus as 
burst length.
1-	Split at 256 byte boundary
2,3- Reserved

That's why we see issue with value 0.

Zhi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
