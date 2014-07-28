Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBg3e-00025a-No
 for ath10k@lists.infradead.org; Mon, 28 Jul 2014 08:13:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] extract seqno from sta->last_seq_ctrl
References: <CABnBrYV27yNECG6PPWp2Gsz5w3azbEzGc4n5TcfavvUBbN8U_g@mail.gmail.com>
Date: Mon, 28 Jul 2014 11:12:52 +0300
In-Reply-To: <CABnBrYV27yNECG6PPWp2Gsz5w3azbEzGc4n5TcfavvUBbN8U_g@mail.gmail.com>
 (Denton Gentry's message of "Sun, 27 Jul 2014 10:51:01 -0700")
Message-ID: <87lhrdlx4r.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Denton Gentry <denton.gentry@gmail.com> writes:

>>From d0647db58d13533e5441c07f95b23e912976c87b Mon Sep 17 00:00:00 2001
> From: Denton Gentry <denton.gentry@gmail.com>
> Date: Sun, 27 Jul 2014 08:24:36 -0700
> Subject: [PATCH] extract seqno from sta->last_seq_ctrl
>
> This depends on:
> * [PATCH v2] mac80211: add support for Rx reordering offloading
>
> sta->last_seq_ctrl is the seq_ctrl field from the last
> header seen, need to byteswap and shift it 4 bits to
> extract the sequence number.

I'll let Michal comment on the bug, but I cannot do anything with this
patch as it doesn't have the Signed-off-by tag. Can you resend, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
