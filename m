Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsZpZ-0006VF-HO
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 15:43:54 +0000
Message-ID: <53909022.5050904@candelatech.com>
Date: Thu, 05 Jun 2014 08:43:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC .local>,
 <538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>
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

On 06/05/2014 01:41 AM, Vu Hai NGUYEN wrote:
>> Ok, I have built an image for each of my commits, and I have attempted to rebase my changes
>> so that these kernels should work on un-patched drivers.  I have not actually tested these
>> various images on un-patched drivers, so if you see any un-expected problems, let me know
>> and I can test those specific images.
>>
>>From your previous testing, you know the first commit should be OK for DFS, and the
> l>ast commit (172) is not.  To bisect, choose an image in the middle (ie, commit 86)
>> and see if it works.  If so, choose middle one between 86 and 172, if not, choose middle one
>> between 0 and 86...repeat until you find the first bad commit and let me know what that
>> is and I will try to figure out the problem in the firmware.
>>
>> http://www.candelatech.com/downloads/ath10k-fw-all-images/
> 
> Thanks for building the image, I found out the diffrent is between the the 58th (work with DFS) and 59th commit (can not see DFS).
> Here is my serial of test: 86: KO => 43 OK => 64 KO => 53 OK => 58 OK => 61 KO => 59 KO. Then I change between 58 and 59th commit one more time to confirm the different. 
> Is that all of your commit that you've done? Cause with the firmware-2-ct-non-commercial.bin I can enter promiscuous mode to set up bridge network, but yesterday I tried your 2 firmwares 
> and today with the firmware of 172th commit they are all broke in bridge network.

Ok, I will look at the 59th commit today.

As for commit 172, it should be virtually identical to the firmware-2-ct-non-commercial.bin

I will double-check that I didn't miss some commit.

Can you try each of these and let me know if they work for promisc mode?

http://www.candelatech.com/downloads/firmware-2-ct-community-3.bin
http://www.candelatech.com/downloads/firmware-2-ct-community-2.bin
http://www.candelatech.com/downloads/firmware-2-ct-community-1.bin

And, in case it's a bit of a race, maybe try rebooting with each firmware
several times to see if it works in promisc sometimes and not others?

Thanks,
Ben


> If not, can you rebuild other image so that I can trace your commit that allow to enter promiscuous mode?
> 
> Thanks,
> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
> 
> 
> 
> 
> 
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
