Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xofhb-0005j9-2g
 for ath10k@lists.infradead.org; Wed, 12 Nov 2014 21:43:47 +0000
Received: by mail-wg0-f49.google.com with SMTP id x13so15299574wgg.36
 for <ath10k@lists.infradead.org>; Wed, 12 Nov 2014 13:43:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CABfbVPKXg2HiVHuEy13s2_F=xw5nxyC7r0J229LsfRgGHySCMg@mail.gmail.com>
References: <CABfbVPKXg2HiVHuEy13s2_F=xw5nxyC7r0J229LsfRgGHySCMg@mail.gmail.com>
Date: Wed, 12 Nov 2014 13:43:24 -0800
Message-ID: <CAJ-VmokLQsJb9qCPs3FY5FQfhBBhLoc99iyG1gnqP396WcKcSA@mail.gmail.com>
Subject: Re: Ath10k leaves AR9880 in a state that will not enumerate again
 when CPU warm booted
From: Adrian Chadd <adrian@freebsd.org>
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
To: David Dailey <daileycrew@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Is the length / number of card resets during a warm boot differ to cold boot?

There's a known behavioural quirk where if the reset line isn't held
for long enough or there's too short a gap between one and another
reset assertion, the NIC doesn't fully initialise right.



-a


On 12 November 2014 13:34, David Dailey <daileycrew@gmail.com> wrote:
> I discovered that this issue seems to follow at least 2 different
> chipsets (AR9880 and AR9890) but doesn't happen with at least two BCM
> chipsets.  And the enumeration failing after a warm boot doesn't
> depend on ath10k loading at all.  Even with the module not present on
> the system, the device doesn't enumerate after cold boot.  So it
> appears this is something unique to the PCIe core on Atheros, not
> ath10k.  I guess the only hope would be if somehow the unload of the
> driver could restore the chipset back to a state where it would
> enumerate again, but I don't have information on the chipset at that
> level.
>
> Dave
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
