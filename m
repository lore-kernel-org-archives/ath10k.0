Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from marchena.puc.rediris.es ([2001:720:418:ca00::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zellg-0008Vf-PN
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 15:15:38 +0000
Received: from [84.88.62.208] (helo=leo)
 by marchena.puc.rediris.es with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <jbaranda@cttc.es>) id 1ZeljB-0003xv-0E
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 17:13:01 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 259A41FE10
 for <ath10k@lists.infradead.org>; Wed, 23 Sep 2015 17:12:54 +0200 (CEST)
Message-ID: <5602C17A.6070509@cttc.es>
Date: Wed, 23 Sep 2015 17:12:58 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Sending lldp packets with ath10k in ADHOC mode
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Dear all,

I have a setup which consists of three computers connected by means of =

WLE900VX cards using the ath10k driver.
One computer (which we can call master) is equipped with two of these =

cards and I set different modes to connect the "master" with the other =

computers.
In particular, a pair of computers (master-computer A) is connected in =

ad-hoc mode and the other pair (master-computer B) is connected in =

AP-STA mode.

I want to send LLDP packets through both interfaces of master computer =

to perform link discovery. But I have realised that sending LLDP =

messages is only possible through the
interface configured as AP. Nevertheless, I've seen that the ad-hoc =

interface is able to send ARP broadcast messages.
Due to this fact, when generating the LLDP packets I set as destination =

MAC address the broadcast one, but even so, the ad-hoc interface is not =

sending the LLDP messages.
Does anyone have an idea of the reason of this behavior? Which is =

treating differently the ARP and the LLDP packet?
I was expecting the ad-hoc interface to forward any kind of packet with =

mac destination address the broadcast address.

Thank you very much in advance for your time and attention,

With kind regards,

-- =

Jorge Baranda
Research Engineer, MSc
jorge.baranda@cttc.es

Centre Tecnol=F2gic de Telecomunicacions de Catalunya (CTTC)
Av. Carl Friedrich Gauss, 7
08860 Castelldefels, Barcelona (Spain)
Tel: +34 93 645 29 00  Ext: 2171
Fax. +34 93 645 29 01
www.cttc.es


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
