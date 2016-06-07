Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Tue, 7 Jun 2016 15:29:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] tree-wide: replace config_enabled() with IS_ENABLED()
Message-Id: <20160607152930.71273719bdaea322814213d0@linux-foundation.org>
In-Reply-To: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
References: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mips@linux-mips.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, David Daney <david.daney@cavium.com>, Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org, "Dmitry V. Levin" <ldv@altlinux.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Kalle Valo <kvalo@qca.qualcomm.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Viresh Kumar <viresh.kumar@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhc@lemote.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Sumit Semwal <sumit.semwal@linaro.org>, ath9k-devel@venema.h4ckr.net, Jason Cooper <jason@lakedaemon.net>, "Maciej W. Rozycki" <macro@imgtec.com>, Huaitong Han <huaitong.han@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Tony Wu <tung7970@gmail.com>, x86@kernel.org, ath10k@lists.infradead.org, Alex Smith <alex.smith@imgtec.com>, Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, Nikolay Martynov <mar.kolya@gmail.com>, Borislav Petkov <bp@suse.de>, Stas Sergeev <stsp@list.ru>, linux-media@vger.kernel.org, yu-cheng yu <yu-cheng.yu@intel.com>, James Hogan <james.hogan@imgtec.com>, Mikko Rapeli <mikko.rapeli@iki.fi>, Kees Cook <keescook@chromium.org>, Roland McGrath <roland@hack.frob.com>, Marc Zyngier <marc.zyngier@arm.com>, Brian Gerst <brgerst@gmail.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linaro-mm-sig@lists.linaro.org, Al Viro <viro@zeniv.linux.org.uk>, Oleg Nesterov <oleg@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Adam Buchbinder <adam.buchbinder@gmail.com>, Juergen Gross <jgross@suse.com>, Brian Norris <computersforpeace@gmail.com>, Will Drewry <wad@chromium.org>, Paul Burton <paul.burton@imgtec.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qais Yousef <qais.yousef@imgtec.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Andy Lutomirski <luto@amacapital.net>, Rabin Vincent <rabin@rab.in>, Markos Chandras <markos.chandras@imgtec.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>, Matt Redfearn <matt.redfearn@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Jiang Liu <jiang.liu@linux.intel.com>, Joshua Kinard <kumba@gentoo.org>, James Cowgill <James.Cowgill@imgtec.com>

On Mon,  6 Jun 2016 21:20:56 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The use of config_enabled() against config options is ambiguous.
> In practical terms, config_enabled() is equivalent to IS_BUILTIN(),
> but the author might have used it for the meaning of IS_ENABLED().
> Using IS_ENABLED(), IS_BUILTIN(), IS_MODULE() etc. makes the
> intention clearer.
> 
> This commit replaces config_enabled() with IS_ENABLED() where
> possible.  This commit is only touching bool config options.
> 
> I noticed two cases where config_enabled() is used against a tristate
> option:
> 
>  - config_enabled(CONFIG_HWMON)
>   [ drivers/net/wireless/ath/ath10k/thermal.c ]
> 
>  - config_enabled(CONFIG_BACKLIGHT_CLASS_DEVICE)
>   [ drivers/gpu/drm/gma500/opregion.c ]
> 
> I did not touch them because they should be converted to IS_BUILTIN()
> in order to keep the logic, but I was not sure it was the authors'
> intention.

Well, we do want to be able to remove config_enabled() altogether if
we're going to do this.  So please later send along a patch which makes
a best-effort fix of the unclear usages and let's zap the thing.

If those fixes weren't quite correct then there will be a build error
(drivers/net/wireless/ath/ath10k/thermal.c) or no change in behaviour
(drivers/gpu/drm/gma500/opregion.c).


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
