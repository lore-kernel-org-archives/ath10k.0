Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLImX-000807-PN
 for ath10k@lists.infradead.org; Wed, 05 Mar 2014 20:51:16 +0000
Message-ID: <53178E29.2000304@candelatech.com>
Date: Wed, 05 Mar 2014 12:50:49 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
 <530F62FD.9060701@candelatech.com>
 <CA+BoTQmE8LjpW3xhwkWoXHLB8M1B1kQMQwBBtcgSw9fJEGv4+A@mail.gmail.com>
 <5314FE92.1090405@candelatech.com>
 <CA+BoTQkTyo_2rLhVOsqDHG+iRo3qrpDHGTO+M=JSj7nN5tuJNA@mail.gmail.com>
 <53160673.9000901@candelatech.com>
 <CA+BoTQmx9iaSKxG6rO4bbrbkAY2d4VkZEPwE+b1vMdR=mPB0nQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmx9iaSKxG6rO4bbrbkAY2d4VkZEPwE+b1vMdR=mPB0nQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 03/05/2014 12:09 AM, Michal Kazior wrote:

> Incorrect. There's actually quite a lot of amsdu with vanilla firmware
> (keep in mind I refer to nwifi rx). In the early days ath10k was
> stiching msdus back just to be teared down again in mac80211 and this
> was hitting performance.

I guess with native wifi you do not see any chained amsdu
frames at ath10k now?  Out of curiosity, how do amsdu frames appear
in ath10k?  Does the firmware take care of everything
before it ever gets to the host for native wifi?

>> What throughputs are you seeing, and what NICs are you using for AP
>> and stations?
> 
> With current master branch CUS223-CUS223 should get over 800mbps in
> udp tx/rx and 700mbps in tcp tx/rx with cabled setup on a poor AP135.
> Since AP135's CPU doesn't have any time to idle around I expect x86 to
> perform better and I don't think OTA should be terribly slower in a
> reasonably clean environment.

Over-the-air, CUS223 wasn't any better than WLE900VX, so probably not
an issue with the NICs.  Arranging the antennas a bit gave me a bit of
a boost, but still only around 600Mbps TCP upload, and download was
still in the 400Mbps range.  There are no APs in scan range in the
lower end of 5Ghz where I am running, so it should be pretty clean.

I cabled WLE900VX NICs up with 30dB attenuation, and I do see about 800Mbps
UDP upload, 700Mbps TCP upload, and 460Mbps TCP download.  Download still
sucks compared to upload for me.

I switched functions:  AP logic moved to STA machine, vice-versa.
The mis-match between upload follows the stations/APs, not the hardware.

(In this test, both machines are using stock 467.1-1 firmware.)

Maybe something with how I am configuring APs interfaces is the problem.

Can you verify that you see similar upload and download speeds for your
test scenario?

Also, at 800Mbps UDP, perf top main offender is a 17% raw spin lock,
but in general my system was not working too hard as far as I can tell.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
