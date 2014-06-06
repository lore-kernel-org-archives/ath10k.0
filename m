Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WswQN-0000eb-Go
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 15:51:23 +0000
Message-ID: <5391E363.50907@candelatech.com>
Date: Fri, 06 Jun 2014 08:50:59 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : RE : ath10k: firmware crash in station mode
 & problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <CALhHN=r3eYxgFTRo7zAna3q1qopo21WvzREM=6rQY6hfuQmPeQ@mail.gmail.com>,
 <EE97821C81277E459BEA5C6384C6F241012F109978F2@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>,
 <5386059B.7040301@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>,
 <53889A89.90802@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>,
 <538CAACA.2030202@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>,
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC .local>,
 <538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

On 06/06/2014 02:05 AM, Vu Hai NGUYEN wrote:
>> Ok, the difference must be changes I made to the scanning state machine.
>> That patch was fairly big, and did several different things.  I have split
>> it up into 4 separate patches to try to narrow down where the problem was
>> introduced.
>>
>> Can you try these firmware images in order and let me know the first
>> that fails to do DFS properly?  The scan-1 should be white-space and
>> debugging only, so hopefully it works.
>>
>> firmware-2-community-scan1.bin
>> firmware-2-community-scan2.bin
>> firmware-2-community-scan3.bin
>> firmware-2-community-scan4.bin
>>
>> http://www.candelatech.com/downloads/
> 
> Thank you, I did the test, the first one and second one (scan 1 & 2) can work with DFS, the last 2 cann't.

Ok, looks like the patch where I change the scan state machine logic is the bad one.

I will review it carefully and maybe try splitting it further today.

Are you able to test with a modified kernel?  If so, I can add debuglog
messages to the firmware and give you a kernel ath10k patch to print
those out in the kernel logs so you can send them to me for decoding...


Anyone have any ideas what sorts of problems I might be introducing by
changing around the scan logic?  Normal scanning seems to at least mostly
work...how is DFS special?


> I also retried to test promiscuous mode, may be yesterday I did something wrong when copy-paste the firmware.
> Today I try the 172 commit firmware and it works in promisc mode, so again with binary search I redo my serie of test,
> the different is between 120 (broken firmware) and 121 (non broken). 
> (My serie is: 172 OK => 86 KO => 129 OK => 107 KO => 118 KO => 124 OK => 121 OK => 120 KO, than re-change to 
> confirm the different :D)
> Hope that is helpful for you 

That is interesting...patch 121 is small and just fixes a firmware crash I was seeing
related to null dereference in beacon config logic.  Do you see firmware crashes for
build 120, or does it just silently not work?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
