Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdGjq-00084y-Iq
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 10:18:42 +0000
Received: by mail-ve0-f172.google.com with SMTP id jx11so2677620veb.3
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 03:18:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkChYC+sTy4MSFCbGDvNoGHRko=Oxbkj=hVy+EQ4LP1Gg@mail.gmail.com>
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
Date: Thu, 24 Apr 2014 18:18:21 +0800
Message-ID: <CAEFj985VFPTqn5p64iv4pWFTwQUSDMA0LgsB_P2Ef2q3UeSAVg@mail.gmail.com>
Subject: Re: RE : RE : Report Firmware firmware-2.bin_10.1.467.2-1 Error
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> To be clear - ath10k is incapable of reporting "tx bitrate" (it always
> reports 6mbps). If you want to verify if the bitrate mask works you
> must check "rx bitrate" on the other side, i.e. on the connected
> client.
>
> Or just use a separate sniffer and see if AP is sends frames with
> different txpower/bitrate values.
>

For TxRate, another option would be looking at
"/sys/kernel/debug/ieee80211/phy0/ath10k/fw_stats".

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
