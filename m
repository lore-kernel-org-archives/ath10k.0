Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHIEt-0003f7-Vv
 for ath10k@lists.infradead.org; Sat, 22 Feb 2014 19:27:56 +0000
Message-ID: <5308FA24.5050005@candelatech.com>
Date: Sat, 22 Feb 2014 11:27:32 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>	<CAEFj984-_Des27n3-wvCScXMX1tntcZXNKZQ8FU_13nNOW2GqA@mail.gmail.com>	<5308F894.7030608@candelatech.com>
 <CAJ-VmonDNU3V7-WdNe4B1+shz35HXsxhgLGgQeDp470c_VmP=Q@mail.gmail.com>
In-Reply-To: <CAJ-VmonDNU3V7-WdNe4B1+shz35HXsxhgLGgQeDp470c_VmP=Q@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, ath10k <ath10k@lists.infradead.org>

On 02/22/2014 11:24 AM, Adrian Chadd wrote:
> Check the firmware source; the MAC is read out of caldata and I
> believe the default is (random three digits) + 12:34:56
>
> So maybe the board didn't reset fully and the OTP or EEPROM didn't
> load? You should be able to read the OTP data via the memory mapped
> registers exposed to the host, as long as you know how to read OTP.
> :-P

Thanks, I'll go poking at that on Monday.  I have never messed with
OTP before, but perhaps I'll get lucky :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
