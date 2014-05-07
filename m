Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Whx20-0006hh-Td
 for ath10k@lists.infradead.org; Wed, 07 May 2014 08:16:49 +0000
Received: by mail-ve0-f175.google.com with SMTP id jw12so800907veb.20
 for <ath10k@lists.infradead.org>; Wed, 07 May 2014 01:16:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=+SBBL2JYtPf1KoVCtMmuKggEaHbUa0bCL4W-biVMeAg@mail.gmail.com>
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
Date: Wed, 7 May 2014 16:16:27 +0800
Message-ID: <CAEFj987P6RKe5wiY1KrfMW5K-Sh++wvJ4j_Yqw9aOu8pAWDH9Q@mail.gmail.com>
Subject: Re: ath10k does not support selection antenna yet?
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
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> fw_stats was broken for a long time due to some firmware ABI
> differences. I'm not sure if this was finally fixed or no. See mailing
> list archives for more details, please.

The master branch in https://github.com/kvalo/ath should have the
fixing the FW print stats.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
