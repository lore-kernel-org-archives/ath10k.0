Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO9be-0000Dt-Am
 for ath10k@lists.infradead.org; Thu, 13 Mar 2014 17:39:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <531F5D6F.6060801@candelatech.com>
 <87pplrg71t.fsf@kamboji.qca.qualcomm.com>
 <532084C3.8060904@candelatech.com>
 <CAHqTa-01MAbTh4ekq8+u-uG_cH=o9SCkpC-fWuMfsPDmfAMCow@mail.gmail.com>
 <87y50ed6rl.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmonGzsdw7WT79jYNU-CtUodza3xpQXsiheC9WyTTRxfsFg@mail.gmail.com>
Date: Thu, 13 Mar 2014 19:39:18 +0200
In-Reply-To: <CAJ-VmonGzsdw7WT79jYNU-CtUodza3xpQXsiheC9WyTTRxfsFg@mail.gmail.com>
 (Adrian Chadd's message of "Thu, 13 Mar 2014 10:34:26 -0700")
Message-ID: <87ha72ath5.fsf@kamboji.qca.qualcomm.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

Adrian Chadd <adrian@freebsd.org> writes:

> I think the CUS223 has higher transmit power, right?

That's true. I was told CUS223 uses external PA which makes it possible
to use higher transmit power. XB143 uses FEM and hence the power is less
than on CUS223.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
