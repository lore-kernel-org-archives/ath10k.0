Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0AlL-0005zZ-Oe
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 14:34:59 +0000
Message-ID: <53AC2F78.7080307@candelatech.com>
Date: Thu, 26 Jun 2014 07:34:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : Warning message in bridge mode
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
 <539F0393.1090009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F10997914@srvexch01.SODIELEC.local>
 <53A89D2E.6010708@candelatech.com>,
 <E37BEAE7-CCA9-4C79-9F24-051E867FC0F6@gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997915@srvexch01.SODIELEC.local>,
 <53A994F7.6090707@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7D5@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F15C1D7D5@srvexch01.SODIELEC.local>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bruno Antunes <baantunes@gmail.com>

On 06/26/2014 07:17 AM, Vu Hai NGUYEN wrote:
> Hi Ben,
> Can you create a firmware that is the same as 10.1.467-2-1 but include yo=
ur fix for promiscuous mode?
> I would like to do the test of rate in bridge network to see if the perfo=
rmance is better or not.
> But as your firmware contain other commit that might make the rate slower=
 so I would like to ask you could create
> this version of firmware.

It would not be easy for me to do that.  While you found a single patch that
fixed the crash for you, I believe it is also dependent on many patches that
came before that one as well.

For your throughput tests, are you using UDP or TCP?  You might try TCP in
case you are hitting the same packet-reordering issue reported in another
email thread.

At least for standard operation (ie, no software-crypt), I doubt my
changes to the firmware had any significant impact on performance
or throughput.

Thanks,
Ben


> Thanks in advance,
> =

> NGUYEN Vu Hai
> Acita-Sodielec
> Route de Mayres - B.P. 9
> 12100 St GEORGES DE LUZENCON
> FRANCE
> =

> ________________________________________
> De : Ben Greear [greearb@candelatech.com]
> Date d'envoi : mardi 24 juin 2014 17:10
> =C0 : Vu Hai NGUYEN; Bruno Antunes
> Cc : Patrick CARNEIRO RODRIGUEZ; ath10k@lists.infradead.org
> Objet : Re: RE : Warning message in bridge mode
> =

> On 06/24/2014 12:39 AM, Vu Hai NGUYEN wrote:
> =

>> I was wrong, the only warning msg is "br0: received packet on wlan0.sta1=
 with own address as source address".
>> And I have another question: When doing test with iperf, I always have r=
ate from AP to STA higher than STA to AP
>> (380Mbps vs 240 Mbps).This is normal too right? Cause before you told me=
 that when you did the test with your
>> own trafficgenerator, you can get 500+Mbps download, and about 400Mbps u=
pload.
> =

> We have done some tests recently on E5 3.7Ghz systems (ie, top-end-ish se=
rver systems)
> that can push 800+Mbps UDP, but can't recall if that is upload or downloa=
d.
> =

> We need to re-run tests and publish the info.
> =

> Looks like host CPU is very important to higher-speeds with ath10k.  I di=
d a perf top
> months ago, and there was bad contention on a spinlock or two in ath10k d=
river, so that
> is probably much of the performance problems we see.
> =

> Thanks,
> Ben
> =

> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
> =



-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
