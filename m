Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc53A-00068O-V1
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 06:51:23 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: 9984 VHT
Date: Fri, 10 Feb 2017 06:50:56 +0000
Message-ID: <87y3xeilor.fsf@kamboji.qca.qualcomm.com>
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
In-Reply-To: <2c29c0e6-a207-9d40-fa8d-dc5e54f9c468@dd-wrt.com> (Sebastian
 Gottschall's message of "Tue, 7 Feb 2017 13:39:28 +0100")
Content-Language: en-US
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 07.02.2017 um 13:14 schrieb Valo, Kalle:
>> Ben Greear <greearb@candelatech.com> writes:
>>
>>> On 02/02/2017 10:42 AM, Sebastian Gottschall wrote:
>>>> Am 02.02.2017 um 19:24 schrieb Ben Greear:
>>>>
>>>>> I hacked ath10k to enable radar detection on 160Mhz bandwidths. Now hostapd
>>>>> starts.
>>>>>
>>>>> I can reproduce the FW failure. It is because FW 3.3-25 release
>>>>> started asserting
>>>>> if the freq2 was zero in VHT160 mode. It seems to use both freq1
>>>>> and freq2, and not
>>>>> how the driver or linux seems to normally use them.
>>>> its even worse. starting from 3.3 it uses freq2 instead of freq1.
>>>> but i made a patch for it. but it still wont work. vdev_start still
>>>> fails
>>> Well it would have been helpful from the start to have known about this patch.
>>>
>>> Could you post it?
>>>
>>> Kalle: Since the firmware API changed, how do you want to handle
>>> the differences here?
>>
>> The firmware API shouldn't change like that, but if it has I guess a
>> firmware feature flag to enable a workaround in ath10k sounds like the
>> easiest solution.
>
> the more recent firmware have some new wmi services enabled which can
> be used as indicator as well.

I don't know what flag exactly you are referring to, but using a WMI
service flag to detect this is not really reliable. They can be enabled
or disabled between branches, or even between builds.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
