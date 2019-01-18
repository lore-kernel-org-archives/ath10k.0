Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkN1C-0006L9-0H
 for ath10k@lists.infradead.org; Fri, 18 Jan 2019 05:48:39 +0000
Received: by mail-it1-x141.google.com with SMTP id m62so5195264ith.5
 for <ath10k@lists.infradead.org>; Thu, 17 Jan 2019 21:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20190118033215.5904-1-yuehaibing@huawei.com>
In-Reply-To: <20190118033215.5904-1-yuehaibing@huawei.com>
From: Steve deRosier <derosier@drawerlight.com>
Date: Thu, 17 Jan 2019 21:47:58 -0800
Message-ID: <CALLGbRJ74t=BpRDn5qthnqha_qLt43wvKhctF10Z+Xr=XNgafw@mail.gmail.com>
Subject: Re: [PATCH] wireless: remove unneeded semicolon
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
To: YueHaibing <yuehaibing@huawei.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, Ping-Ke Shih <pkshih@realtek.com>, Network Development <netdev@vger.kernel.org>, chi-hsien.lin@cypress.com, linux-wireless <linux-wireless@vger.kernel.org>, Arend <arend.vanspriel@broadcom.com>, ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, brcm80211-dev-list@cypress.com, davem@davemloft.net, Kalle Valo <kvalo@codeaurora.org>, franky.lin@broadcom.com

On Thu, Jan 17, 2019 at 7:33 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> remove unneeded semicolon
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.h                     | 2 +-
>  drivers/net/wireless/ath/ath6kl/init.c                    | 2 +-
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 2 +-
>  drivers/net/wireless/ray_cs.c                             | 2 +-
>  drivers/net/wireless/realtek/rtlwifi/rtl8723be/phy.c      | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
>
...
> diff --git a/drivers/net/wireless/ath/ath6kl/init.c b/drivers/net/wireless/ath/ath6kl/init.c
> index 54132af..aa1c71a 100644
> --- a/drivers/net/wireless/ath/ath6kl/init.c
> +++ b/drivers/net/wireless/ath/ath6kl/init.c
> @@ -1140,7 +1140,7 @@ static int ath6kl_fetch_fw_apin(struct ath6kl *ar, const char *name)
>
>                 len -= ie_len;
>                 data += ie_len;
> -       };
> +       }
>
>         ret = 0;
>  out:

For ath6kl

Acked-by: Steve deRosier <derosier@cal-sierra.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
