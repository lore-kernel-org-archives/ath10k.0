Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtfb-0007e8-1x
 for ath10k@lists.infradead.org; Tue, 20 Oct 2020 15:35:27 +0000
Received: by mail-vk1-xa43.google.com with SMTP id h74so589726vkh.6
 for <ath10k@lists.infradead.org>; Tue, 20 Oct 2020 08:35:26 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id w6sm236642uan.4.2020.10.20.08.35.23
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 08:35:23 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id s15so1382445vsm.0
 for <ath10k@lists.infradead.org>; Tue, 20 Oct 2020 08:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
In-Reply-To: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Oct 2020 08:35:11 -0700
Message-ID: <CAD=FV=Xv7Usev=S_ViWPPsa0xL42KDymjEkqJF7S4CzDiuxP3g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add option for chip-id based BDF selection
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
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

Hi,

On Mon, Oct 19, 2020 at 5:51 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> In some devices difference in chip-id should be enough to pick
> the right BDF. Add another support for chip-id based BDF selection.
> With this new option, ath10k supports 2 fallback options.
>
> The board name with chip-id as option looks as follows
> board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
>
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
>  drivers/net/wireless/ath/ath10k/core.c | 45 +++++++++++++++++++-------
>  1 file changed, 34 insertions(+), 11 deletions(-)

You might want to think a little more about who you're CCing when you
post a patch.  I would have imagined that Rakesh should have been
CCed.  Probably Brian and I, too?  Luckily I knew to look for it.


>  int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type)
>  {
> -       char boardname[100], fallback_boardname[100];
> +       char boardname[100], fallback_boardname1[100], fallback_boardname2[100];
>         int ret;
>
>         if (bd_ie_type == ATH10K_BD_IE_BOARD) {
> +               /* With variant and chip id */
>                 ret = ath10k_core_create_board_name(ar, boardname,
> -                                                   sizeof(boardname), true);
> +                                               sizeof(boardname), true, true);

I don't know if it's worth spinning the patch just for this, but it's
weird that the indentation of the 2nd line above doesn't match the
indentation of the similar calls below.

Other than the tiny nit, this seems sane to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've also confirmed that the patch is behaving properly on two boards
I have with slightly different chip-ids.  I tried poking with various
combinations of specifying a variant in dts and not specifying one.

Board 1:
qmi chip_id 0x320 chip_family 0x4001 board_id 0xff soc_id 0x400c0000

Board 2:
qmi chip_id 0x4320 chip_family 0x4001 board_id 0xff soc_id 0x400c0000

Both boards report "WCN3990 hw1.0 SNOC", so I guess the "Tested-on"
tag should be:

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1

Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
