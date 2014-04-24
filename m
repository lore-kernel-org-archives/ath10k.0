Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdDGA-0004Do-DF
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 06:35:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : Report Firmware  firmware-2.bin_10.1.467.2-1 Error
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
 <CA+BoTQkAv_OrJ5cM-wp_fhdb01KV62gLqkXaSikYv9pS9t25eQ@mail.gmail.com>
 <8738hgfi1k.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4838@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F06CC4839@srvexch01.SODIELEC.local>
 <87eh0yetyx.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F06CC483A@srvexch01.SODIELEC.local>
Date: Thu, 24 Apr 2014 09:35:20 +0300
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F06CC483A@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Wed, 16 Apr 2014 13:51:04 +0200")
Message-ID: <87sip3mdzr.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> There's another problem: when I used the firmware version 999.999 some
> times when I ran my program and change the parameter of configuration,
> the firmware crash and I got a output dmesg which indicate a strange
> version of firmware (1.0.0.636 ???) :
>
> ath10k: firmware crashed!                                                       
> ath10k: hardware name qca988x hw2.0 version 0x4100016c                          
> ath10k: firmware version: 1.0.0.636 
> ath10k: target register Dump Location: 0x00401930                               
> ath10k: target Register Dump                                                    
> ath10k: [00]: 0x4100016C 0x00000000 0x0098E3A9 0x00000000                       
> ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098E3A9                       
> ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000                       
> ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000                       
> ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000    
>
> and then It reload the firmware 999.999.  :
>
> ath10k: firmware 999.999.0.636 booted
>
> You can see the output of my dmesg 

The patch below should fix it. I suspect you don't have that.

commit 5ba88b395cb447af756d12411456024d65a07814
Author: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Date:   Tue Jan 21 17:21:21 2014 +0800

    ath10k: fix the printing of 10.x FW version when FW crashed
    
    10.x FW has no structure member sw_version_1. Thus,
    both fw_version_release and fw_version_build are not
    available. The provided fw_version_major is also wrong.
    Fix this by using the fw_version from struct wiphy.
    
    Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
