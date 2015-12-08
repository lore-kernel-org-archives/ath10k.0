Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6JfT-0003Rk-AS
 for ath10k@lists.infradead.org; Tue, 08 Dec 2015 14:55:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: do not use coherent memory for allocated
 device memory chunks
References: <1448908321-3042-1-git-send-email-nbd@openwrt.org>
Date: Tue, 8 Dec 2015 16:54:27 +0200
In-Reply-To: <1448908321-3042-1-git-send-email-nbd@openwrt.org> (Felix
 Fietkau's message of "Mon, 30 Nov 2015 19:32:01 +0100")
Message-ID: <87si3d9ejg.fsf@kamboji.qca.qualcomm.com>
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
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Felix Fietkau <nbd@openwrt.org> writes:

> Coherent memory is more expensive to allocate (and constrained on some
> architectures where it has to be pre-allocated). It is also completely
> unnecessary, since the host has no reason to even access these allocated
> memory spaces
>
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
