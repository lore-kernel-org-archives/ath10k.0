Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIcPr-00048V-CS
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 16:35:24 +0000
Received: by mail-ed1-x543.google.com with SMTP id z12-v6so2307076edp.7
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 09:35:11 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54])
 by smtp.gmail.com with ESMTPSA id z12-v6sm528983edk.43.2018.11.02.09.35.05
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Nov 2018 09:35:07 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id c25-v6so2298246edt.8
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 09:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181102161833.2956376-1-arnd@arndb.de>
In-Reply-To: <20181102161833.2956376-1-arnd@arndb.de>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 2 Nov 2018 09:34:53 -0700
Message-ID: <CA+ASDXPVJMge_B-AUXj1sKc4dB+3FcXew8T5FYEXVsncKYotiw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: avoid -Wmaybe-uninitialized warning
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: srirrama@codeaurora.org, bpothuno@codeaurora.org, akolli@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, yintang@qti.qualcomm.com, pillair@codeaurora.org, ath10k@lists.infradead.org, netdev@vger.kernel.org, davem@davemloft.net, Kalle Valo <kvalo@codeaurora.org>

Hi,

On Fri, Nov 2, 2018 at 9:19 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> In some configurations the inlining in gcc is suboptimal, causing
> a false-positive warning:
>
> drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_init_rd':
> drivers/net/wireless/ath/ath10k/mac.c:8374:39: error: 'rd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   ar->ath_common.regulatory.current_rd = rd;
>
> If we initialize the output of ath10k_mac_get_wrdd_regulatory()
> before returning, this problem goes away.
>
> Fixes: 209b2a68de76 ("ath10k: add platform regulatory domain support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index a1c2801ded10..0d5fde28ee44 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8321,6 +8321,8 @@ static int ath10k_mac_get_wrdd_regulatory(struct ath10k *ar, u16 *rd)
>         u32 alpha2_code;
>         char alpha2[3];
>
> +       *rd = ar->hw_eeprom_rd;
> +

Maybe it's just me, but it seems kinda weird for this function to
assign a (valid) value to its "output" and still potentially return an
error.

If you really need to work around this compiler bug, maybe just put
the eeprom assignment back in ath10k_mac_init_rd()? I'll leave it up
to Kalle as to whether he wants to work around the compiler at all :)

Oh wait, one more thing: this is actually an invalid refactoring. See
how this function assigns '*rd' later in error cases. Today, we still
treat those as errors and clobber those with the eeprom value, but
now, you're making the fallback case continue to use the erroneous
value (0xffff). You need to make that use a local variable and avoid
clobbering *rd, if you want this to be correct.

>         root_handle = ACPI_HANDLE(&pdev->dev);

Side note: your patch made me notice -- this code is *not* only used
on PCI devices, yet it utilizes the 'pci_dev' structure. Fortunately,
it only does this to needless convert it right back to a bare
'device', and then the ACPI code safely handles non-ACPI devices
(should result in -EOPNOTSUPP below), but this is awfully strange
code.

Anyway, I'm just thinking out loud. I'll probably patch the pci_dev out myself.

Brian

>         if (!root_handle)
>                 return -EOPNOTSUPP;
> @@ -8365,11 +8367,9 @@ static int ath10k_mac_init_rd(struct ath10k *ar)
>         u16 rd;
>
>         ret = ath10k_mac_get_wrdd_regulatory(ar, &rd);
> -       if (ret) {
> +       if (ret)
>                 ath10k_dbg(ar, ATH10K_DBG_BOOT,
>                            "fallback to eeprom programmed regulatory settings\n");
> -               rd = ar->hw_eeprom_rd;
> -       }
>
>         ar->ath_common.regulatory.current_rd = rd;
>         return 0;
> --
> 2.18.0
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
