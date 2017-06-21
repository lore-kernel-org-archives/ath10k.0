Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNfWo-0007i4-VM
 for ath10k@lists.infradead.org; Wed, 21 Jun 2017 13:18:41 +0000
MIME-Version: 1.0
Subject: Re: [v2,
 1/3] ath10k: Use complete VHT chan width for 160MHz workaround
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
References: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
Message-ID: <afa6ec98d286450687ed30267026d7a8@euamsexm01a.eu.qualcomm.com>
Date: Wed, 21 Jun 2017 15:18:09 +0200
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

> The ath10k firmware doesn't announce its VHT channel width capabilities in
> the vht_cap information from the "service ready event" arguments. The
> driver must therefore check whether the 160MHz short GI bit is set and
> whether the driver still doesn't set the bits for the 160/80+80 MHz
> capabilities.
> 
> The two bits for the channel width are a two bit integer and not two
> separate bits which cannot be parsed without the knowledge of the other
> bit. Using IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ (b10..) as a
> mask for this task doesn't make any sense. The correct mask for the VHT
> channel width should be used instead to make this check more readable.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> [sven.eckelmann@openmesh.com: separate 160Mhz workaround cleanup, add commit
>  message]
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

3 patches applied to ath-next branch of ath.git, thanks.

e509e5947708 ath10k: use complete VHT chan width for 160MHz workaround
cc914a55006e ath10k: configure rxnss_override for QCA9984
6824834946a6 ath10k: set rxnss_override for QCA9888

-- 
https://patchwork.kernel.org/patch/9778085/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
