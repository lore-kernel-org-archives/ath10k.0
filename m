Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfasO-0007ZZ-7i
 for ath10k@lists.infradead.org; Tue, 07 Apr 2015 21:17:40 +0000
Message-ID: <55244959.6080408@candelatech.com>
Date: Tue, 07 Apr 2015 14:17:13 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS support in ath10k - our test results and questions
References: <2680922.jiTnlqor3W@prime> <550B425A.7090505@candelatech.com>
 <CALhHN=qch721dGPWWjmBb15qwH8gGQprafUEK+XjYu0ajm-tZw@mail.gmail.com>
In-Reply-To: <CALhHN=qch721dGPWWjmBb15qwH8gGQprafUEK+XjYu0ajm-tZw@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Simon Wunderlich <simon@open-mesh.com>, sven@open-mesh.com, marek@open-mesh.com, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/19/2015 11:44 PM, Janusz Dziedzic wrote:
> On 19 March 2015 at 22:40, Ben Greear <greearb@candelatech.com> wrote:

> Regarding IBSS/RSN and 636 firmware, this works sometimes (ath10k
> patch required here).
> But in case this don't work firmware don't send EAPOL frames - I think
> this is main problem ...

I've been trying to figure out IBSS + RSN in my firmware.

It seems in my FW I was never (or at least rarely) sending the EAPOL
frames.  I found a way around this, but now I see 1/4 go out fine,
but 2/4 reports MIC errors.  I don't think my work-around is to blame,
but it could be.  Also not sure why my work-around is required (or at least
why STA/AP mode works w/out the hack.)

A big part of my problem is that I don't actually know how IBSS + RSN
is supposed to work.

If someone has time to clue me in on that, I might make faster progress
(or progress at all) on supporting IBSS + RSN on ath10k.

In particular, I am curious when what type of key is supposed to
be set at which stages...and for instance, what is supposed to happen
between the 1/4 message and the 2/4 message (are keys supposed to be set?)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
