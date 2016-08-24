Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcbx9-0008BQ-Jz
 for ath10k@lists.infradead.org; Wed, 24 Aug 2016 17:27:04 +0000
Subject: Re: [PATCH 4/4] ath10k: fix spurious tx/rx during boot
References: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
 <1468924452-23877-5-git-send-email-michal.kazior@tieto.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <a9bf9a29-f020-7118-79ee-b6c1aaa95ffe@candelatech.com>
Date: Wed, 24 Aug 2016 10:20:34 -0700
MIME-Version: 1.0
In-Reply-To: <1468924452-23877-5-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, kvalo@qca.qualcomm.com
Cc: marek.puzyniak@tieto.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 07/19/2016 03:34 AM, Michal Kazior wrote:
> HW Rx filters and masks are not configured
> properly by firmware during boot sequences. The
> MAC_PCU_ADDR1 is set to 0s instead of 1s which
> allows the HW to ACK any frame that passes through
> MAC_PCU_RX_FILTER. The MAC_PCU_RX_FILTER itself
> is misconfigured on boot as well.
>
> The combination of these bugs ended up with the
> following manifestations:
>  - "no channel configured; ignoring frame(s)!"
>    warnings in the driver
>  - spurious ACKs (transmission) on the air during
>    firmware bootup sequences
>
> The former was a long standing and known bug
> originally though mostly harmless.
>
> However Marek recently discovered that this
> problem also involves ACKing *all* frames the HW
> receives (including beacons ;). Such frames
> are delivered to host and generate the former
> warning as well.
>
> This could be a problem with regulatory compliance
> in some rare cases (e.g. Taiwan which forbids
> transmissions on channel 36 which is the default
> bootup channel on 5Ghz band cards). The good news
> is that it'd require someone else to violate
> regulatory first to coerce our device to generate
> and transmit an ACK.
>
> The problem could be reproduced in a rather busy
> environment that has a lot of APs. The likelihood
> could be increased by injecting an msleep() of
> 5000 or longer immediately after
> ath10k_htt_setup() in ath10k_core_start().
>
> The reason why the former warnings were only
> showing up seldom is because the device was either
> quickly reset again (i.e. during firmware probing)
> or wmi vdev was created (which fixes hw and fw
> states).
>
> It is technically possible for host driver to
> override adequate hw registers however this can't
> work reliably because the bug root cause lies in
> incorrect firmware state on boot (internal
> structure used to program MAC_PCU_ADDR1 is not
> properly initialized) and only vdev create/delete
> events can fix it. This is why the patch takes
> dummy vdev approach.
>
> This could be fixed in firmware as well but having
> this fixed in driver is more robust, most notably
> when thinking of users of older firmware such as
> 999.999.0.636.
>
> Reported-by: Marek Puzyniak <marek.puzyniak@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I was looking at firmware to make sure that I fixed what I could there....

 From what I can tell, 10.4 should not have this bug.  Did you see this only
on 10.1/10.2 firmware?  It is of course possible that I am mis-understanding
10.4....

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
