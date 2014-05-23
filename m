Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnrwJ-0006UQ-PU
 for ath10k@lists.infradead.org; Fri, 23 May 2014 16:03:24 +0000
Message-ID: <537F7135.7030109@candelatech.com>
Date: Fri, 23 May 2014 09:03:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: TR : ath10k: firmware crash in station mode
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
 <CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EF@srvexch01.SODIELEC.local>
 <CAEFj985+HSVXZ611v6ERGxXfn9AOw_OQB37SKVP+o0r0KHP17w@mail.gmail.com>
In-Reply-To: <CAEFj985+HSVXZ611v6ERGxXfn9AOw_OQB37SKVP+o0r0KHP17w@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 05/23/2014 08:36 AM, Yeoh Chun-Yeow wrote:
> Based on my testing, due to firmware 636 is not able to support
> standalone monitor mode, and bridge requires promiscuous mode, it
> would crash. Then, I have tested with AP firmware and it works well.
> But then, I have not up the node for long time.
> 
> By the way, I am associating the AP before setting "iw dev wlan0 set
> 4addr on" and bridge it.

Well, if nothing else, you could try my firmware, with a small patch to
make it work on standard kernels.  If you can crash it, send me the
firmware crash message and I'll see if I can fix it.

Current binary is non-commercial, but I will shortly have a free-for-whatever-use
binary that has everything except the multiple-vif-to-same-ap-with-encryption
feature.  Virtually no one except folks like us doing wifi testing equipment
needs that feature....

My firmware has been fairly well tested with my patched kernel and in
station and AP mode.  I'm sure there are still bugs, but I will try
to fix them, at least.

http://www.candelatech.com/vsta.php

Thanks,
Ben


> 
> ----
> Chun-Yeow
> 
> On Fri, May 23, 2014 at 10:55 PM, Vu Hai NGUYEN
> <vh.nguyen@actiasodielec.fr> wrote:
>>> Yes, you can do it with firmware 10.1.467.2-1 but not firmware 999.999.0.636.
>>
>> They all crashed, but the 999 crashed sooner (even before associated with the AP) , I've posted it the logs before for Michal Kazior. Here is my old email:
>> http://lists.infradead.org/pipermail/ath10k/2014-May/002042.html
>>
>>>> This is NULL dereference in firmware. I suspect it's an incomplete
>>>> driver-firmware setup (i.e. some commands weren't issued or were
>>>> invalid).
>>
>>>> Can you enable debug logs ( echo 0xffffff3f | sudo tee /sys/module/ath10k_core/parameters/debug_mask ) before you try to
>>>> associate and post logs, please? I'd like to see command sequence sent
>>>> to firmware before the crash happens.
>>
>>> I enable directly the debug_mask when I load the module "modprobe ath10k_core.ko debug_mask=0x0xffffff3f" (I thought it is the same thing like what you do, right?).
>>> You can found de debug mess in the attached file (debug_10-1.txt). (line 3007: wlan0: associated and then in line 3008: ath10k: firmware crashed!)
>>
>>>> Can you post the crash logs (as noted above) when you try the 999
>>>> branch too, please? It seems 999 crashes sooner than 10.1. It might be
>>>> helpful to see the different crash points.
>>
>>> Yes it crashed sooner. There are no wlan0: associated in the debug message. (attached file: debug_999.txt).
>>
>>
>> NGUYEN Vu Hai
>> Acita-Sodielec
>> Route de Mayres - B.P. 9
>> 12100 St GEORGES DE LUZENCON
>> FRANCE
>>
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
