Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGGQU-0001T3-9M
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 03:05:31 +0000
Received: by mail-wm0-x230.google.com with SMTP id b84so140943259wmh.0
 for <ath10k@lists.infradead.org>; Wed, 31 May 2017 20:05:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wp8yo40s.fsf@kamboji.qca.qualcomm.com>
References: <CA+ssr=fOa4NfGyg0VOe7KW2W=nDAO0o6v_c=7LHx04Eqz80WUw@mail.gmail.com>
 <87wp8yo40s.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 31 May 2017 20:05:05 -0700
Message-ID: <CAJ-Vmomfy-cUf2dzznOZZH3uMexh-+2LseSXrY-CxVf12fGw8A@mail.gmail.com>
Subject: Re: ath10k Issue with eduroam?
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
Cc: Blair Robert Drummond <bdrum047@uottawa.ca>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

oooooh

is the NIC /disappearing/ or firmware crashing?

There are ... and I know someone's going to slap me, but firmware/rate
control bugs in STA mode on these chips in 11bg (not n, not ac) modes.
I can't (yet) get eyeballs at QCA on it to fix them :(



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
