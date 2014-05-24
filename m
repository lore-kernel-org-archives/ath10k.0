Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WoEae-0007jA-M6
 for ath10k@lists.infradead.org; Sat, 24 May 2014 16:14:33 +0000
Message-ID: <5380C54E.7060800@candelatech.com>
Date: Sat, 24 May 2014 09:14:06 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: TR : ath10k: firmware crash in station mode
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>	<EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>	<5370F41A.70202@candelatech.com>	<CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>	<53719332.9040700@candelatech.com>	<EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>	<EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>	<CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>	<EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>	<EE97821C81277E459BEA5C6384C6F241012F109978EF@srvexch01.SODIELEC.local>	<CAEFj985+HSVXZ611v6ERGxXfn9AOw_OQB37SKVP+o0r0KHP17w@mail.gmail.com>	<537F7135.7030109@candelatech.com>
 <CAJ+vNU39FSOfjJv=hSPKc-9usaAkfxvP=ksout0iXTss20WtUg@mail.gmail.com>
In-Reply-To: <CAJ+vNU39FSOfjJv=hSPKc-9usaAkfxvP=ksout0iXTss20WtUg@mail.gmail.com>
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
To: Tim Harvey <tharvey@gateworks.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 05/23/2014 11:29 PM, Tim Harvey wrote:
> On Fri, May 23, 2014 at 9:03 AM, Ben Greear <greearb@candelatech.com> wrote:
>> On 05/23/2014 08:36 AM, Yeoh Chun-Yeow wrote:
>>> Based on my testing, due to firmware 636 is not able to support
>>> standalone monitor mode, and bridge requires promiscuous mode, it
>>> would crash. Then, I have tested with AP firmware and it works well.
>>> But then, I have not up the node for long time.
>>>
>>> By the way, I am associating the AP before setting "iw dev wlan0 set
>>> 4addr on" and bridge it.
>>
>> Well, if nothing else, you could try my firmware, with a small patch to
>> make it work on standard kernels.  If you can crash it, send me the
>> firmware crash message and I'll see if I can fix it.
>>
>> Current binary is non-commercial, but I will shortly have a free-for-whatever-use
>> binary that has everything except the multiple-vif-to-same-ap-with-encryption
>> feature.  Virtually no one except folks like us doing wifi testing equipment
>> needs that feature....
>>
>> My firmware has been fairly well tested with my patched kernel and in
>> station and AP mode.  I'm sure there are still bugs, but I will try
>> to fix them, at least.
>>
>> http://www.candelatech.com/vsta.php
>>
>> Thanks,
>> Ben
>>
>
> Ben,
>
> I tried using your firmware on a 3.14 kernel without any luck. I don't
> see any errors, but the sta never associates nor see's any ap on scan.
> I followed http://www.candelatech.com/vsta.php step 4 and step 6 and
> did this on OpenWrt, so the udev stuff doesn't apply.

Skip step 6 unless you are using my kernel.  Just step 4 for upstream
kernels.  I need to make a separate page for folks just using my CT
firmware on normal kernels doing normal things...

No arguments with the rest of your email :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
