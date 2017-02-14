Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdevD-000568-Ch
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 15:21:42 +0000
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
 <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
 <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
 <ed765a12-6ae8-ed78-6626-ae82312ba525@dd-wrt.com>
 <8bcf2ea6-802f-f249-8e2d-96ec03553a9b@candelatech.com>
 <23b1bd75-a7f9-08e7-5d7b-f67081b89e1b@candelatech.com>
 <5e23ea91-429e-eff6-7443-e4d4f5981735@dd-wrt.com>
 <785bdbc1-fcf5-921b-2092-6142d51aa0ce@candelatech.com>
 <87poiu42r2.fsf@qca.qualcomm.com>
 <2c29c0e6-a207-9d40-fa8d-dc5e54f9c468@dd-wrt.com>
 <87y3xeilor.fsf@kamboji.qca.qualcomm.com>
 <c894f9ae-068a-eac3-16e6-c1ada4da22b9@dd-wrt.com>
 <87inodrro1.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <83f88c82-0ea5-2962-a385-bf38946c846d@dd-wrt.com>
Date: Tue, 14 Feb 2017 16:21:13 +0100
MIME-Version: 1.0
In-Reply-To: <87inodrro1.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 14.02.2017 um 11:30 schrieb Valo, Kalle:
> (you forgot to CC ath10k list, adding it back)
>
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> Am 10.02.2017 um 07:50 schrieb Valo, Kalle:
>>> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>>>
>>>> Am 07.02.2017 um 13:14 schrieb Valo, Kalle:
>>>>> Ben Greear <greearb@candelatech.com> writes:
>>>>>
>>>>>> On 02/02/2017 10:42 AM, Sebastian Gottschall wrote:
>>>>>>> Am 02.02.2017 um 19:24 schrieb Ben Greear:
>>>>>>>
>>>>>>>> I hacked ath10k to enable radar detection on 160Mhz bandwidths. No=
w hostapd
>>>>>>>> starts.
>>>>>>>>
>>>>>>>> I can reproduce the FW failure. It is because FW 3.3-25 release
>>>>>>>> started asserting
>>>>>>>> if the freq2 was zero in VHT160 mode. It seems to use both freq1
>>>>>>>> and freq2, and not
>>>>>>>> how the driver or linux seems to normally use them.
>>>>>>> its even worse. starting from 3.3 it uses freq2 instead of freq1.
>>>>>>> but i made a patch for it. but it still wont work. vdev_start still
>>>>>>> fails
>>>>>> Well it would have been helpful from the start to have known about t=
his patch.
>>>>>>
>>>>>> Could you post it?
>>>>>>
>>>>>> Kalle: Since the firmware API changed, how do you want to handle
>>>>>> the differences here?
>>>>> The firmware API shouldn't change like that, but if it has I guess a
>>>>> firmware feature flag to enable a workaround in ath10k sounds like the
>>>>> easiest solution.
>>>> the more recent firmware have some new wmi services enabled which can
>>>> be used as indicator as well.
>>> I don't know what flag exactly you are referring to, but using a WMI
>>> service flag to detect this is not really reliable. They can be enabled
>>> or disabled between branches, or even between builds.
>> valid argument. but these flags should than be also introduced in
>> codeaurora images
> I'm not involved with codeaurora images so I can't help with that.
>
> But the firmware is not supposed to break the firmware interface like
> this. Can someone please write a detailed bug report as a reply to this
> mail (what version, from which location, how exactly the interface is
> broken) and I'll try to report the issue internally.
i'm not good in this. but let me try to describe whats wrong
all the current firmware images including your latest 3.3 based suffer =

from this issue.
old behaviour with =

https://github.com/kvalo/ath10k-firmware/raw/master/QCA9984/hw1.0/firmware-=
5.bin_10.4-3.2-00072
center freq is stored in band_center_freq1

new behaviour with =

https://github.com/kvalo/ath10k-firmware/raw/master/QCA9984/hw1.0/3.3/firmw=
are-5.bin_10.4-3.3-00092 =

and all other newers including 3.4 series
center freq is stored in band_center_freq2. where center_freq1 must =

contain the lower or upper side channel depending on the setting

example for new firmware in  ath10k_wmi_put_wmi_channel
         if (arg->mode =3D=3D MODE_11AC_VHT160)  {
                 if (arg->freq < arg->band_center_freq1)
                         ch->band_center_freq1 =3D =

__cpu_to_le32(arg->band_center_freq1 - 40);
                 else
                         ch->band_center_freq1 =3D =

__cpu_to_le32(arg->band_center_freq1 + 40);
                 ch->band_center_freq2 =3D =

__cpu_to_le32(arg->band_center_freq1);
         }

according to some code i found in hostapd this has been made to =

workaround a issue with vht80 capable client who arent able to associate =

with vht160 networks.
the same workaround has been implemented in recent hostapd versions. so =

solving this on firmware side isnt neccessary, but qca was going this way

see also this patch which is now in mainline of hostapd

https://github.com/kaloz/mwlwifi/blob/master/hostapd/700-interoperability-w=
orkaround-for-80%2B80-and-160-MHz-channels

you will clearly see that it is related to the new behaviour of the =

qca9984 firmware (and likelly other vht160mhz capable chipset firmware, =

but i can't check them without having the devices)


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
