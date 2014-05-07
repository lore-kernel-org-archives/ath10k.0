Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi2aE-0002ol-2R
 for ath10k@lists.infradead.org; Wed, 07 May 2014 14:12:31 +0000
Message-ID: <536A3F1E.8040509@candelatech.com>
Date: Wed, 07 May 2014 07:11:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : ath10k does not support selection antenna yet?
References: <53461A8A.4030209@candelatech.com>
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
 <CALhHN=p-=HoyOtfDy6xkrT66aXPfX3gi3cqHZTN+kNj1PRVUgA@mail.gmail.com>
In-Reply-To: <CALhHN=p-=HoyOtfDy6xkrT66aXPfX3gi3cqHZTN+kNj1PRVUgA@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 05/07/2014 02:26 AM, Janusz Dziedzic wrote:
> On 7 May 2014 10:16, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>>> I read in the debug's page that ath10k HW is currently limited to handle only single fixed rate setting or limit number of used spatial streams. Does it mean that the selection of antenna is not possible for this moment? Because if I look in the code of ath9k, there are 2 fonctions set_antenna and get_antenna in the structure: struct ieee80211_ops (file main.c) and that's why the out put of "iw list" for ath10k give me: Available Antennas:  TX0 RX0 and I can not select the antenna?
>>
>>> I'm not aware if that's possible.
>>
>> Thank you for your response. I think if the select and set antenna work, the out put of "iw list" may have some thing like this:
>>         Available Antennas: TX 0x3 RX 0x3
>>         Configured Antennas: TX 0x1 RX 0x1

From looking at the 10.1.467 firmware, it appears it would support setting
the tx and rx chainmask, and it seems the ath10k driver has at least some
of the support needed to implement this.  grep for TX_CHAIN_MASK.

I do NOT see a way in standard firmware to read the current chainmask.

I have a way to read this in my customized firmware, but I have not yet
tied it into the driver, and I am not certain my current method is the best option
at this point...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
