Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ws2bG-0000w1-Sd
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 04:14:55 +0000
Message-ID: <538E9D26.4040009@candelatech.com>
Date: Tue, 03 Jun 2014 21:14:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>,
 <538CAACA.2030202@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>



On 06/02/2014 11:51 PM, Vu Hai NGUYEN wrote:
>> I could try building a set of binaries and let you bisect the problem, perhaps.
>
>> This might take a bit of your time, but if you are willing, I will write a script
>> to create firmware binaries for each of my commits so you can do a manual
>> bisect.
>
>> I also think that the '2-1' part of the upstream 10.1 firmware is not in the source code
>> QCA made available to me, so there may be upstream fixes I have not seen, and possibly
>> part of that enables/fixes DFS.
>
>> I am not aware of any changes in my firmware that should have broken
>> DFS, but of course with 100+ commits, I could have easily added regressions...
>
> Yes, I'll try it, you can explain it to me if I don't know how to apply your script?

I have a script to build every commit now, but except for the first few
and the last few images, you would need various driver changes to work with them.

I can rebase my firmware changes so that hopefully all (or at least most) of the
images will work on standard kernels, but it may be a few days before I
can get that done.

In the meantime, please try these two:

Compiled from original source received from QCA:

http://www.candelatech.com/downloads/firmware-2-community-commit-0-207ce4b.bin

It appeared to me that that code had a regression, so next commit fixed
that:

http://www.candelatech.com/downloads/firmware-2-community-commit-1-5717c65.bin

If either of these work with DFS, then some change I made later broke it, and I can
build the rest of the images so we can figure out where.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
