Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8E53-0005mb-CK
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 19:12:18 +0000
Received: by mail-vb0-f54.google.com with SMTP id w20so528911vbb.13
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 11:11:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52E7FE94.9000608@candelatech.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
 <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
 <52E7FE94.9000608@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 28 Jan 2014 14:11:35 -0500
Message-ID: <CAHqTa-2AEYAcXFFjGJQ+4nYqWXrK_ho3XYTWhasOOGxSCkribA@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Jan 28, 2014 at 2:01 PM, Ben Greear <greearb@candelatech.com> wrote:
> I see similar issues (with the reset killing the PC) on x86-64
> (core-i7 CPU).  Kalle mentioned a few days ago that at least some of the
> NICs had issues with cold reset and that they hoped to
> have a fix that uses warm reset in a week or two.

I saw some messages about this on the list, including a patch that
looked promising:
http://lists.infradead.org/pipermail/ath10k/2013-December/000888.html
but it didn't help.  I'm pretty sure stuck firmware is not something
you can warm reboot to fix.

On the other hand, when my box reboots itself, it always comes back
okay and the driver loads fine.  So clearly there is *some* reset line
in the system that's working...

> Interestingly, I also see hard PC lockup on longer runs, but
> perhaps that is related to the cold-reset issue somehow.

Longer runs?  Lucky you! :)

> I'm using the 10.x AP firmware, and my method of crashing firmware
> is different at the moment :)

Yeah, I tried the AP firmware and it lasts longer.  I'm pretty sad
that there are two different firmwares with two different sets of bugs
to choose between.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
