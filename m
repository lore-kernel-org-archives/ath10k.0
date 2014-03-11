Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHoZ-0003Kz-Kb
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 08:13:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <871ty9jijp.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-135UdAuQ8AQZOEPqAfv2erkS-eSa1+T8skS5aMNHFp+g@mail.gmail.com>
 <CAJ-Vmo=AX9MzrCuwv_LMBkD6mT97S+c1K1cbLiJLKWx=2im5=A@mail.gmail.com>
Date: Tue, 11 Mar 2014 10:13:01 +0200
In-Reply-To: <CAJ-Vmo=AX9MzrCuwv_LMBkD6mT97S+c1K1cbLiJLKWx=2im5=A@mail.gmail.com>
 (Adrian Chadd's message of "Tue, 11 Mar 2014 00:52:54 -0700")
Message-ID: <87siqpi25u.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

(Fixing top posting)

Adrian Chadd <adrian@freebsd.org> writes:

> On 11 March 2014 00:40, Avery Pennarun <apenwarr@gmail.com> wrote:
>
>> We do have a separate reset line controlled by a GPIO.  Using that
>> crashes the SoC's PCIe host implementation (whee!).  But I got help
>> from the SoC manufacturer and was able to get some instructions for
>> resetting their PCIe host controller.  When I do all the magic
>> incantations in the right order, the system can recover, albeit with a
>> fully reset ath10k chip.  This workaround is unfortunately specific to
>> the host device platform so it won't do you much good.
>
> ... it's not a complete loss!
>
> This to me says "we need a hook from the driver to call the host
> "reset the bus" thing".
>
> We also kinda need it for ath9k/ath5k (if it's not there) so AHB
> attached things can be reset by actually poking an SoC reset register.

Yeah, that kind of hook would be good to have.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
