Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrVPT-0007JO-Gw
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 16:48:32 +0000
Message-ID: <538CAACA.2030202@candelatech.com>
Date: Mon, 02 Jun 2014 09:48:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <87lhttwyos.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E8@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E9@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EA@srvexch01.SODIELEC.local>
 <CALhHN=qsgcL04x+vsXgmHnSr5H-aoQW7oC5Y+NmCZCLS1DWGAQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F0@srvexch01.SODIELEC.local>
 <CAFED-j=i5uhjqaJYL+dm_ui48EFeHG3isHYSSSo=+3gk-Wa5YQ@mail.gmail.com>,
 <CALhHN=r3eYxgFTRo7zAna3q1qopo21WvzREM=6rQY6hfuQmPeQ@mail.gmail.com>,
 <EE97821C81277E459BEA5C6384C6F241012F109978F2@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978F4@srvexch01.SODIELEC.local>,
 <5386059B.7040301@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>,
 <53889A89.90802@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>
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

On 06/02/2014 09:16 AM, Vu Hai NGUYEN wrote:
>>> Your firmware allows me  to enter the promiscuous mode to set up bridge network for myStation (using wpa_supplicant), If I use the official firmware (10.1.467-2.1) for my station, it crashed after associated with an AP. Thing that I've >>changed concern the backport, I disable monitor interface in AP mode to solve the connection problem in a channel using DFS and it doesn't concern your firmware.
> 
>> Thanks for the confirmation.  I haven't tested bridged networks yet, but maybe you were
>> hitting some more general firmware problem that I had already fixed.
> 
> Hi Ben, I just discover something news, when I run my program with your firmware, I can not see a channel DFS (from command "iw wlan0 scan", it does not show me the network using a channel DFS). 
> I can see the channel DFS if I use the official firmware (both 999 or 10.1). Do you need me to trace back something so that you can detect where the problem is? 

I could try building a set of binaries and let you bisect the problem, perhaps.

This might take a bit of your time, but if you are willing, I will write a script
to create firmware binaries for each of my commits so you can do a manual
bisect.

I also think that the '2-1' part of the upstream 10.1 firmware is not in the source code
QCA made available to me, so there may be upstream fixes I have not seen, and possibly
part of that enables/fixes DFS.

I am not aware of any changes in my firmware that should have broken
DFS, but of course with 100+ commits, I could have easily added regressions...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
