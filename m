Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuGLs-0004lm-FX
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 07:20:13 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Tue, 10 Jun 2014 09:15:46 +0200
Subject: RE : RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC
 .local>,<538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
In-Reply-To: <5391E363.50907@candelatech.com>
Content-Language: fr-FR
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
To: Ben Greear <greearb@candelatech.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

>Can you please see if this firmware is any better for the DFS issue?
>
>http://www.candelatech.com/downloads/firmware-2-community-scan3-a.bin

Thanks, I check your firmware but it can not fix the problem

>Ok, looks like the patch where I change the scan state machine logic is the bad one.
>
>I will review it carefully and maybe try splitting it further today.
>
>Are you able to test with a modified kernel?  If so, I can add debuglog
>messages to the firmware and give you a kernel ath10k patch to print
>those out in the kernel logs so you can send them to me for decoding...

Sorry I don't really get it, you mean that I can re-compiled ath10k for my own
kernel?  Actually I'm using backport to compile ath10k for my kernel 3.2.36 provided
for my chipset, If so, I can do it. 

>Anyone have any ideas what sorts of problems I might be introducing by
>changing around the scan logic?  Normal scanning seems to at least mostly
>work...how is DFS special?


>> I also retried to test promiscuous mode, may be yesterday I did something wrong when copy-paste the firmware.
>> Today I try the 172 commit firmware and it works in promisc mode, so again with binary search I redo my serie of test,
>> the different is between 120 (broken firmware) and 121 (non broken).
>> (My serie is: 172 OK => 86 KO => 129 OK => 107 KO => 118 KO => 124 OK => 121 OK => 120 KO, than re-change to
>> confirm the different :D)
>> Hope that is helpful for you

>That is interesting...patch 121 is small and just fixes a firmware crash I was seeing
>related to null dereference in beacon config logic.  Do you see firmware crashes for
>build 120, or does it just silently not work?

Yes it crashed once the STA associate to my AP in bridge network (promisc mode)

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
