Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsIvb-0005Re-Hj
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 21:41:00 +0000
Message-ID: <538F9255.1060101@candelatech.com>
Date: Wed, 04 Jun 2014 14:40:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : ath10k: firmware crash in station mode & problem
 DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>,
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC
 .local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC.local>
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

On 06/04/2014 02:20 AM, Vu Hai NGUYEN wrote:
>> I have a script to build every commit now, but except for the first few
>> and the last few images, you would need various driver changes to work with them.
> 
>> I can rebase my firmware changes so that hopefully all (or at least most) of the
>> images will work on standard kernels, but it may be a few days before I
>> can get that done.
> 
>> In the meantime, please try these two:
> 
>> Compiled from original source received from QCA:
> 
>> http://www.candelatech.com/downloads/firmware-2-community-commit-0-207ce4b.bin
> 
>> It appeared to me that that code had a regression, so next commit fixed
>> that:
> 
>> http://www.candelatech.com/downloads/firmware-2-community-commit-1-5717c65.bin
> 
>> If either of these work with DFS, then some change I made later broke it, and I can
>> build the rest of the images so we can figure out where.
> 
> Both firmware in the link that you gave me work well, my station associate directly with the AP after running wpa_supplicant.
> But then I re-put your firmware version non commercial, my STA did not associate directly after running wpa_supp, it keep print the message SCAN EVENT STARTED of wlan0. 
> I run "iw wlan0 scan" and some times it can see and associate with my AP, some times it can not see the network with channel DFS, I mean it is not stable.

Ok, I have built an image for each of my commits, and I have attempted to rebase my changes
so that these kernels should work on un-patched drivers.  I have not actually tested these
various images on un-patched drivers, so if you see any un-expected problems, let me know
and I can test those specific images.

From your previous testing, you know the first commit should be OK for DFS, and the
last commit (172) is not.  To bisect, choose an image in the middle (ie, commit 86)
and see if it works.  If so, choose middle one between 86 and 172, if not, choose middle one
between 0 and 86...repeat until you find the first bad commit and let me know what that
is and I will try to figure out the problem in the firmware.

http://www.candelatech.com/downloads/ath10k-fw-all-images/

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
