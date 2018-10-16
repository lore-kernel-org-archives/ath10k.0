Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCZ06-0000CM-6j
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 23:43:47 +0000
Received: by mail-ua1-x941.google.com with SMTP id j13so4078123ual.0
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:43:35 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id i10-v6sm4207754vke.41.2018.10.16.16.43.32
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 16:43:32 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id m18so4074863uaq.2
 for <ath10k@lists.infradead.org>; Tue, 16 Oct 2018 16:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005504.46399-1-briannorris@chromium.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Oct 2018 16:43:17 -0700
Message-ID: <CAD=FV=UmvnsueUbDTa-vSp5Ay+8Zo0YORW8T7u1AwreUbZA4+Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
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
> ath10k_wcn3990_clk_info and ath10k_wcn3990_vreg_info are not
> WCN3990-specific structures. They hold generic data. So don't name them
> with wcn3990 specifics.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 34 +++++++++++++-------------
>  drivers/net/wireless/ath/ath10k/snoc.h |  8 +++---
>  2 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 8d3d9bca410f..c6254db17dab 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -46,14 +46,14 @@ static char *const ce_name[] = {
>         "WLAN_CE_11",
>  };
>
> -static struct ath10k_wcn3990_vreg_info vreg_cfg[] = {
> +static struct ath10k_vreg_info vreg_cfg[] = {

Ironically, you could sorta make the argument that this should be:

static struct ath10k_vreg_info wcn3990_vreg_cfg

AKA the "wcn3990" shouldn't be in the name of the structure (since all
snoc devices can have the concept of an array of regulators) but
wcn3990 could be in the name of the variable since it's possible that
different snoc devices could have different arrays.  However I'm OK w/
waiting to do that part until we actually see a different snoc device
with a different array.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
