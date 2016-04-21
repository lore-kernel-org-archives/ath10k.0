Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1atGKb-0002DK-Po
 for ath10k@lists.infradead.org; Thu, 21 Apr 2016 15:15:50 +0000
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5718EE7A.4030503@candelatech.com>
Date: Thu, 21 Apr 2016 08:15:06 -0700
MIME-Version: 1.0
In-Reply-To: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 04/21/2016 06:17 AM, Kalle Valo wrote:
> From: Johannes Berg <johannes.berg@intel.com>
>
> According to the spec, VHT doesn't exist in 2.4GHz.
>
> There are vendor extensions to allow a subset of VHT to work
> (notably 256-QAM), but since mac80211 doesn't support those
> advertising VHT capability on 2.4GHz leads to the behaviour
> of reporting VHT capabilities but not being able to use any
> of them due to mac80211's code requiring 80 MHz support.
>
> Remove the VHT capabilities from 2.4GHz for now. If mac80211
> gets extended to use the (likely Broadcom) vendor IEs for it
> and handles the lack of 80 MHz support, it can be added back.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

The thing is, it actually works just fine with the patch I posted
to fix mac80211, and at any rate, even if the mac80211 patch isn't
applied, the ath10k driver works just fine in HT mode.

Have you actually found any case where the existing behaviour causes
a real problem?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
