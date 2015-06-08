Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1yGB-0003Qp-SV
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 14:42:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Warnings/errors in use with a QCA989x card
References: <D38B2BA4-0B08-4B7B-A295-E95D1CF3FDBB@gmail.com>
 <CA+BoTQm735L-TQ0ZjSZ2gHud_AwvP+kZAh+Wc4iQtaGSiC2GLw@mail.gmail.com>
 <87sia5lzdh.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkbsuy_zaw+Rg8n3j4b5JCqu3URMivKTPFZFUMEq3fxww@mail.gmail.com>
Date: Mon, 8 Jun 2015 17:42:17 +0300
In-Reply-To: <CA+BoTQkbsuy_zaw+Rg8n3j4b5JCqu3URMivKTPFZFUMEq3fxww@mail.gmail.com>
 (Michal Kazior's message of "Mon, 8 Jun 2015 09:23:27 +0200")
Message-ID: <87y4jugt2u.fsf@kamboji.qca.qualcomm.com>
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
Cc: Matthew Robbetts <wingfeathera@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> I think it'd make more sense to actually update the recommended
> firmware revision. Currently it's still the 10.1.467 in your git. It's
> pretty confusing if you ask me. There's a ton of untested 10.2.4
> images. How does a user know which one to use?

Yeah, that's a mess and I should fix it. At the same time we should
reorganise the git repo entirely so that we can cleanly support various
hardware familes like qca6174. Any ideas how to do that?

And my recommendation is to use the latest firmware version from 10.2.4
branch which at this time is 10.2.4.70-2. I would be queries to receive
feedback how it works for people.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
