Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfbze-0000om-IR
 for ath10k@lists.infradead.org; Mon, 01 Jun 2020 04:24:11 +0000
Received: by mail-qv1-f52.google.com with SMTP id g7so3869583qvx.11
 for <ath10k@lists.infradead.org>; Sun, 31 May 2020 21:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <75f092e3-b667-341a-e810-61edd8f089ac@candelatech.com>
In-Reply-To: <75f092e3-b667-341a-e810-61edd8f089ac@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Sun, 31 May 2020 21:23:55 -0700
Message-ID: <CAJ-Vmo=-w=mvKB8=8g+jn3sE6vwJLOfq0SarMpeJq8OdgMApuQ@mail.gmail.com>
Subject: Re: Un-recoverable ath10k 4019 NIC lockup.
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Wed, 27 May 2020 at 11:30, Ben Greear <greearb@candelatech.com> wrote:
>
> While doing a torture test on OpenWrt using ath10k-ct drivers/firmware, the 5Ghz AP fell off the
> air.  After debugging, I found this in the console logs.
>
> I am guessing that the only way to recover in this case would be to reboot, but in case someone else
> has ideas on additional ways to kick the 4019 chip to have it start responding again, please let me know.


Hm, i haven't looked at the Dakota datasheet in a while; does the
platform support or ath10k actually power off/on the core fully, or
just the RTC/MAC/PHY path?

Chances are there's a reset controller somewhere that lets you put the
bus and tensilia cores in reset..



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
