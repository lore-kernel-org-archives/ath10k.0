Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WulyA-0002Hh-E3
 for ath10k@lists.infradead.org; Wed, 11 Jun 2014 17:05:50 +0000
Message-ID: <53988C53.6030806@candelatech.com>
Date: Wed, 11 Jun 2014 10:05:23 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : RE : RE : RE : RE : ath10k: firmware crash in station mode
 & problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>,
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>
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

On 06/11/2014 12:19 AM, Vu Hai NGUYEN wrote:
>> Can you explain how you test this?  Do I need a special AP configuration
>> to do the test, or is a normal ath10k NIC and hostapd enough?
>>
>> I can try to reproduce the problem and test the fixes here.
> 
> In my code, I copy the firmware chosen (10.1, 999 or CT) from another folder to /lib/firmware/ath10k/... 
> before loading the modules of ath10k. Then I set up network (bridge or router) and finally run hostapd (if AP)
> and wpa_supplicant (if STA). Each time I change a parameter of my network the program will kill almost 
> all the actual processus, unload the modules and then reload, run new processus ....
> 
> Btw, I think that there is a conflict in your hostapd config file. I saw that you use channel 52 and 
> vht_oper_centr_freq_seg0_idx=54, it means that you use 40 MHz operating Channel width?
> If so  vht_oper_chwidth=1 should be set to 0. If you want to use 80Mhz Channel width you should 
> set vht_oper_centr_freq_seg0_idx=58.

Can you please try this firmware:

http://www.candelatech.com/downloads/firmware-2-community-scan-X.bin

I have verified that it works fine for me when connecting to an
AP on a DFS channel.  It should have the bridging fix as well.

There was an inverted beacon-filter setting bug in my code, though that
also should have been fixed in the previous firmware I sent you.

I might have had some other problem in that older firmware, however.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
