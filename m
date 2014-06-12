Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvBWQ-00038z-JR
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 20:22:55 +0000
Message-ID: <539A0C06.6050105@candelatech.com>
Date: Thu, 12 Jun 2014 13:22:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: RE : ath10k: firmware crash in station mode & problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <53889A89.90802@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>,
 <538CAACA.2030202@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>,
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC .local>,
 <538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>,
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>,
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
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

On 06/12/2014 01:48 AM, Vu Hai NGUYEN wrote:
>> Can you please try this firmware:
>>
>> http://www.candelatech.com/downloads/firmware-2-community-scan-X.bin
>>
>> I have verified that it works fine for me when connecting to an
>> AP on a DFS channel.  It should have the bridging fix as well.
>>
>> There was an inverted beacon-filter setting bug in my code, though that
>> also should have been fixed in the previous firmware I sent you.
>>
>> I might have had some other problem in that older firmware, however.
> 
> Thank you, your new firmware work fine with DFS channel and promiscuous mode.
> But there is a small bug, with the firmware 10.1 my station can associate with AP directly
> after running wpa_supplicant. Your firmware had this:
> wlan0: direct probe to (@ mac) (try 1/3)
> wlan0: direct probe to (@ mac) (try 2/3)
> wlan0: direct probe to (@ mac) (try 3/3)
> and I have to run "iw wlan0 scan" to detect the network again and connect to it.
> I've tested it with different channels DFS for 2 version of firmware (yours and 10.1)
> so I'm quite sure about it.

I put a new series of patches (one build for every commit in my tree)
here.  This has the scan fix in place (at around build 70 or so)
so hopefully a bisect will work OK for you.

http://www.candelatech.com/downloads/ath10k-fw-all-images/

If you bisect the problem, please let me know the results
and I'll try to track down the problem.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
