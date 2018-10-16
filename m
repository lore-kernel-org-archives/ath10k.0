Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCZAJ-00044q-KM
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 23:54:24 +0000
Received: by mail-vk1-xa42.google.com with SMTP id h186so4441411vkh.13
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:54:09 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id y5-v6sm3189042vkb.25.2018.10.16.16.54.06
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 16:54:06 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id o196so4789669vka.12
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
 <20181013005504.46399-4-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Oct 2018 16:53:52 -0700
Message-ID: <CAD=FV=XFUeyYZ-LQwYHeQH=b0kBf_wM5ZywpQDS74+_zqeDhEw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ath10k: snoc: fix unbalanced clock error handling
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
To: Brian Norris <briannorris@chromium.org>
Cc: kvalo@qca.qualcomm.com, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi,
On Fri, Oct 12, 2018 at 5:55 PM Brian Norris <briannorris@chromium.org> wrote:
>
> Similar to regulator error handling, we should only start tearing down
> the 'i - 1' clock when clock 'i' fails to enable. Otherwise, we might
> end up with an unbalanced clock, where we never successfully enabled the
> clock, but we try to disable it anyway.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Presumably you could have a Fixes tag just to help folks, like:

Fixes: a6a793f98786 ("ath10k: vote for hardware resources for WCN3990")

> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 5a8e87339df2..a835599a8d55 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1470,7 +1470,7 @@ static int ath10k_snoc_clk_init(struct ath10k *ar)
>         return 0;
>
>  err_clock_config:
> -       for (; i >= 0; i--) {
> +       for (i = i - 1; i >= 0; i--) {

I see no problem with this and it's a good / easy to backport fix.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

For extra credit, though, you could change this to not duplicate the
"clk_bulk" APIs and just use 'em.  I already mentioned to someone else
that maybe the clk_bulk APIs could probably be improved to handle
optional clocks, but I don't think anyone has posted a patch for it.
Bonus points if you remember that "NULL" is a valid clock so you
really only need special case code in clk_bulk_get().  :-P


-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
