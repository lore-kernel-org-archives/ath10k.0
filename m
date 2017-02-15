Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdvrw-00014O-6m
 for ath10k@lists.infradead.org; Wed, 15 Feb 2017 09:27:26 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Configure rxnss_override for 10.4 firmware.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1486771745-15150-1-git-send-email-greearb@candelatech.com>
References: <1486771745-15150-1-git-send-email-greearb@candelatech.com>
Message-ID: <e379002d2a6a4563baefb435b4552586@eusanexr01a.eu.qualcomm.com>
Date: Wed, 15 Feb 2017 01:26:58 -0800
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
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

Does not apply:

error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:2760
error: drivers/net/wireless/ath/ath10k/mac.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath10k/wmi.h:6173
error: drivers/net/wireless/ath/ath10k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/9567655/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
