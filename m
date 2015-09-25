Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfNyl-0001Ms-9W
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 08:03:40 +0000
Received: from [84.88.62.208] (helo=leo)
 by rudy.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jbaranda@cttc.es>) id 1ZfNyM-0004c8-Os
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 10:03:15 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id D05931FE10
 for <ath10k@lists.infradead.org>; Fri, 25 Sep 2015 10:03:09 +0200 (CEST)
Message-ID: <5604FFC2.8020405@cttc.es>
Date: Fri, 25 Sep 2015 10:03:14 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Re: Sending lldp packets with ath10k in ADHOC mode
References: <5602C17A.6070509@cttc.es>
In-Reply-To: <5602C17A.6070509@cttc.es>
Content-Type: multipart/mixed; boundary="------------060909000603010005080906"
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This is a multi-part message in MIME format.
--------------060909000603010005080906
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Dear all,

I upload a wireshark capture to illustrate the behavior previously=20
described. This wireshark is showing the traffic in the "master" computer.
It is suppossed that both interfaces should be sending periodicall LLDP=20
packets (with broadcast mac dst addr), but only the one configured in AP=20
mode is sending such packets.
However, when I try to look for a host through the interface configure=20
in ad-hoc, the ARP process starts with the broadcast ARP request and=20
this message is sent (and registered bywireshark) through the interface=20
configure in  ad-hoc. Does the ath10k driver has to do something with=20
the different treatment of the broadcast packets/protocols?
Aparently, all broadcast packets should be sent by the wireless=20
interface no matter its configuration (AP or ad-hoc), isn't it?

Thanks in advance,

Jorge


El 23/09/15 17:12, Jorge Baranda escribi=F3:
> Dear all,
>
> I have a setup which consists of three computers connected by means of=20
> WLE900VX cards using the ath10k driver.
> One computer (which we can call master) is equipped with two of these=20
> cards and I set different modes to connect the "master" with the other=20
> computers.
> In particular, a pair of computers (master-computer A) is connected in=20
> ad-hoc mode and the other pair (master-computer B) is connected in=20
> AP-STA mode.
>
> I want to send LLDP packets through both interfaces of master computer=20
> to perform link discovery. But I have realised that sending LLDP=20
> messages is only possible through the
> interface configured as AP. Nevertheless, I've seen that the ad-hoc=20
> interface is able to send ARP broadcast messages.
> Due to this fact, when generating the LLDP packets I set as=20
> destination MAC address the broadcast one, but even so, the ad-hoc=20
> interface is not sending the LLDP messages.
> Does anyone have an idea of the reason of this behavior? Which is=20
> treating differently the ARP and the LLDP packet?
> I was expecting the ad-hoc interface to forward any kind of packet=20
> with mac destination address the broadcast address.
>
> Thank you very much in advance for your time and attention,
>
> With kind regards,
>


--=20
Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


--------------060909000603010005080906
Content-Type: application/octet-stream;
 name="arp_lldp_packets.pcapng"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="arp_lldp_packets.pcapng"

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
VAAAAA==
--------------060909000603010005080906
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--------------060909000603010005080906--
