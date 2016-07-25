Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRh7Z-00022f-W1
 for ath10k@lists.infradead.org; Mon, 25 Jul 2016 14:44:42 +0000
Message-ID: <579625AC.107@candelatech.com>
Date: Mon, 25 Jul 2016 07:43:56 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: 9984 issues
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
 <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>
 <CA+BoTQmrk_U8oVXxk-5hBz60=R-xR4H=2_x2pj9BVDYXPOoCGg@mail.gmail.com>
 <6487f1d3-339e-a6dd-d866-b11b37b4ddff@dd-wrt.com>
 <73ce025f-c583-a747-ee9a-91bbfba56ff4@dd-wrt.com>
In-Reply-To: <73ce025f-c583-a747-ee9a-91bbfba56ff4@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>

On 07/25/2016 07:37 AM, Sebastian Gottschall wrote:
> Hello
>
> finally i received 9984 devices to follow up with my work on vht160.
> but the big issue is. the 9984 works in ap mode with current firmware. but in sta mode it crashes after seconds, no matter which operation mode is used.
> ben's ct firmware crashes in ap and sta mode, so i prefer to run using the offical variant. can someone help here?

Does it crash if you connect to an AP with 9980 or 9880?  I am curious if it is only with
9984 AP that crashes.  I have only one 9984 radio right now, but STA mode was working for me against
9980 AP.

I am just getting started on this, so hopefully it will get more stable soon...

And for the QCA firmware, might be worth posting a stack dump from the firmware,
maybe someone there can decode it.  Unfortunately, I could not get a useful decode
from the one you sent me of my firmware...

Thanks,
Ben

>
> Sebastian
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
