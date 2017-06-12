Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKQdi-00061k-Q7
 for ath10k@lists.infradead.org; Mon, 12 Jun 2017 14:48:25 +0000
MIME-Version: 1.0
Subject: Re: [v2,2/3] ath10k: Configure rxnss_override for 10.4 firmware.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170609110750.14950-2-sven.eckelmann@openmesh.com>
References: <20170609110750.14950-2-sven.eckelmann@openmesh.com>
Message-ID: <6eeaab36e33747e3ac057888070acb2b@eusanexr01a.eu.qualcomm.com>
Date: Mon, 12 Jun 2017 07:47:57 -0700
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:

> QCA9984 hardware can do 4x4 at 80Mhz, but only 2x2 at 160Mhz.
> 
> First, report this to user-space by setting the max-tx-speed
> and max-rx-speed vht capabilities.
> 
> Second, if the peer rx-speed is configured, and if we
> are in 160 or 80+80 mode, and the peer rx-speed matches
> the max speed for 2x2 or 1x1 at 160Mhz (long guard interval),
> then use that info to set the peer_bw_rxnss_override appropriately.
> 
> Without this, a 9984 firmware will not use 2x2 ratesets when
> transmitting to peer (it will be stuck at 1x1), because
> the firmware would not have configured the rxnss_override.
> 
> This could use some testing....
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> [sven.eckelmann@openmesh.com: rebase, cleanup, drop 160Mhz workaround cleanup]
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

This one had warnings, fixed in pending branch:

drivers/net/wireless/ath/ath10k/mac.c:4436:52: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/mac.c:4436:52:    expected restricted __le16 [assigned] [usertype] rx_highest
drivers/net/wireless/ath/ath10k/mac.c:4436:52:    got int
drivers/net/wireless/ath/ath10k/mac.c:4437:52: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/mac.c:4437:52:    expected restricted __le16 [assigned] [usertype] tx_highest
drivers/net/wireless/ath/ath10k/mac.c:4437:52:    got int

-- 
https://patchwork.kernel.org/patch/9778087/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
