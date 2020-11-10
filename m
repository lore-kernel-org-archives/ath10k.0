Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcXIs-0002VT-OX
 for ath10k@lists.infradead.org; Tue, 10 Nov 2020 17:19:35 +0000
Received: by mail-il1-x142.google.com with SMTP id q1so12897475ilt.6
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2020 09:19:32 -0800 (PST)
MIME-Version: 1.0
References: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
 <20201106071107.D7CE3C433C6@smtp.codeaurora.org>
In-Reply-To: <20201106071107.D7CE3C433C6@smtp.codeaurora.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 10 Nov 2020 09:19:20 -0800
Message-ID: <CACTWRwtjvQYUvbWHrajNRkK_sDZRv1hr0kp+o1=6504qv64qKQ@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Apologies for the delay, was busy so could not work on V2 . I have
started working on V2 patch. Will upload by today/tomorrow.

Abhishek


On Thu, Nov 5, 2020 at 11:11 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> > In some devices difference in chip-id should be enough to pick
> > the right BDF. Add another support for chip-id based BDF selection.
> > With this new option, ath10k supports 2 fallback options.
> >
> > The board name with chip-id as option looks as follows
> > board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
> >
> > Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Tested-by: Douglas Anderson <dianders@chromium.org>
> > Tested-by: Abhishek Kumar <kuabhs@chromium.org>
>
> There were few checkpatch warnings which I fixed:
>
> $ ath10k-check
> drivers/net/wireless/ath/ath10k/core.c:1501: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/core.c:1512: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/core.c:1521: line length of 92 exceeds 90 columns
>
> The first one was also what Doug commented. I also added Tested-on tags,
> thanks for those. The updated patch is in pending branch (soon).
>
> But is this patch ok to take now? I didn't quite get the conclusion of the
> discussion.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/patch/20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
