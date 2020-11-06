Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavtt-0002gf-7y
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 07:11:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add option for chip-id based BDF selection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
References: <20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid>
Message-Id: <20201106071107.99524C433C9@smtp.codeaurora.org>
Date: Fri,  6 Nov 2020 07:11:07 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Abhishek Kumar <kuabhs@chromium.org> wrote:

> In some devices difference in chip-id should be enough to pick
> the right BDF. Add another support for chip-id based BDF selection.
> With this new option, ath10k supports 2 fallback options.
> 
> The board name with chip-id as option looks as follows
> board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=320'
> 
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Abhishek Kumar <kuabhs@chromium.org>

There were few checkpatch warnings which I fixed:

$ ath10k-check
drivers/net/wireless/ath/ath10k/core.c:1501: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/core.c:1512: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath10k/core.c:1521: line length of 92 exceeds 90 columns

The first one was also what Doug commented. I also added Tested-on tags,
thanks for those. The updated patch is in pending branch (soon).

But is this patch ok to take now? I didn't quite get the conclusion of the
discussion.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201020000506.1.Ifbc28707942179f1cefc7491e995814564495270@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
