Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1JXj-0000uZ-Fz
 for ath10k@lists.infradead.org; Mon, 22 Jul 2013 17:05:07 +0000
Message-ID: <1374512681.2061.53.camel@joe-AO722>
Subject: Re: [PATCH 1/2] MAINTAINERS: add ath10k
From: Joe Perches <joe@perches.com>
Date: Mon, 22 Jul 2013 10:04:41 -0700
In-Reply-To: <87zjtewmzg.fsf@kamboji.qca.qualcomm.com>
References: <20130722093113.26562.11543.stgit@localhost6.localdomain6>
 <20130722093220.26562.14270.stgit@localhost6.localdomain6>
 <1374504278.2061.35.camel@joe-AO722>
 <87zjtewmzg.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon, 2013-07-22 at 19:58 +0300, Kalle Valo wrote:
> Joe Perches <joe@perches.com> writes:
> 
> > On Mon, 2013-07-22 at 12:32 +0300, Kalle Valo wrote:
> >> I forgot to add an entry to MAINTAINERS when submitting the driver.
> > []
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> > []
> >> +QUALCOMM ATHEROS ATH10K WIRELESS DRIVER
> >
> > It's odd to not find ATH6KL next to ATH10K.
> 
> I was wondering the same, but decided to put the entries in alphabetical
> order still.
> 
> > Maybe it's time to rename all the ATH sections
> > to make them QUALCOMM?
> 
> Maybe, but does it really matter?

Only to those that actually read the MAINTAINERS
file instead of using tools to search it.

> Changing the MAINTAINERS file just
> creates unnecessary conficts for git merges.

Those are always trivially resolved if they
ever really occur.

It's not a big deal, just wanted to note it.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
