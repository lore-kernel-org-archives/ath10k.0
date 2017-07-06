Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT2v3-0006sD-1m
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 09:17:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 0/3] ath10k usb support
Date: Thu, 6 Jul 2017 09:17:29 +0000
Message-ID: <87r2xtexgn.fsf@kamboji.qca.qualcomm.com>
References: <1495312410-9937-1-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1495312410-9937-1-git-send-email-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sat, 20 May 2017 22:33:27 +0200")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> This is the 2nd version of the ath10k USB RFC. There are only minor updates
> since last version.
>
> The main difference when compared to the previous RFC is that the
> high latency stuff that is common between USB and SDIO has been moved out
> of this patchset and into another (separate) patchset.
>
> I was actually thinking about squashing all the patches into one, but
> decided not to do so since I wanted usb.h, usb.c and the update Kconfig +
> Makefile in one separate patch.
>
> Perhaps patch 1 and 2 should be squashed?
>
> Erik Stromdahl (3):
>   ath10k: various usb related definitions
>   ath10k: different fw file names for usb
>   ath10k: add initial USB support

This looks good. I'll again do some cosmetic changes and submit v2 as
proper patch. Sorry for taking so long with this.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
