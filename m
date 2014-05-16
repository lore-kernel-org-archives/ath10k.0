Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHWQ-00069z-TU
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:45:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Protected flag is clear in Monitor Mode
References: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
Date: Fri, 16 May 2014 15:45:31 +0300
In-Reply-To: <CAEFj986_nUoRY7qOf7=6divui_sa2tMnfjd8vS0w00Mk62GqnA@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Fri, 16 May 2014 12:38:26 +0800")
Message-ID: <87zjih6ges.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> I try to use ath10k (firmware version 10.1.467.2-1_ as standalone
> monitor mode. I assume that monitor mode will allows the frame to pass
> to upper layer without any modification.
>
> But it seems that the protected flag in frame control is clear while I
> capture with wireshark. I has verified that the ath9k has not such
> issue and the protected flag is set.
>
> So is this a known issue in monitor mode for ath10k?

I don't recall anyone mentioning anything like this so I would say this
is not a known issue. But on the other hand, I'm notorious in forgetting
stuff :)

What we really need is a public bug tracker for ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
