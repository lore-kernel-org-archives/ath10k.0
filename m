Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cZOLI-00021B-1d
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 20:50:58 +0000
Subject: Re: 9984 VHT
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
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
 <14bd9f40-a79c-5032-778f-2f2ae92afccc@dd-wrt.com>
 <c015184f-b94c-5328-3995-5c223c27905a@candelatech.com>
 <53e8f5d9-9f0d-7386-4de2-46f6e1b26c36@dd-wrt.com>
 <941cc332-782e-897b-ba77-4e6682836f68@candelatech.com>
 <dc16858f-11f4-3aa7-01b8-4165cd1aa087@dd-wrt.com>
 <501bfc50-1c80-999a-af78-2da4a7fc00f4@candelatech.com>
 <e3e5492e-1a58-ff2c-bf7c-016a2f19a79b@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <fb1ebe0c-c6b1-ef54-64bb-8a4d4fe3a399@candelatech.com>
Date: Thu, 2 Feb 2017 12:50:35 -0800
MIME-Version: 1.0
In-Reply-To: <e3e5492e-1a58-ff2c-bf7c-016a2f19a79b@dd-wrt.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 02/02/2017 12:45 PM, Sebastian Gottschall wrote:

>>> +       if (arg->mode == MODE_11AC_VHT160)  {
>>> +               ch->band_center_freq1 = __cpu_to_le32(arg->freq);
>>> +               ch->band_center_freq2 = __cpu_to_le32(arg->band_center_freq1);
>>> +       }
>>
>> No, I don't think so.  freq1 should be freq + 40 if freq < center-freq, otherwise
>> should be freq - 40.
> doesnt sound very logic since 80+80 mode doesnt require that voodoo too since it would require another addition field. but i will try it it right now

The firmware change looks pretty lame to me...it was easy for me to make my FW backwards compat
to the old way of just passing in the mhz and the freq1 160mhz center-freq, so really I do not know why
the FW was changed.

I am testing my FW fixes now...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
