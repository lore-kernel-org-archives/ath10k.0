Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clxqq-0007Bg-8E
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 13:11:30 +0000
Received: by mail-wm0-x241.google.com with SMTP id v190so10856895wme.3
 for <ath10k@lists.infradead.org>; Thu, 09 Mar 2017 05:11:07 -0800 (PST)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: QCA4019: calibration files and board files
Date: Thu, 09 Mar 2017 14:11:04 +0100
Message-ID: <3868483.qRteKqzzW4@debian64>
In-Reply-To: <2093425.PaQnjOtWUV@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
 <87shmm4qk9.fsf@kamboji.qca.qualcomm.com> <2093425.PaQnjOtWUV@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, ext.waldemar.rymarkiewicz@tieto.com, "simon.wunderlich@openmesh.com" <simon.wunderlich@openmesh.com>

On Thursday, March 9, 2017 1:46:00 PM CET Sven Eckelmann wrote:
> On Donnerstag, 9. M=E4rz 2017 11:51:13 CET Valo, Kalle wrote:
> [...]
> > I haven't followed the discussion very closely, so I might be way off,
> > but for laptop SMBIOS implementations Waldemar added a variant field to
> > board-2.bin so that we can have multiple images for the same subsystem
> > id. Could it help here also?
> > =

> > https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/
> > ?h=3Dath-next&id=3D1657b8f84ed9fc1d2a100671f1d42d6286f20073
> =

> Thanks for the pointer.
I've added Waldemar.

From what I can tell, adding something like a variant to the bmi-id would
help. I looked at the patch note and it strikes me a bit odd that the
used variant was a non-descriptive "DE_1AB" string? Isn't this bit arbitrar=
y?
What is encoded in these variant strings? Are these variants "unique"? =

Who will distribute these special board-2.bin that contain all the =

different variants?

Also the patch says that if the variant isn't found, it will fall back to
the default. In case of the Asus RT-AC58U, this will not really work.
From what I can tell, ASUS added a PA chip and 5 dBi Antennas. They had to
redo the calibration and ended up with different values for the PA, AGC, =

Edges, Slobes, the lot... However, they kept the the project/customer id.
So the board-2.bin found on codeaurora and in the ath10k-repository will
not work.

> =

> I also saw this morning but haven't invested a lot of time when I saw it.=
 But =

> let's play around with some ideas around "variant". Maybe someone else ha=
s =

> some better ideas or comments.
> =

> The information about the variant has to come from somewhere. Currently, =
the =

> OTP binary is returning only the bmi-chip-id and bmi-board-id. There does=
n't =

> seem to be any "project"/"customer" id returned by it (even when it exist=
s in =

> the EEPROM). And even when there would be, the already existing devices d=
on't =

> seem to have it and i don't know if QCA actually allocates them for custo=
mers. =

> I would therefore postpone the use of pre-cal data to generate the the va=
riant =

> string for now (but I will ask the ODM to get some info from QCA).
> =

> Let us see how the SMBIOS does it. dmi_walk is used to go through the ent=
ries =

> and search for the entry. We don't have this here. So let's check what we=
 have =

> with the QCA4019
> =

> This looks at least like a doable thing with the device tree. It must be =
a =

> string but this can easily be stored in the device tree itself. =

> =

> The RT-AC58U  could therefore have following entries:
> =

>     		wifi@a000000 {
>     			status =3D "okay";
>     			qcom,ath10k-calibration-variant =3D "RT-AC58U";
>     		};
>     =

>     		wifi@a800000 {
>     			status =3D "okay";
>     			qcom,ath10k-calibration-variant =3D "RT-AC58U";
>     		};
> =

> Some code has to be added to ath10k_core_probe_fw. I can prepare this lat=
er =

> (when I find the time).
> =

> The board-2.bin would then require entries for bus=3Dahb,bmi-chip-id=3D0,=
bmi-
> board-id=3D16,variant=3DRT-AC58U and bus=3Dahb,bmi-chip-id=3D0,bmi-board-
> id=3D17,variant=3DRT-AC58U.
This brings up a issue: Who will distribute these board-2.bin?
I would prefer them being added to the codeaurora or the
ath10k-firmware repository. Will this be possible? =


Thanks,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
