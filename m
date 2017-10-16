Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e49eb-0003zF-C2
 for ath10k@lists.infradead.org; Mon, 16 Oct 2017 17:58:19 +0000
Subject: Re: [PATCHv3 2/2] ath10k: Allow setting coverage class
References: <20160825132522.30994-1-benjamin@sipsolutions.net>
 <20160825132522.30994-3-benjamin@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <6cbadf5a-4289-640c-eb46-694a7da8ea44@candelatech.com>
Date: Mon, 16 Oct 2017 10:57:51 -0700
MIME-Version: 1.0
In-Reply-To: <20160825132522.30994-3-benjamin@sipsolutions.net>
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
To: Benjamin Berg <benjamin@sipsolutions.net>, ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Simon Wunderlich <sw@simonwunderlich.de>

On 08/25/2016 06:25 AM, Benjamin Berg wrote:
> Unfortunately ath10k does not generally allow modifying the coverage class
> with the stock firmware and Qualcomm has so far refused to implement this
> feature so that it can be properly supported in ath10k. If we however know
> the registers that need to be modified for proper operation with a higher
> coverage class, then we can do these modifications from the driver.
>
> This patch implements this hack for first generation cards which are based
> on a core that is similar to ath9k. The registers are modified in place and
> need to be re-written every time the firmware sets them. To achieve this
> the register status is verified after certain WMI events from the firmware.
>
> The coverage class may not be modified temporarily right after the card
> re-initializes the registers. This is for example the case during scanning.
>
> Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
> working on a userspace support for this. This patch wouldn't have been
> possible without this documentation.

Hello,

Do you happen to know the maximum distance that can work with this
patch enabled?  The register value maximum seems to be 0x3FFF, but I
am not sure of the units (nor how exactly that applies to distance).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
