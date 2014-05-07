Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi3U4-0000Vk-Cb
 for ath10k@lists.infradead.org; Wed, 07 May 2014 15:10:13 +0000
Message-ID: <536A4CB8.7080905@candelatech.com>
Date: Wed, 07 May 2014 08:09:44 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k does not support selection antenna yet?
References: <53461A8A.4030209@candelatech.com>
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
 <87sip3mdzr.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB0@srvexch01.SODIELEC.local>,
 <CA+BoTQkChYC+sTy4MSFCbGDvNoGHRko=Oxbkj=hVy+EQ4LP1Gg@mail.gmail.com>,
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB2@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB8@srvexch01.SODIELEC.
 local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB8@srvexch01.SODIELEC.local>
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


Can you let me know what command you used to get this firmware
crash?


On 05/07/2014 12:36 AM, Vu Hai NGUYEN wrote:

> But with the version from ath master tree, I always get wlan0: link is not ready (and there is no backtrace msg).
> And in both versions, the firmware usually crashed when I set a channel lower than 52 (I don't get backtrace msg in these cases):
> 
> wlan0: AP-ENABLED
> ath10k: firmware crashed!
> ath10k: hardware name qca988x hw2.0 version 0x4100016c
> ath10k: firmware version: 10.1.467.2-1
> ath10k: target register Dump Location: 0x0040AAA4
> ath10k: target Register Dump
> ath10k: [00]: 0x4100016C 0x000015B3 0x0099F306 0x00955B31
> ath10k: [04]: 0x0099F306 0x00060530 0x00000005 0x00000000
> ath10k: [08]: 0x009B8164 0x004118C4 0x0043DD84 0x00400000
> ath10k: [12]: 0x00000009 0xFFFFFFFF 0x0095808C 0x009580A2
> ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
> ath10k: [20]: 0x4099F306 0x0040ABB4 0x00955A00 0x00000003
> ath10k: [24]: 0x809995A1 0x0040AC14 0x0040ACB4 0xC099F306
> ath10k: [28]: 0x80999400 0x0040AC44 0x004343F0 0x0040ACCC
> ath10k: [32]: 0x8098CE0E 0x0040AC64 0x004343F0 0x0040ACCC
> ath10k: [36]: 0x809912AC 0x0040AC84 0x004343F0 0x0040ACCC
> ath10k: [40]: 0x8099147A 0x0040ACA4 0x0041ED48 0x00434488
> ath10k: [44]: 0x80991661 0x0040AD24 0x00000000 0x0042F2A0
> ath10k: [48]: 0x8099081C 0x0040AD84 0x00434488 0x0042F1CC
> ath10k: [52]: 0x809909D0 0x0040ADA4 0x00000000 0x0042D704
> ath10k: [56]: 0x809968F1 0x0040AEC4 0x0041ED48 0x00000000
> ath10k: suspend timed out - target pause event never came
> ieee80211 phy0: Hardware restart was requested
> ath10k: device successfully recovered


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
