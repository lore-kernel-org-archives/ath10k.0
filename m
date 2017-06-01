Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dGHOo-0005md-RK
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 04:07:52 +0000
Subject: Re: ath10k Issue with eduroam?
References: <CA+ssr=fOa4NfGyg0VOe7KW2W=nDAO0o6v_c=7LHx04Eqz80WUw@mail.gmail.com>
 <87wp8yo40s.fsf@kamboji.qca.qualcomm.com>
 <CAJ-Vmomfy-cUf2dzznOZZH3uMexh-+2LseSXrY-CxVf12fGw8A@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <c2be103c-c3b7-52db-2aa4-06c1a8ba8858@candelatech.com>
Date: Wed, 31 May 2017 21:07:27 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmomfy-cUf2dzznOZZH3uMexh-+2LseSXrY-CxVf12fGw8A@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Blair Robert Drummond <bdrum047@uottawa.ca>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I hacked quite a bit on the rate-ctrl, and have tested in /b, /g, a, n, and /AC modes.

Blair, if you want, please try my firmware (beta-19) and see if it works
better.  If it crashes, send me dmesg and I will try to debug it.

http://www.candelatech.com/ath10k-10.1.php

Thanks,
Ben


On 05/31/2017 08:05 PM, Adrian Chadd wrote:
> oooooh
>
> is the NIC /disappearing/ or firmware crashing?
>
> There are ... and I know someone's going to slap me, but firmware/rate
> control bugs in STA mode on these chips in 11bg (not n, not ac) modes.
> I can't (yet) get eyeballs at QCA on it to fix them :(
>
>
>
> -adrian
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
