Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.leader.jabatus.fr ([109.234.163.41])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d4PnH-0000Ur-WE
 for ath10k@lists.infradead.org; Sat, 29 Apr 2017 10:40:05 +0000
From: Michael Mera <dev@michaelmera.com>
Subject: Re: [RESEND] ath10k: fix out of bounds access to local buffer
In-Reply-To: <87r30fxw7u.fsf@kamboji.qca.qualcomm.com>
References: <20170424071157.6979-1-dev@michaelmera.com>
 <0a7aa133740b4488a19bd95115831988@euamsexm01a.eu.qualcomm.com>
 <87a873wjak.fsf@michaelmera.com> <87r30fxw7u.fsf@kamboji.qca.qualcomm.com>
Date: Sat, 29 Apr 2017 19:39:13 +0900
Message-ID: <877f235wha.fsf@michaelmera.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:
> I actually guessed why you did that. But I want to keep the output of my
> test script clean, makes review a lot easier. Making exceptions to the
> script is more work for me.

Yes, sorry. I found the ath10k specific instructions only after
submitting the patch.

> Anyway, I already did the change in my pending branch and will apply the
> patch in few days. Thanks for the fix.

Thank you,
Michael Mera

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
