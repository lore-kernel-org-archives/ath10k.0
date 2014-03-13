Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO9eb-0000Ox-DY
 for ath10k@lists.infradead.org; Thu, 13 Mar 2014 17:42:50 +0000
Message-ID: <5321EDF9.6040706@candelatech.com>
Date: Thu, 13 Mar 2014 10:42:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com> <531F5D6F.6060801@candelatech.com>
 <87pplrg71t.fsf@kamboji.qca.qualcomm.com> <532084C3.8060904@candelatech.com>
 <CAHqTa-01MAbTh4ekq8+u-uG_cH=o9SCkpC-fWuMfsPDmfAMCow@mail.gmail.com>
 <87y50ed6rl.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmonGzsdw7WT79jYNU-CtUodza3xpQXsiheC9WyTTRxfsFg@mail.gmail.com>
In-Reply-To: <CAJ-VmonGzsdw7WT79jYNU-CtUodza3xpQXsiheC9WyTTRxfsFg@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

On 03/13/2014 10:34 AM, Adrian Chadd wrote:
> I think the CUS223 has higher transmit power, right?
> 

Yes.

Aside from that, I have not noticed any significant differences.
Thoughput is generally the same as the WLE900VX I have been testing.

Also, I am not sure CUS223 is commercially available for purchase in small-ish
quantities, but perhaps I just didn't look in the right place at the right time.


>>> Another question: is there perhaps anything the firmware can do to eg.
>>> set a watchdog timer, so that the internal CPU will restart (go back
>>> to "waiting for firmware" mode) if it doesn't answer for a while?  The
>>> idea would be for the device to un-wedge itself even if there's
>>> nothing we can do to fix it from outside.
>>
>> That's something a firmware engineer should comment on, which I'm not.

Kalle:  Can you feed that question to your firmware contacts
at QCA?  I'm not sure I should be publicly speculating on such
matters :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
