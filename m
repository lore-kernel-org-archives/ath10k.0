Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNeRU-0001Nr-6z
 for ath10k@lists.infradead.org; Wed, 12 Mar 2014 08:23:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <531F5D6F.6060801@candelatech.com>
Date: Wed, 12 Mar 2014 10:22:38 +0200
In-Reply-To: <531F5D6F.6060801@candelatech.com> (Ben Greear's message of "Tue, 
 11 Mar 2014 12:01:03 -0700")
Message-ID: <87pplrg71t.fsf@kamboji.qca.qualcomm.com>
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
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

Ben Greear <greearb@candelatech.com> writes:

> On 03/11/2014 12:33 AM, Kalle Valo wrote:
> oes this ring a bell for anyone?  I think I can also export the
>>> traces as csv in case someone wants to look at them.
>> 
>> I showed your analysis to an HW engineer and the response I got was
>> "don't do that" (= don't use the cold reset).
>
> Earlier (1/22/14), you said a cold reset problem in CUS223 was due primarily to
> a bad piece of hardware (or bad design, or something) in the CUS223.
>
> I guess the problem must extend to other NICs as well, and
> maybe other reasons for causing the hangs?

I don't know the details, but I understood this only happens on CUS223.
If someone has seen these cold reset problems on other boards, like
XB140, I would be very keen to hear about it.

> Anything we can do to help debug the problem with warm resets
> failing to work properly in some cases?

Thanks, but not right now there isn't anything. Once I have new ideas
for the warm reset problems, I'll post them here. Testing those would be
very useful.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
