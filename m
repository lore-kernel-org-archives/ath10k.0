Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3Lie-00018R-So
 for ath10k@lists.infradead.org; Mon, 30 Nov 2015 10:30:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: do not use coherent memory for allocated
 device memory chunks
References: <1448284729-98078-1-git-send-email-nbd@openwrt.org>
Date: Mon, 30 Nov 2015 12:29:31 +0200
In-Reply-To: <1448284729-98078-1-git-send-email-nbd@openwrt.org> (Felix
 Fietkau's message of "Mon, 23 Nov 2015 14:18:48 +0100")
Message-ID: <87wpszkcfo.fsf@kamboji.qca.qualcomm.com>
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

I see a new compiler warning:

drivers/net/wireless/ath/ath10k/wmi.c: In function
'ath10k_wmi_event_service_ready_work':
drivers/net/wireless/ath/ath10k/wmi.c:4347:30: warning: 'pool_size' may
be used uninitialized in this function [-Wuninitialized]
drivers/net/wireless/ath/ath10k/wmi.c:4319:6: note: 'pool_size' was
declared here

Seems to be false and maybe because my gcc is pretty old:

gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3

But anyway it would be nice if this can be avoided.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
