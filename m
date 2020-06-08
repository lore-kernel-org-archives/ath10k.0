Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiKJi-0006QJ-84
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 16:08:07 +0000
Received: by mail-lf1-x142.google.com with SMTP id c12so10555449lfc.10
 for <ath10k@lists.infradead.org>; Mon, 08 Jun 2020 09:08:04 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id z12sm2200740ljm.25.2020.06.08.09.08.01
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 09:08:01 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 9so11552096ljv.5
 for <ath10k@lists.infradead.org>; Mon, 08 Jun 2020 09:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200604105901.1.I5b8b0c7ee0d3e51a73248975a9da61401b8f3900@changeid>
 <87v9k1iy7w.fsf@codeaurora.org>
In-Reply-To: <87v9k1iy7w.fsf@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 8 Jun 2020 09:07:24 -0700
Message-ID: <CAE=gft76Nqo93QvvXU9xU-6sY-Q88H4RezMx8G6MWSBE7vJDKA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Acquire tx_lock in tx error paths
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, kuabhs@chromium.org, sujitka@chromium.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

On Mon, Jun 8, 2020 at 4:39 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Evan Green <evgreen@chromium.org> writes:
>
> > ath10k_htt_tx_free_msdu_id() has a lockdep assertion that htt->tx_lock
> > is held. Acquire the lock in a couple of error paths when calling that
> > function to ensure this condition is met.
> >
> > Fixes: 6421969f248fd ("ath10k: refactor tx pending management")
> > Fixes: e62ee5c381c59 ("ath10k: Add support for htt_data_tx_desc_64
> > descriptor")
>
> Fixes tag should be in one line, I fixed that in the pending branch.

Ah, got it. Thanks Kalle!
-Evan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
