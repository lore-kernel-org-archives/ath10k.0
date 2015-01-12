Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAdXh-0003Po-FD
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 11:52:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix DMA burst size
References: <1419834066-11802-1-git-send-email-sujith@msujith.org>
 <CA+BoTQ=Vt8BTzZcgxqq4eU+RKhMwNbGrZOOFGL9TcBA3KnrerQ@mail.gmail.com>
 <21677.2491.857663.473071@gargle.gargle.HOWL>
Date: Mon, 12 Jan 2015 13:51:48 +0200
In-Reply-To: <21677.2491.857663.473071@gargle.gargle.HOWL> (Sujith Manoharan's
 message of "Wed, 7 Jan 2015 15:56:03 +0530")
Message-ID: <87ppakdxnv.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sujith Manoharan <sujith@msujith.org> writes:

> Michal Kazior wrote:
>> Since it's for cards/chips why do you enable it for 10.2 only? There's
>> 10.1, main and tlv as well which could possibly benefit from this.
>
> I've not tested it with any of the FW versions other than 10.2 and
> am not sure if older FW support this properly. We could try it
> with 10.1, I guess - but even that is in 'maintenance mode'
> internally.

Yeah, I don't see much point of trying to improve our 10.1 support as
all the new development happens on 10.2 branch. Most important is that
we don't break 10.1 support ("no regressions" rule), but it in no way
does 10.1 need to be in feature parity with 10.2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
