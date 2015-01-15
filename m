Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBejj-0002Kw-WD
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 07:21:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
 <21685.35179.110539.780864@gargle.gargle.HOWL>
 <CA+BoTQmNkVKyeWB0fCFhG2MfMZYTz6Dp4+cs44Dm4HCKjTc3Zw@mail.gmail.com>
 <21686.15337.153726.847995@gargle.gargle.HOWL>
 <CA+BoTQkX1KFxpyiotADSaFaEea5BrmgvWLTaSRgMbKzHHP=a2Q@mail.gmail.com>
Date: Thu, 15 Jan 2015 09:19:57 +0200
In-Reply-To: <CA+BoTQkX1KFxpyiotADSaFaEea5BrmgvWLTaSRgMbKzHHP=a2Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 14 Jan 2015 11:12:37 +0100")
Message-ID: <87fvbc1peq.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Sujith Manoharan <sujith@msujith.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> I'm starting to think tasklets are plain evil for network drivers :P

They are. Actually I remember years ago seeing a discussion about
removing tasklets altogether. But obviously it didn't go anywhere as we
still have them.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
