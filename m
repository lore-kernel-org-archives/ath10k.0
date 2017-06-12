Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKQhF-00012p-3i
 for ath10k@lists.infradead.org; Mon, 12 Jun 2017 14:52:02 +0000
MIME-Version: 1.0
Subject: Re: [v2,3/3] ath10k: Set rxnss_override for QCA9888
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170609110750.14950-3-sven.eckelmann@openmesh.com>
References: <20170609110750.14950-3-sven.eckelmann@openmesh.com>
Message-ID: <1d5e14706f0f467d808e881e0ab42082@eusanexr01a.eu.qualcomm.com>
Date: Mon, 12 Jun 2017 07:51:36 -0700
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:

> QCA9888 supports VHT80 with 2x2. But it only support 1x1 with VHT160 or
> VHT80+80. Inform userspace and the the QCA firmware about that limitation
> whenever VHT80+80 or VHT160 is configured.
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This also had similar warnings, fixed in pending branch:

drivers/net/wireless/ath/ath10k/mac.c:4444:52: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/mac.c:4444:52:    expected restricted __le16 [assigned] [usertype] rx_highest
drivers/net/wireless/ath/ath10k/mac.c:4444:52:    got int
drivers/net/wireless/ath/ath10k/mac.c:4445:52: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/mac.c:4445:52:    expected restricted __le16 [assigned] [usertype] tx_highest
drivers/net/wireless/ath/ath10k/mac.c:4445:52:    got int


-- 
https://patchwork.kernel.org/patch/9778089/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
