Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSShU-0005Qy-Vl
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 17:32:57 +0000
Subject: Re: [PATCH] ath10k: Allow setting coverage class
References: <1469608424-11370-1-git-send-email-benjamin@sipsolutions.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5798EEC3.5040008@candelatech.com>
Date: Wed, 27 Jul 2016 10:26:27 -0700
MIME-Version: 1.0
In-Reply-To: <1469608424-11370-1-git-send-email-benjamin@sipsolutions.net>
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
To: Benjamin Berg <benjamin@sipsolutions.net>, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Simon Wunderlich <sw@simonwunderlich.de>

On 07/27/2016 01:33 AM, Benjamin Berg wrote:
> Unfortunately ath10k does not generally allow modifying the coverage class
> with the stock firmware and Qualcomm has so far refused to implement this
> feature so that it can be properly supported in ath10k. If we however know
> the registers that need to be modified for proper operation with a higher
> coverage class, then we can do these modifications from the driver.
>
> This patch implements this hack for first generation cards which are based
> on a core that is similar to ath9k. The registers are modified in place and
> need to be re-written every time the firmware sets them. To achieve this
> the register status is verified after any event from the firmware.
>
> The coverage class may not be modified temporarily right after the card
> re-initializes the registers. This is for example the case during scanning.
>
> A warning will be generated if the hack is not supported on the card or
> unexpected values are hit. There is no error reporting for userspace
> applications though (this is a limitation in the mac80211 driver
> interface).
>
> Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
> working on a userspace support for this. This patch wouldn't have been
> possible without this documentation.

I would be concerned about the various resets firmware does to work around
hardware hangs as well.  I don't think any events are generated for these, unless
you count the dbglog messages?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
