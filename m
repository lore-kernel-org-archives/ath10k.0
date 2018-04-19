Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9CvE-000557-9t
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 17:00:37 +0000
Received: by mail-wr0-x22a.google.com with SMTP id s18-v6so15902558wrg.9
 for <ath10k@lists.infradead.org>; Thu, 19 Apr 2018 10:00:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 19 Apr 2018 10:00:22 -0700
Message-ID: <CAJ-Vmoky1JkQ5ZFc_zmvRdtRkVwVftLgqZehvfn6e8bH8TqKCg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ath10k: Enable sta idle power save
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, govinds@codeaurora.org, linux-wireless@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, pillair@codeaurora.org, ath10k@lists.infradead.org

Hi,

My 2c here.

As much as I like power save stuff, I've been bitten enough times by
these wifi chips kinda implementing
mostly-ok-but-not-that-particular-time power savings stuff and so have
had to make it configurable chip by chip.

A good example is active state power management in various runtime and
idle modes on different chips, how it intersects with things like
bluetooth, btcoex, is the bios buggy, etc, etc.

So I'd at least like a way to control that feature as a module load
and/or debugfs entry to aide users trying to figure out why chips
disappear or behave erratically. I'm ok with it being turned on but
I'm not ok with a debugging step being "oh yeah, so just go comment
this out and recompile", especially if people are debugging on an
embedded target where it's not easily self hosted or easy to rebuild
things.




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
