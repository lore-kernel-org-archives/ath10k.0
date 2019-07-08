Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkUuh-0001gE-Gv
 for ath10k@lists.infradead.org; Mon, 08 Jul 2019 14:46:45 +0000
Received: by mail-ed1-x544.google.com with SMTP id i11so14825036edq.0
 for <ath10k@lists.infradead.org>; Mon, 08 Jul 2019 07:46:42 -0700 (PDT)
Date: Mon, 8 Jul 2019 07:46:38 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] ath10k: work around uninitialized vht_pfr variable
Message-ID: <20190708144638.GA43693@archlinux-epyc>
References: <20190708125050.3689133-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708125050.3689133-1-arnd@arndb.de>
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
Cc: Sriram R <srirrama@codeaurora.org>, Miaoqing Pan <miaoqing@codeaurora.org>, Pradeep kumar Chitrapu <pradeepc@codeaurora.org>, Balaji Pothunoori <bpothuno@codeaurora.org>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, clang-built-linux@googlegroups.com, netdev@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Mon, Jul 08, 2019 at 02:50:06PM +0200, Arnd Bergmann wrote:
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

Yup, I reached out to the maintainers when this issue first cropped up,
should have taken your approach though.

https://lore.kernel.org/lkml/20190702181837.GA118849@archlinux-epyc/

Initializing to zero is better than uninitialized.

> 
> Fixes: 8b97b055dc9d ("ath10k: fix failure to set multiple fixed rate")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
