Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFIxi-0005lO-J4
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 14:17:11 +0000
Received: by mail-ot1-x341.google.com with SMTP id e11so11666350otl.5
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2019 07:17:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87imp84nzn.fsf@kamboji.qca.qualcomm.com>
References: <20190906215423.23589-1-chunkeey@gmail.com>
 <20190917064412.C2E0D61572@smtp.codeaurora.org>
 <2099574.gZacamft7q@debian64> <87imp84nzn.fsf@kamboji.qca.qualcomm.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 1 Oct 2019 16:17:05 +0200
Message-ID: <CAKR_QVKVFLacWA+qS1=Tyaew-r_J1y--9N2V+eTCOvn3g=5iUg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: restore QCA9880-AR1A (v1) detection
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
Cc: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Christian Lamparter <chunkeey@gmail.com>

Hey Lamperter, I'm sorry if you feel like I hijacked this thread but
it was in an obvious attempt to prove more can be done than just
returning unsupported message.

However, as the company itself is unwilling to provide firmware and
everybody mention this chip variant in such a negative context there
are obviously some internal reasons to keep it unsupported with
silicon bug or two being used as an excuse. Most chips have some hw
bugs and workarounds for the same are available, but this didn't
result in dropping support for their drivers. So, you can go with this
change, but it won't be that useful or required as few others who
switch to different card in their router won't need it. For the rest
of us 700Mbps with factory TP-Link firmware will suffice.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
