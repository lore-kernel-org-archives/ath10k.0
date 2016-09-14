Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bk9Jj-0000K2-EV
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 12:29:32 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add missing CONFIG_ATH10K_DEBUGFS check
Date: Wed, 14 Sep 2016 12:29:03 +0000
Message-ID: <87a8fafywg.fsf@kamboji.qca.qualcomm.com>
References: <871t0tp1ad.fsf@kamboji.qca.qualcomm.com>
 <20160912141105.24085-1-benjamin@sipsolutions.net>
In-Reply-To: <20160912141105.24085-1-benjamin@sipsolutions.net> (Benjamin
 Berg's message of "Mon, 12 Sep 2016 16:11:05 +0200")
Content-Language: en-US
Content-ID: <3EEC5E22C67007478C90FD1BDE925F8F@qualcomm.com>
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

> The patch "ath10k: allow setting coverage class" was missing a check for
> CONFIG_ATH10K_DEBUGFS so it would try to use non-existing struct elements
> in some configurations. Fix this by adding the appropriate ifdef.
>
> Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
> ---
>
> Sorry, so turns out the kbuild test robot is correct and I forgot the ifdef
> to check for CONFIG_ATH10K_DEBUGFS, so here a fixup commit for it.
>
> Other than that everything looks good to me in the pending branch.

Thanks, I folded this to the original patch in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
