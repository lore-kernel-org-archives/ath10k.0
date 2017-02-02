Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZOYi-0006XQ-Ki
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 21:04:51 +0000
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
 <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
 <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
 <ed765a12-6ae8-ed78-6626-ae82312ba525@dd-wrt.com>
 <8bcf2ea6-802f-f249-8e2d-96ec03553a9b@candelatech.com>
 <23b1bd75-a7f9-08e7-5d7b-f67081b89e1b@candelatech.com>
 <5e23ea91-429e-eff6-7443-e4d4f5981735@dd-wrt.com>
 <785bdbc1-fcf5-921b-2092-6142d51aa0ce@candelatech.com>
 <14bd9f40-a79c-5032-778f-2f2ae92afccc@dd-wrt.com>
 <c015184f-b94c-5328-3995-5c223c27905a@candelatech.com>
 <53e8f5d9-9f0d-7386-4de2-46f6e1b26c36@dd-wrt.com>
 <941cc332-782e-897b-ba77-4e6682836f68@candelatech.com>
 <dc16858f-11f4-3aa7-01b8-4165cd1aa087@dd-wrt.com>
 <501bfc50-1c80-999a-af78-2da4a7fc00f4@candelatech.com>
 <e3e5492e-1a58-ff2c-bf7c-016a2f19a79b@dd-wrt.com>
 <fb1ebe0c-c6b1-ef54-64bb-8a4d4fe3a399@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <11581bd9-2f7e-a778-1cfa-36e73611039b@dd-wrt.com>
Date: Thu, 2 Feb 2017 22:04:33 +0100
MIME-Version: 1.0
In-Reply-To: <fb1ebe0c-c6b1-ef54-64bb-8a4d4fe3a399@candelatech.com>
Subject: Re: 9984 VHT
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

this code here has been used

         if (arg->mode =3D=3D MODE_11AC_VHT160)  {
                 if (arg->freq < arg->band_center_freq1)
                         ch->band_center_freq1 =3D __cpu_to_le32(arg->freq =

+ 40);
                 else
                         ch->band_center_freq1 =3D __cpu_to_le32(arg->freq =

- 40);
                 ch->band_center_freq2 =3D =

__cpu_to_le32(arg->band_center_freq1);
         }


Am 02.02.2017 um 21:50 schrieb Ben Greear:
> On 02/02/2017 12:45 PM, Sebastian Gottschall wrote:
>
>>>> +       if (arg->mode =3D=3D MODE_11AC_VHT160)  {
>>>> +               ch->band_center_freq1 =3D __cpu_to_le32(arg->freq);
>>>> +               ch->band_center_freq2 =3D =

>>>> __cpu_to_le32(arg->band_center_freq1);
>>>> +       }
>>>
>>> No, I don't think so.  freq1 should be freq + 40 if freq < =

>>> center-freq, otherwise
>>> should be freq - 40.
>> doesnt sound very logic since 80+80 mode doesnt require that voodoo =

>> too since it would require another addition field. but i will try it =

>> it right now
>
> The firmware change looks pretty lame to me...it was easy for me to =

> make my FW backwards compat
> to the old way of just passing in the mhz and the freq1 160mhz =

> center-freq, so really I do not know why
> the FW was changed.
>
> I am testing my FW fixes now...
>
> Thanks,
> Ben
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
