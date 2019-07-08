Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkaLR-0004Zr-KV
 for ath10k@lists.infradead.org; Mon, 08 Jul 2019 20:34:43 +0000
Received: by mail-lj1-x241.google.com with SMTP id r9so17286797ljg.5
 for <ath10k@lists.infradead.org>; Mon, 08 Jul 2019 13:34:40 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id m4sm3870665ljc.56.2019.07.08.13.34.34
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 13:34:35 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id z28so8379865ljn.4
 for <ath10k@lists.infradead.org>; Mon, 08 Jul 2019 13:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190708125050.3689133-1-arnd@arndb.de>
In-Reply-To: <20190708125050.3689133-1-arnd@arndb.de>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 8 Jul 2019 13:34:22 -0700
Message-ID: <CA+ASDXOjPbZ0k8dvWr3b6ns_Y3c_ydanYA9+HVUA00btJB5rxQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: work around uninitialized vht_pfr variable
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
Cc: Sriram R <srirrama@codeaurora.org>, Miaoqing Pan <miaoqing@codeaurora.org>, Pradeep kumar Chitrapu <pradeepc@codeaurora.org>, Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, clang-built-linux@googlegroups.com, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, Rakesh Pillai <pillair@codeaurora.org>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

Hi Arnd,

On Mon, Jul 8, 2019 at 5:50 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> As clang points out, the vht_pfr is assigned to a struct member
> without being initialized in one case:
>
> drivers/net/wireless/ath/ath10k/mac.c:7528:7: error: variable 'vht_pfr' is used uninitialized whenever 'if' condition
>       is false [-Werror,-Wsometimes-uninitialized]
>                 if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath10k/mac.c:7551:20: note: uninitialized use occurs here
>                 arvif->vht_pfr = vht_pfr;
>                                  ^~~~~~~
> drivers/net/wireless/ath/ath10k/mac.c:7528:3: note: remove the 'if' if its condition is always true
>                 if (!ath10k_mac_can_set_bitrate_mask(ar, band, mask,
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath10k/mac.c:7483:12: note: initialize the variable 'vht_pfr' to silence this warning
>         u8 vht_pfr;
>
> Add an explicit but probably incorrect initialization here.
> I suspect we want a better fix here, but chose this approach to
> illustrate the issue.
>
> Fixes: 8b97b055dc9d ("ath10k: fix failure to set multiple fixed rate")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index e43a566eef77..0606416dc971 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -7541,6 +7541,8 @@ static int ath10k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
>                                                                 &vht_nss,
>                                                                 true);

^^ Technically, this call to ath10k_mac_bitrate_mask_get_single_rate()
can fail to assign 'vht_pfr' as well. I can't immediately tell whether
it provably will never hit the -EINVAL case, but if we do, then you'd
have another uninitialized case.

I *believe* it shouldn't fail, since we already pre-checked the VHT
MCS lists for "exactly 1" rate. But it still seems like better code to
pre-initialize and/or add error-handling, so we don't rely on that
implicit proof.

I'm not quite sure yet what the "better" answer should be for
resolving this, but at a minimum, I think the above could be improved.

Brian

>                         update_bitrate_mask = false;
> +               } else {
> +                       vht_pfr = 0;
>                 }
>
>                 mutex_lock(&ar->conf_mutex);
> --
> 2.20.0
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
