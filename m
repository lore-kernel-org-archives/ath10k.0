Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9wqf-0005X9-V3
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 15:53:54 +0000
Received: by mail-wm0-x22b.google.com with SMTP id n184so99104694wmn.1
 for <ath10k@lists.infradead.org>; Mon, 06 Jun 2016 08:53:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
References: <1465215656-20569-1-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 6 Jun 2016 08:53:29 -0700
Message-ID: <CAGXu5j+z-QOG+x6ie+BYVTmopCSZrLzzH3A2zLE1nQi+Q+WyKg@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: replace config_enabled() with IS_ENABLED()
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
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, David Daney <david.daney@cavium.com>, Peter Zijlstra <peterz@infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Kalle Valo <kvalo@qca.qualcomm.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Viresh Kumar <viresh.kumar@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhc@lemote.com>, Andrea Gelmini <andrea.gelmini@gelma.net>, Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Sumit Semwal <sumit.semwal@linaro.org>, "Maciej W. Rozycki" <macro@imgtec.com>, Huaitong Han <huaitong.han@intel.com>, Denys Vlasenko <dvlasenk@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Tony Wu <tung7970@gmail.com>, "x86@kernel.org" <x86@kernel.org>, ath10k@lists.infradead.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Alex Smith <alex.smith@imgtec.com>, Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, Nikolay Martynov <mar.kolya@gmail.com>, Borislav Petkov <bp@suse.de>, Stas Sergeev <stsp@list.ru>, linux-media@vger.kernel.org, yu-cheng yu <yu-cheng.yu@intel.com>, James Hogan <james.hogan@imgtec.com>, Mikko Rapeli <mikko.rapeli@iki.fi>, Jason Cooper <jason@lakedaemon.net>, Roland McGrath <roland@hack.frob.com>, Marc Zyngier <marc.zyngier@arm.com>, Brian Gerst <brgerst@gmail.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linaro-mm-sig@lists.linaro.org, Al Viro <viro@zeniv.linux.org.uk>, Oleg Nesterov <oleg@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>, Brian Norris <computersforpeace@gmail.com>, Will Drewry <wad@chromium.org>, Paul Burton <paul.burton@imgtec.com>, "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qais Yousef <qais.yousef@imgtec.com>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Andy Lutomirski <luto@amacapital.net>, Rabin Vincent <rabin@rab.in>, ath9k-devel@lists.ath9k.org, Markos Chandras <markos.chandras@imgtec.com>, Network Development <netdev@vger.kernel.org>, Linux mtd <linux-mtd@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>, Matt Redfearn <matt.redfearn@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Jiang Liu <jiang.liu@linux.intel.com>, Joshua Kinard <kumba@gentoo.org>, James Cowgill <James.Cowgill@imgtec.com>

On Mon, Jun 6, 2016 at 5:20 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Sounds good to me! :)

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
Chrome OS & Brillo Security

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
