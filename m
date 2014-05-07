Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Why7n-0002WD-Cb
 for ath10k@lists.infradead.org; Wed, 07 May 2014 09:26:52 +0000
Received: by mail-lb0-f175.google.com with SMTP id l4so946675lbv.34
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 02:26:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBA@srvexch01.SODIELEC.local>
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
 <87sip3mdzr.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB0@srvexch01.SODIELEC.local>
 <CA+BoTQkChYC+sTy4MSFCbGDvNoGHRko=Oxbkj=hVy+EQ4LP1Gg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB2@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCB8@srvexch01.SODIELEC.local>
 <CA+BoTQ=+SBBL2JYtPf1KoVCtMmuKggEaHbUa0bCL4W-biVMeAg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBA@srvexch01.SODIELEC.local>
Date: Wed, 7 May 2014 11:26:25 +0200
Message-ID: <CALhHN=p-=HoyOtfDy6xkrT66aXPfX3gi3cqHZTN+kNj1PRVUgA@mail.gmail.com>
Subject: Re: RE : ath10k does not support selection antenna yet?
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 7 May 2014 10:16, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>> I read in the debug's page that ath10k HW is currently limited to handle only single fixed rate setting or limit number of used spatial streams. Does it mean that the selection of antenna is not possible for this moment? Because if I look in the code of ath9k, there are 2 fonctions set_antenna and get_antenna in the structure: struct ieee80211_ops (file main.c) and that's why the out put of "iw list" for ath10k give me: Available Antennas:  TX0 RX0 and I can not select the antenna?
>
>>I'm not aware if that's possible.
>
> Thank you for your response. I think if the select and set antenna work, the out put of "iw list" may have some thing like this:
>         Available Antennas: TX 0x3 RX 0x3
>         Configured Antennas: TX 0x1 RX 0x1
>
>
>>> Btw, I still try to deal with the bitrates problem, the file  /sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats give me nothing when I "cat" it and if I run : "iw wlan0 set bitrates legacy-2.4 54 ht-mcs-2.4", the dmesg output is:
>
> fw_stats was broken for a long time due to some firmware ABI
> differences. I'm not sure if this was finally fixed or no. See mailing
> list archives for more details, please.
>
>
>>> ath10k: mac fixed rate pream 0x00 nss 0x00 rate 0x04
>>> ath10k: wmi vdev id 0x0 set param 25 value 4
>>> ath10k: wmi vdev id 0x0 set param 32 value 1
>>> ath10k: wmi vdev id 0x0 set param 26 value 0
>>> ath10k: wmi event debug mesg len 16
>>>
>>>but the order of these parameters are normally 27 (fixed rates) , 34 (nss)  and 28(sgi) in the map of parameter, I have no idea why the offset is minus 2 ?
>
>>You're looking at the wrong enum. There are two vdev param enums:
>>wmi_vdev_param and wmi_10x_vdev_param.
>
>>I'm going to re-iterate - you can check rx bitrate on the other end to
>>verify your fixed rate setting. tx bitrate reporting is broken in
>>ath10k due to firmware deficiency.
>
> I check the rx bit rates on my station and it always depend on the rates that is set on my station, it is not limitted by the access point (for example: I set bit rates equal 65 Mbps on my station and 39 Mbps on my access point, I get the rx bit rates on my station equal 65 Mbps (normally it is limitted at 39 Mbps because of the access point?)
>
Try to set bitrates after you are connected (STA) and ap started (AP).
This is only test command, so have some limitation.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
