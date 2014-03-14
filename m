Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOLa7-0001rT-FU
 for ath10k@lists.infradead.org; Fri, 14 Mar 2014 06:27:00 +0000
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
 <5321EDF9.6040706@candelatech.com>
Date: Fri, 14 Mar 2014 08:26:29 +0200
In-Reply-To: <5321EDF9.6040706@candelatech.com> (Ben Greear's message of "Thu, 
 13 Mar 2014 10:42:17 -0700")
Message-ID: <87a9ct9tyi.fsf@kamboji.qca.qualcomm.com>
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

>>>> Another question: is there perhaps anything the firmware can do to eg.
>>>> set a watchdog timer, so that the internal CPU will restart (go back
>>>> to "waiting for firmware" mode) if it doesn't answer for a while?  The
>>>> idea would be for the device to un-wedge itself even if there's
>>>> nothing we can do to fix it from outside.
>>>
>>> That's something a firmware engineer should comment on, which I'm not.
>
> Kalle:  Can you feed that question to your firmware contacts
> at QCA?

Sure, I'm trying to solve this warm reset problem and talking with them
anyway. All ideas very welcome how to solve this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
