Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc5Ff-0002S0-Np
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 07:04:19 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
Date: Fri, 10 Feb 2017 07:03:56 +0000
Message-ID: <87tw82il32.fsf@kamboji.qca.qualcomm.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
 <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
 <87y3xi4b28.fsf@qca.qualcomm.com> <5899DDD7.7000605@candelatech.com>
In-Reply-To: <5899DDD7.7000605@candelatech.com> (Ben Greear's message of "Tue, 
 7 Feb 2017 06:46:47 -0800")
Content-Language: en-US
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
To: Ben Greear <greearb@candelatech.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeusz.slawinski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Ben Greear <greearb@candelatech.com> writes:

> On 02/07/2017 01:14 AM, Valo, Kalle wrote:
>> Adrian Chadd <adrian@freebsd.org> writes:
>>
>>> Removing this method makes the diff to FreeBSD larger, as "vif" in
>>> FreeBSD is a different pointer.
>>>
>>> (Yes, I have ath10k on freebsd working and I'd like to find a way to
>>> reduce the diff moving forward.)
>>
>> I don't like this "(void *) vif->drv_priv" style that much either but
>> apparently it's commonly used in Linux wireless code and already parts
>> of ath10k. So this patch just unifies the coding style.
>
> Surely the code compiles to the same thing, so why add a patch that
> makes it more difficult for Adrian and makes the code no easier to read
> for the rest of us?

Because that's the coding style used already in Linux. It's great to see
that parts of ath10k can be used also in other systems but in principle
I'm not very fond of the idea starting to reject valid upstream patches
because of driver forks.

I think backports project is doing it right, it's not limiting upstream
development in any way and handles all the API changes internally. Maybe
FreeBSD could do something similar?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
