Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibdK1-0001ur-S5
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 04:28:31 +0000
Received: by mail-oi1-x244.google.com with SMTP id l20so31191284oie.10
 for <ath10k@lists.infradead.org>; Sun, 01 Dec 2019 20:28:28 -0800 (PST)
MIME-Version: 1.0
References: <0101016eaacca72d-a73d6fb5-0e3f-4fbb-9045-8363270fe25f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016eaacca72d-a73d6fb5-0e3f-4fbb-9045-8363270fe25f-000000@us-west-2.amazonses.com>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 1 Dec 2019 20:28:12 -0800
Message-ID: <CAMrEMU89NCJ4HKVqirYrNTC83Hv8HpT7uKrvQ-3p3Bvju=8_-Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: set max mtu to 1500 for sdio chip
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

So I understand the reasoning behind using ETH_DATA_LEN, but would it
be more future proof / obvious to the next dev to calculate the size
given the interface's parameters/defines--- I get that the values were
chosen to align with this but just worried if things were to change
over time this would not be resilient/obvious thing to fix up?

I was curious if these changes would have any impact on things like
WEP where the frames are a little larger? I came across a random post
about 80211 mdsu/mtus here
https://www.cwnp.com/forums/posts?postNum=307311 and they had
mentioned it, so it got me curious

On Tue, Nov 26, 2019 at 7:00 PM Wen Gong <wgong@codeaurora.org> wrote:
>
> For sdio chip, the max credit size in firmware is 1556, the 1556
> include payload, ieee80211 header, htt header, htc header. So it
> need to set the max mtu to 1500 to forbidden TX packet which exceed
> 1500 form application.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWP-1.
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 60849ab8088f..8aa8ebc1d8e9 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2185,6 +2185,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
>         bus_params.chip_id = 0;
>         bus_params.hl_msdu_ids = true;
>
> +       ar->hw->max_mtu = ETH_DATA_LEN;
> +
>         ret = ath10k_core_register(ar, &bus_params);
>         if (ret) {
>                 ath10k_err(ar, "failed to register driver core: %d\n", ret);
> --
> 2.23.0
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
