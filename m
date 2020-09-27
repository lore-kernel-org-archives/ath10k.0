Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMUO6-0004ii-5G
 for ath10k@lists.infradead.org; Sun, 27 Sep 2020 10:58:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id k10so5437872wru.6
 for <ath10k@lists.infradead.org>; Sun, 27 Sep 2020 03:58:36 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Date: Sun, 27 Sep 2020 11:58:28 +0100
Subject: Re: [PATCH v2] ath10k: sdio: remove redundant check in for loop
Message-ID: <20200927105828.522fabbpyxx2mt3n@medion>
References: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
 <20200916165748.20927-1-alex.dewar90@gmail.com>
 <CAGRGNgWoFfCnK9FcWTf_f0b57JNEjsm6ZNQB5X_AMf8L3FyNcQ@mail.gmail.com>
 <87h7rnnnrb.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7rnnnrb.fsf@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Alex Dewar <alex.dewar90@gmail.com>

> I agree. Anyone can come up with a patch?

Hi Kalle,

I was thinking of having a go at this. Have you applied the v2 of this
patch yet though? I couldn't see it in wireless-drivers-next. I just
don't want to have to rebase the patch if you were going to apply this
v2.

Best,
Alex

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
