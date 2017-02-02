Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZMk7-0006G3-9v
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 19:08:30 +0000
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
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <14bd9f40-a79c-5032-778f-2f2ae92afccc@dd-wrt.com>
Date: Thu, 2 Feb 2017 20:08:10 +0100
MIME-Version: 1.0
In-Reply-To: <785bdbc1-fcf5-921b-2092-6142d51aa0ce@candelatech.com>
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

Am 02.02.2017 um 20:05 schrieb Ben Greear:
> On 02/02/2017 10:42 AM, Sebastian Gottschall wrote:
>> Am 02.02.2017 um 19:24 schrieb Ben Greear:
>>> On 02/02/2017 08:18 AM, Ben Greear wrote:
>>>> On 02/01/2017 10:45 AM, Sebastian Gottschall wrote:
>>>>> Am 01.02.2017 um 17:48 schrieb Ben Greear:
>>>>>> On 01/30/2017 02:28 AM, Sebastian Gottschall wrote:
>>>>>>> Hello
>>>>>>>
>>>>>>> with recent 9984 firmares vht160 seem to crash the firmware =

>>>>>>> itself for no reason i see.
>>>>>>> is there any internal structure change in these newer firmwares =

>>>>>>> we need to consider?
>>>>>>> i also tested the even more recent firmware =

>>>>>>> firmware-5.bin_10.4-3.4-00068 from codeaurora. this one doesnt =

>>>>>>> crash but the vdev_start returns with a error
>>>>>>>
>>>>>>> i compared the more recent wmi headers from the qca drivers, but =

>>>>>>> wasnt able to find anything which could explain the behaviour
>>>>>>>
>>>>>>> Sebastian
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> Hello Sebastian,
>>>>>>
>>>>>> Could you share the hostapd/supplicant config file you are using?
>>>>>>
>>>>>> And, what kernel (or backports kernel) are you using? I'd like to
>>>>>> see how 160Mhz works on my firmware....
>>>>> always state of art for sure
>>>>
>>>> Using a somewhat hacked 4.9.2+ kernel and my CT firmware, I get =

>>>> failure to start CAC:
>>>>
>>>> 1486052184.818710: Mode: IEEE 802.11a  Channel: 100 Frequency: 5500 =

>>>> MHz
>>>> 1486052184.818714: DFS 8 channels required radar detection
>>>> 1486052184.818717: DFS all channels available, (SKIP CAC): no
>>>> 1486052184.818719: DFS 0 chans unavailable - choose other channel: no
>>>> 1486052184.818722: vap0: interface state COUNTRY_UPDATE->DFS
>>>> 1486052184.818725: DFS start CAC on 5500 MHz
>>>> 1486052184.818733: vap0: DFS-CAC-START freq=3D5500 chan=3D100 =

>>>> sec_chan=3D1, width=3D2, seg0=3D114, seg1=3D0, cac_time=3D60s
>>>> 1486052184.818737: nl80211: Start radar detection (CAC) 5500 MHz =

>>>> (ht_enabled=3D1, vht_enabled=3D1, bandwidth=3D160 MHz, cf1=3D5570 MHz, =

>>>> cf2=3D0 MHz)
>>>> 1486052184.818742:   * freq=3D5500
>>>> 1486052184.818745:   * vht_enabled=3D1
>>>> 1486052184.818747:   * ht_enabled=3D1
>>>> 1486052184.818749:   * bandwidth=3D160
>>>> 1486052184.818751:   * channel_width=3D5
>>>> 1486052184.818754:   * center_freq1=3D5570
>>>> 1486052184.818756:   * center_freq2=3D0
>>>> 1486052184.823437: nl80211: Failed to start radar detection: -16 =

>>>> (Device or resource busy)
>>>> 1486052184.823444: DFS start_dfs_cac() failed, -1
>>>>
>>>>
>>>> I'll go dig around to see if I can figure out why...
>>>
>>> I hacked ath10k to enable radar detection on 160Mhz bandwidths. Now =

>>> hostapd
>>> starts.
>>>
>>> I can reproduce the FW failure.  It is because FW 3.3-25 release =

>>> started asserting
>>> if the freq2 was zero in VHT160 mode.  It seems to use both freq1 =

>>> and freq2, and not
>>> how the driver or linux seems to normally use them.
>> its even worse. starting from 3.3 it uses freq2 instead of freq1. but =

>> i made a patch for it. but it still wont work. vdev_start still fails
>
> Well it would have been helpful from the start to have known about =

> this patch.
i wasnt sure about it at that time. since it did not work
>
> Could you post it?
--- wmi.c       (revision 3267)
+++ wmi.c       (working copy)
@@ -1637,11 +1637,12 @@
                 flags |=3D WMI_CHAN_FLAG_DFS;

         ch->mhz =3D __cpu_to_le32(arg->freq);
+       ch->band_center_freq2 =3D 0;
         ch->band_center_freq1 =3D __cpu_to_le32(arg->band_center_freq1);
         if (arg->mode =3D=3D MODE_11AC_VHT80_80)
                 ch->band_center_freq2 =3D =

__cpu_to_le32(arg->band_center_freq2);
-       else
-               ch->band_center_freq2 =3D 0;
+       if (arg->mode =3D=3D MODE_11AC_VHT160)
+               ch->band_center_freq2 =3D =

__cpu_to_le32(arg->band_center_freq1);
         ch->min_power =3D arg->min_power;
         ch->max_power =3D arg->max_power;
         ch->reg_power =3D arg->max_reg_power;

>
> Kalle:  Since the firmware API changed, how do you want to handle the =

> differences here?
>
> Thanks,
> Ben
>
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
