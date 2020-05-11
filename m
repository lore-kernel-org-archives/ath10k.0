Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7ih-0003Uy-3X
 for ath10k@lists.infradead.org; Mon, 11 May 2020 12:39:44 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N5VLY-1j1nnc2soM-016yNo for <ath10k@lists.infradead.org>; Mon, 11 May
 2020 14:39:38 +0200
Received: by mail-qv1-f43.google.com with SMTP id a4so1178468qvj.3
 for <ath10k@lists.infradead.org>; Mon, 11 May 2020 05:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200509120707.188595-1-arnd@arndb.de>
 <20200509120707.188595-2-arnd@arndb.de>
 <87v9l24qz6.fsf@kamboji.qca.qualcomm.com>
 <87r1vq4qev.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r1vq4qev.fsf@kamboji.qca.qualcomm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 May 2020 14:39:21 +0200
Message-ID: <CAK8P3a2kRPcpv=xR6yYvFQ5bnFbOWAzyPyzzqufyzFmk2WW2fA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] ath10k: fix ath10k_pci struct layout
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Networking <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

On Mon, May 11, 2020 at 2:17 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Kalle Valo <kvalo@codeaurora.org> writes:
> >>
> >> Change it to a flexible-array member and move it last again to
> >> make it work correctly, prevent the same thing from happening
> >> again (all compilers warn about flexible-array members in the
> >> middle of a struct) and get it to build without warnings.
> >
> > Very good find, thanks! This bug would cause all sort of strange memory
> > corruption issues.
>
> This motivated me to switch to using GCC 10.x and I noticed that you had
> already upgraded crosstool so it was a trivial thing to do, awesome :)
>
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
>
> I use crosstool like this using GNUmakefile:
>
> CROSS_COMPILE=/opt/cross/gcc-10.1.0-nolibc/x86_64-linux/bin/x86_64-linux-
> include Makefile

Right, I have something similar (with many more additional things)
in a local makefile here.  I mainly use that to pick the correct cross
toolchain based on ${ARCH}, and to build multiple randconfig kernels
in parallel with 'make -j${NR_CPUS}' for better CPU utilization.

> I think it's handy trick and would be good to mention that in the
> crosstool main page. That way I could just point people to the crosstool
> main page when they are using ancient compilers and would need to
> upgrade.

I actually started working on a script that I'd like to include the kernel
sources to list the installed compilers, automatically pick on that
works for the current architecture, or download one for local installation.

      Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
