Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH9tg-0002or-JF
 for ath10k@lists.infradead.org; Wed, 14 Dec 2016 13:47:05 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 05/11] ath10k: htc: refactorization
Date: Wed, 14 Dec 2016 13:46:38 +0000
Message-ID: <871sxay66a.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
 <87inqoymd0.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQkuUFxnra75B4LpF5+k9yE7hkNYDXbtUMBLq2LFuPSasg@mail.gmail.com>
 <871sxbzqo6.fsf@kamboji.qca.qualcomm.com>
 <70b8a055-e6ba-857d-8b03-06f50e3f10fe@gmail.com>
In-Reply-To: <70b8a055-e6ba-857d-8b03-06f50e3f10fe@gmail.com> (Erik
 Stromdahl's message of "Tue, 13 Dec 2016 19:37:30 +0100")
Content-Language: en-US
Content-ID: <895E7102C84BBF418E5CB875030860DF@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> I have made a few updates since I submitted the original RFC and created
> a repo on github:
>
> https://github.com/erstrom/linux-ath
>
> I have a bunch of branches that are all based on the tags on the ath master.
>
> As of this moment the latest version is:
>
> ath-201612131156-ath10k-sdio
>
> This branch contains the original RFC patches plus some addons/fixes.

Good, this makes it easier to follow the development. So what's the
current status with this branch? What works and what doesn't?

Especially I'm interested about the state of the HTT high latency
support. How much work is to add that? It would also make it easier to
add USB support to ath10k.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
