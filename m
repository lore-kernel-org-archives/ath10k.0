Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qa0-x22d.google.com ([2607:f8b0:400d:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHIBY-0003d9-1l
 for ath10k@lists.infradead.org; Sat, 22 Feb 2014 19:24:28 +0000
Received: by mail-qa0-f45.google.com with SMTP id m5so4830958qaj.32
 for <ath10k@lists.infradead.org>; Sat, 22 Feb 2014 11:24:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5308F894.7030608@candelatech.com>
References: <5307F7D3.1030703@candelatech.com>
 <CAEFj984-_Des27n3-wvCScXMX1tntcZXNKZQ8FU_13nNOW2GqA@mail.gmail.com>
 <5308F894.7030608@candelatech.com>
Date: Sat, 22 Feb 2014 11:24:06 -0800
Message-ID: <CAJ-VmonDNU3V7-WdNe4B1+shz35HXsxhgLGgQeDp470c_VmP=Q@mail.gmail.com>
Subject: Re: Anyone have luck with WLE900VX?
From: Adrian Chadd <adrian@freebsd.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, ath10k <ath10k@lists.infradead.org>

Check the firmware source; the MAC is read out of caldata and I
believe the default is (random three digits) + 12:34:56

So maybe the board didn't reset fully and the OTP or EEPROM didn't
load? You should be able to read the OTP data via the memory mapped
registers exposed to the host, as long as you know how to read OTP.
:-P


-a


On 22 February 2014 11:20, Ben Greear <greearb@candelatech.com> wrote:
> On 02/21/2014 05:47 PM, Yeoh Chun-Yeow wrote:
>>
>> WLE900VX is dual band card, right? 11ac should work on 5GHz. Is the FW
>> good enough to fall back to 11n when operating in 2.4GHz?
>>
>> I still wait my card to come so haven't tested yet.
>
>
> It appears to be dual band, and it was working at least somewhat
> with my /n AP.  I was on the 5-ghz band though..haven't tested 2.4.
>
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
