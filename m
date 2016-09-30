Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpxPD-0002Pk-9V
 for ath10k@lists.infradead.org; Fri, 30 Sep 2016 12:59:11 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix spinlock use in coverage class hack
Date: Fri, 30 Sep 2016 12:58:42 +0000
Message-ID: <87ponltugu.fsf@kamboji.qca.qualcomm.com>
References: <8760q0j8st.fsf@kamboji.qca.qualcomm.com>
 <20160914163231.20863-1-benjamin@sipsolutions.net>
In-Reply-To: <20160914163231.20863-1-benjamin@sipsolutions.net> (Benjamin
 Berg's message of "Wed, 14 Sep 2016 18:32:31 +0200")
Content-Language: en-US
Content-ID: <AA0361C66876E8438D0FA9FEC4661B81@qualcomm.com>
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
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, "Thiagarajan,
 Vasanthakumar" <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k @ lists . infradead . org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

Benjamin Berg <benjamin@sipsolutions.net> writes:

> ath10k_hw_qca988x_set_coverage_class needs to hold both conf_mutex and
> the data_lock spin lock for parts of the function. However, data_lock
> is only needed while storing the coverage_class to store the value that
> the card is configured to.
>
> Fix the locking issue by only holding data_lock for the required duration.
>
> Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>

Thanks, I also folded this with the patch in the pending branch.

> And yes, I fully agree with your points of it being rather fragile. But as
> you said, it should be entirely safe if not used.

That's good.

> Obviously a firmware implementation would be preferential.

That's a shame as this feature is quite often requested. But if the
firmware ever starts supporting the featrue we can then remove this hack
from ath10k.

> This locking issue was pretty unnecessary. Lets see if any more issues show
> up in a closer review.

I can't see the locking problem anymore so it seems to be fixed. I'll
fix some minor things and send v2. I'll also CC linux-wireless.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
