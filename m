Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHICZ-0003eM-R9
 for ath10k@lists.infradead.org; Sat, 22 Feb 2014 19:25:32 +0000
Message-ID: <5308F98F.3060700@candelatech.com>
Date: Sat, 22 Feb 2014 11:25:03 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <CAEFj984-_Des27n3-wvCScXMX1tntcZXNKZQ8FU_13nNOW2GqA@mail.gmail.com>
 <CAJ-VmokWO4Linm=7R5JvX9ELvvci0S8V1YZ2dSXhpqQ3BD8trA@mail.gmail.com>
In-Reply-To: <CAJ-VmokWO4Linm=7R5JvX9ELvvci0S8V1YZ2dSXhpqQ3BD8trA@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/21/2014 07:13 PM, Adrian Chadd wrote:
> On 21 February 2014 17:47, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> WLE900VX is dual band card, right? 11ac should work on 5GHz. Is the FW
>> good enough to fall back to 11n when operating in 2.4GHz?
>>
>> I still wait my card to come so haven't tested yet.
>
>
> .. sounds like it doesn't have any OTP on the NIC.
>
> Is it perhaps designed to mate to a board with calibration data on the
> SoC board, rather than NIC?

It appears to be a standard stand-alone mini-pci-e NIC.  Possibly firmware changes
are needed to make it able to read the OTP or whatever similar thing holds
that information on this NIC.

Maybe the upstream .467 firmware crashed because of some changes I made to ath10k
driver, so I'll try backing those out next week and will test again.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
