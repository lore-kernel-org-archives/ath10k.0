Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUIuU-0006YZ-3t
 for ath10k@lists.infradead.org; Tue, 25 Aug 2015 18:25:27 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH/RFT 0/2] ath10k: add qca6164 support
Date: Tue, 25 Aug 2015 20:24:57 +0200
Message-ID: <1523365.YtEF2Ft7XC@wuerfel>
In-Reply-To: <1901727.3ECHUBE5WW@wuerfel>
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=STQ2jpMCjP7V=soPk=e4BMuq+3bO_F0UXK_EuJFqxfQ@mail.gmail.com>
 <1901727.3ECHUBE5WW@wuerfel>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Anish Tondwalkar <twilightrook@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Oscar Rydberg <oscarrydberg@gmail.com>, Victor van Poppelen <vvanpo@gmail.com>, Joseph Salisbury <joseph.salisbury@canonical.com>

On Tuesday 25 August 2015 15:47:45 Arnd Bergmann wrote:
> On Tuesday 25 August 2015 15:09:45 Michal Kazior wrote:
> > 
> > This is some weird regression with MSI ranges and we still haven't
> > figured this out.
> > 
> > For the time being add "irq_mode=1" parameter when loading ath10k_pci
> > module, please.
> 
> Ok, that gets the device to show up without errors. I have no
> time to test whether I can actually use it at the moment, will
> report back later.

I tested some more and everything seems fine now when using legacy
interrupts. Thanks for all the work that went into this, I hope
the patch can make it into 4.3.

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
